// DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.01.dmn by input/L3/dmn2cql.py; regenerate it, never edit it.
Instance: MEASLESDT01
InstanceOf: $SGLibrary
Title: "MEASLES.DT.01 Determine measles-containing vaccine dose due (logic)"
Usage: #definition
* name = "MEASLESDT01"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $library-type#logic-library
* description = "CQL of MEASLES.DT.01, rule for rule; derived from input/decision-logic/MEASLES.DT.01.dmn."
* content.id = "ig-loader-MEASLESDT01.cql"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CQL of MEASLES.DT.01 Determine measles-containing vaccine dose due, rule for rule, derived from <code>input/decision-logic/MEASLES.DT.01.dmn</code> by <code>input/L3/dmn2cql.py</code>. The CQL itself is this Library's content.</p></div>"

Instance: MEASLES.DT.01
InstanceOf: $SGDecisionTable
Title: "MEASLES.DT.01 Determine measles-containing vaccine dose due"
Usage: #definition
* name = "MEASLESDT01PlanDefinition"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $plan-definition-type#eca-rule
* description = "Which MCV dose, if any, a client needs today, from the doses DT.03 counted as valid. Hit policy FIRST. Derived from Table 1's measles footnote and Table 3's measles row (input/L2/provenance.json). Adjudication: pending. L3 of input/decision-logic/MEASLES.DT.01.dmn."
* library = Canonical(MEASLESDT01)
* action[+].title = "Rule 1: none"
* action[=].description = "Series complete: two valid routine doses; no booster."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 1 fires"
* action[+].title = "Rule 2: none"
* action[=].description = "Too young: no MCV dose before 6 months."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 2 fires"
* action[+].title = "Rule 3: MCV0"
* action[=].description = "Supplementary dose: an infant aged 6-8 months in a situation the footnote lists."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 3 fires"
* action[+].title = "Rule 4: none"
* action[=].description = "MCV1 not yet due."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 4 fires"
* action[+].title = "Rule 5: MCV1"
* action[=].description = "First routine dose (from 9 months where measles transmission and mortality risk are high; at any older age if missed)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 5 fires"
* action[+].title = "Rule 6: MCV1"
* action[=].description = "First routine dose (from 12 months where measles transmission is low; at any older age if missed)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 6 fires"
* action[+].title = "Rule 7: none"
* action[=].description = "MCV1 due at 12 months in this schedule."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 7 fires"
* action[+].title = "Rule 8: none"
* action[=].description = "Too soon: at least 4 weeks between MCV1 and MCV2."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 8 fires"
* action[+].title = "Rule 9: MCV2"
* action[=].description = "Second routine dose (from 15 months; at any older age if missed)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 9 fires"
* action[+].title = "Rule 10: MCV2"
* action[=].description = "Late start: a child who began after 12 months gets the second dose 4 weeks after the first."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 10 fires"
* action[+].title = "Rule 11: none"
* action[=].description = "MCV2 due at 15 months."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 11 fires"
* action[+].title = "Rule 12: unknown"
* action[=].description = "Not settled: a required fact (doses, age or schedule setting) is missing."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 12 fires"
