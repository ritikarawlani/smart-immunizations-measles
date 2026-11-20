"""Derive the L3 CQL library and FSH decision-table PlanDefinition of each L2
DMN decision table (input/decision-logic/*.dmn), mechanically, so the L3
logic is the L2 table rule for rule.

    python3 input/L3/dmn2cql.py            # write input/cql/*.cql and input/fsh/decisions/*.fsh
    python3 input/L3/dmn2cql.py --check    # exit 1 if either is stale

Each table's inputs become CQL parameters; rule N becomes "Rule N" (its
input entries) and "Rule N fires" (rule N and no earlier rule: hit policy
FIRST); each output column becomes a case over the firing rules. A DMN unary
test maps to CQL: '-' -> true, 'true'/'false' -> is true/is false,
'"x","y"' -> in {'x','y'}, '< n', '>= n', ... -> comparison. A comparison
with a null input is null; each rule is Coalesce(..., false), so a null
input does not match, as in DMN, and "not" over earlier rules stays boolean.
"""
import re, sys, glob, xml.etree.ElementTree as ET
from pathlib import Path

NS = {"d": "https://www.omg.org/spec/DMN/20191111/MODEL/"}
ROOT = Path(__file__).resolve().parents[2]
CQLTYPE = {"number": "Decimal", "boolean": "Boolean", "string": "String"}


def unary(cell: str, var: str, typ: str) -> str:
    c = cell.strip()
    if c == "-":
        return "true"
    if c in ("true", "false"):
        return f"{var} is {c}"
    if c.startswith('"'):
        vals = ", ".join("'" + v.strip().strip('"') + "'" for v in c.split(","))
        return f"{var} in {{ {vals} }}"
    m = re.fullmatch(r"(<=|>=|<|>)\s*(-?[\d.]+)", c)
    if m:
        return f"{var} {m[1]} {float(m[2])}"
    if re.fullmatch(r"-?[\d.]+", c):
        return f"{var} = {float(c)}"
    raise SystemExit(f"unsupported unary test {c!r}")


def lit(s: str) -> str:
    return "'" + s.replace("\\", "\\\\").replace("'", "\\'") + "'"


def derive(dmn: Path):
    t = ET.parse(dmn).getroot()
    dec = t.find("d:decision", NS)
    did = dec.get("id")  # MEASLES.DT.01
    lib = did.replace(".", "")  # MEASLESDT01
    table = dec.find("d:decisionTable", NS)
    ins = [(i.get("label"), i.find("d:inputExpression/d:text", NS).text, i.find("d:inputExpression", NS).get("typeRef")) for i in table.findall("d:input", NS)]
    outs = [(o.get("label"), o.get("name")) for o in table.findall("d:output", NS)]
    rules = table.findall("d:rule", NS)
    src = f"input/decision-logic/{dmn.name}"
    C = [f"/*", f" * {did} {dec.get('name')}", f" * DERIVED from the L2 decision table {src} by input/L3/dmn2cql.py;",
         " * regenerate it, never edit it. Hit policy FIRST. Adjudication: pending.", " */",
         f"library {lib} version '0.1.0'", ""]
    for label, name, typ in ins:
        C.append(f"// {label}")
        C.append(f"parameter {name} {CQLTYPE[typ]}")
    C.append("")
    for n, r in enumerate(rules, 1):
        conds = [unary(e.find("d:text", NS).text, name, typ) for e, (_, name, typ) in zip(r.findall("d:inputEntry", NS), ins)]
        conds = [c for c in conds if c != "true"] or ["true"]
        desc = (r.findtext("d:description", default="", namespaces=NS) or "").replace("*/", "* /")
        C.append(f"/* Rule {n}: {desc} */")
        C.append(f'define "Rule {n}":\n  Coalesce(' + "\n    and ".join(conds) + ", false)")
        prev = " or ".join(f'"Rule {k}"' for k in range(1, n))
        C.append(f'define "Rule {n} fires":\n  "Rule {n}"' + (f" and not ({prev})" if prev else ""))
        C.append("")
    for k, (label, name) in enumerate(outs):
        C.append(f"// Output: {label}")
        C.append(f'define "{name}":\n  case')
        for n, r in enumerate(rules, 1):
            v = r.findall("d:outputEntry", NS)[k].findtext("d:text", namespaces=NS)
            v = v.strip()
            v = v[1:-1].replace('\\"', '"') if v.startswith('"') else v
            C.append(f'    when "Rule {n} fires" then {lit(v)}')
        C.append("    else null\n  end")
        C.append("")
    cql = "\n".join(C)

    F = [f"// DERIVED from the L2 decision table {src} by input/L3/dmn2cql.py; regenerate it, never edit it.",
         f"Instance: {lib}", "InstanceOf: $SGLibrary", f'Title: "{did} {dec.get("name")} (logic)"', "Usage: #definition",
         f'* name = "{lib}"', "* status = #draft", "* experimental = true", '* publisher = "WHO"', "* version = \"0.1.0\"",
         "* type = $library-type#logic-library",
         f'* description = "CQL of {did}, rule for rule; derived from {src}."',
         f'* content.id = "ig-loader-{lib}.cql"', "",
         f"Instance: {did}", "InstanceOf: $SGDecisionTable", f'Title: "{did} {dec.get("name")}"', "Usage: #definition",
         f'* name = "{lib}PlanDefinition"', "* status = #draft", "* experimental = true", '* publisher = "WHO"', "* version = \"0.1.0\"",
         "* type = $plan-definition-type#eca-rule",
         f'* description = "{(dec.findtext("d:description", namespaces=NS) or "").replace(chr(34), chr(39))} L3 of {src}."',
         f"* library = Canonical({lib})"]
    for n, r in enumerate(rules, 1):
        o = [e.findtext("d:text", namespaces=NS).strip().strip('"') for e in r.findall("d:outputEntry", NS)]
        F += [f'* action[+].title = "Rule {n}: {o[0]}"',
              f'* action[=].description = "{o[1].replace(chr(34), chr(39))}"',
              "* action[=].condition[+].kind = #applicability",
              "* action[=].condition[=].expression.language = #text/cql-identifier",
              f'* action[=].condition[=].expression.expression = "Rule {n} fires"']
    return lib, cql + "\n", "\n".join(F) + "\n"


def main(check: bool) -> int:
    stale = 0
    for dmn in sorted((ROOT / "input/decision-logic").glob("*.dmn")):
        lib, cql, fsh = derive(dmn)
        for path, text in ((ROOT / f"input/cql/{lib}.cql", cql), (ROOT / f"input/fsh/decisions/{lib}.fsh", fsh)):
            if check:
                if not path.exists() or path.read_text() != text:
                    print(f"stale: {path.relative_to(ROOT)}"); stale += 1
            else:
                path.parent.mkdir(parents=True, exist_ok=True); path.write_text(text); print(f"wrote {path.relative_to(ROOT)}")
    return 1 if stale else 0


if __name__ == "__main__":
    sys.exit(main("--check" in sys.argv))
