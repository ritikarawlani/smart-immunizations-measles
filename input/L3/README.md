# input/L3 — how the L3 artefacts are derived and checked

| what | derived from (L2) | how | checked by |
|---|---|---|---|
| `input/cql/MEASLESDT01-04.cql`, `input/fsh/decisions/*.fsh` (Library + SGDecisionTable PlanDefinition) | `input/decision-logic/MEASLES.DT.0*.dmn` | `python3 input/L3/dmn2cql.py` (`--check` fails when stale) | CQL→ELM translator 3.29.0, then `run-cql-tests.js`: the 28 L2 dummy clients, 28/28 pass |
| `input/cql/MEASLESIndicators.cql`, `input/fsh/measures.fsh` | `input/indicators/measles-indicators.csv` (IND.01, .02, .06, .07) | authored | translator; two dummy FHIR patients through cql-exec-fhir |
| `input/fsh/codesystem.fsh`, `valuesets.fsh`, `models/MeaslesVaccinationContact.fsh` | `input/dictionary/measles-core-data-elements.csv` | generated from the CSV (one concept per element and value) | SUSHI |
| `input/fsh/actors.fsh` | `input/pagecontent/personas.md` | authored | SUSHI |
| `input/fsh/requirements.fsh` | `input/system-requirements/measles-functional-requirements.csv` | generated from the CSV | SUSHI |

```sh
python3 input/L3/dmn2cql.py --check
npx sushi build .                                   # 0 errors, 0 warnings at the commit that added this
# compile CQL (cql-to-elm-cli 3.29.0 from Maven Central; FHIRHelpers 4.0.1 ships in its cqf-fhir jar):
java -cp "<lib>/*" org.cqframework.cql.cql2elm.cli.Main --input input/cql --output elm --format JSON
npm i cql-execution@3 && ELM_DIR=elm node input/L3/run-cql-tests.js
```

`provenance.json` records each L3 artefact's L2 source (`wasDerivedFrom`,
adjudication pending); `l3-readiness.json` is the readiness gate's record.
