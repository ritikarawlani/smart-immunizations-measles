// DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.03.dmn by input/L3/dmn2cql.py; regenerate it, never edit it.
Instance: MEASLESDT03
InstanceOf: $SGLibrary
Title: "MEASLES.DT.03 Count a recorded measles-containing vaccine dose (logic)"
Usage: #definition
* name = "MEASLESDT03"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $library-type#logic-library
* description = "CQL of MEASLES.DT.03, rule for rule; derived from input/decision-logic/MEASLES.DT.03.dmn."
* content.id = "ig-loader-MEASLESDT03.cql"

Instance: MEASLES.DT.03
InstanceOf: $SGDecisionTable
Title: "MEASLES.DT.03 Count a recorded measles-containing vaccine dose"
Usage: #definition
* name = "MEASLESDT03PlanDefinition"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $plan-definition-type#eca-rule
* description = "How one recorded MCV dose counts, evaluated dose by dose in date order. Hit policy FIRST. Adjudication: pending. L3 of input/decision-logic/MEASLES.DT.03.dmn."
* library = Canonical(MEASLESDT03)
* action[+].title = "Rule 1: not counted"
* action[=].description = "No written evidence: treat as not received and offer vaccination."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 1 fires"
* action[+].title = "Rule 2: invalid"
* action[=].description = "Given before the minimum age of 6 months: not valid; repeat as age-appropriate."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 2 fires"
* action[+].title = "Rule 3: MCV0"
* action[=].description = "Given before 9 months: a supplementary dose, recorded as MCV0; MCV1 and MCV2 still follow."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 3 fires"
* action[+].title = "Rule 4: invalid"
* action[=].description = "Less than 4 weeks after the previous MCV: not valid; repeat 4 weeks after this dose."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 4 fires"
* action[+].title = "Rule 5: MCV1"
* action[=].description = "The first valid routine dose, whatever it was recorded as."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 5 fires"
* action[+].title = "Rule 6: MCV2"
* action[=].description = "The second valid routine dose."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 6 fires"
* action[+].title = "Rule 7: extra"
* action[=].description = "Series already complete; this dose is not needed."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 7 fires"
* action[+].title = "Rule 8: unknown"
* action[=].description = "Not settled: the dose date, age or earlier doses are missing."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 8 fires"
