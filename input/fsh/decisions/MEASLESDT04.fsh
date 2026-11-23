// DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.04.dmn by input/L3/dmn2cql.py; regenerate it, never edit it.
Instance: MEASLESDT04
InstanceOf: $SGLibrary
Title: "MEASLES.DT.04 Additional measles dose for a child living with HIV on HAART (logic)"
Usage: #definition
* name = "MEASLESDT04"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $library-type#logic-library
* description = "CQL of MEASLES.DT.04, rule for rule; derived from input/decision-logic/MEASLES.DT.04.dmn."
* content.id = "ig-loader-MEASLESDT04.cql"

Instance: MEASLES.DT.04
InstanceOf: $SGDecisionTable
Title: "MEASLES.DT.04 Additional measles dose for a child living with HIV on HAART"
Usage: #definition
* name = "MEASLESDT04PlanDefinition"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $plan-definition-type#eca-rule
* description = "Whether an HIV-infected child receiving HAART needs the additional MCV dose after immune reconstitution. Hit policy FIRST. Adjudication: pending. L3 of input/decision-logic/MEASLES.DT.04.dmn."
* library = Canonical(MEASLESDT04)
* action[+].title = "Rule 1: no"
* action[=].description = "Not HIV-infected."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 1 fires"
* action[+].title = "Rule 2: no"
* action[=].description = "Additional dose already given."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 2 fires"
* action[+].title = "Rule 3: no"
* action[=].description = "Not on HAART: no additional dose yet; an infant at high risk may get MCV0 (DT.01)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 3 fires"
* action[+].title = "Rule 4: yes"
* action[=].description = "Immune reconstitution reached (CD4+ 20-25% or more)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 4 fires"
* action[+].title = "Rule 5: no"
* action[=].description = "Wait for immune reconstitution (CD4+ 20-25%)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 5 fires"
* action[+].title = "Rule 6: yes"
* action[=].description = "CD4+ not monitored: give 6-12 months after HAART started."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 6 fires"
* action[+].title = "Rule 7: no"
* action[=].description = "Due 6-12 months after HAART started."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 7 fires"
* action[+].title = "Rule 8: unknown"
* action[=].description = "Not settled: HIV status, HAART or CD4+ facts are missing."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 8 fires"
