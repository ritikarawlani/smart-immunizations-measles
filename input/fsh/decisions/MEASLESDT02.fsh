// DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.02.dmn by input/L3/dmn2cql.py; regenerate it, never edit it.
Instance: MEASLESDT02
InstanceOf: $SGLibrary
Title: "MEASLES.DT.02 Screen before measles vaccination (logic)"
Usage: #definition
* name = "MEASLESDT02"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $library-type#logic-library
* description = "CQL of MEASLES.DT.02, rule for rule; derived from input/decision-logic/MEASLES.DT.02.dmn."
* content.id = "ig-loader-MEASLESDT02.cql"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CQL of MEASLES.DT.02 Screen before measles vaccination, rule for rule, derived from <code>input/decision-logic/MEASLES.DT.02.dmn</code> by <code>input/L3/dmn2cql.py</code>. The CQL itself is this Library's content.</p></div>"

Instance: MEASLES.DT.02
InstanceOf: $SGDecisionTable
Title: "MEASLES.DT.02 Screen before measles vaccination"
Usage: #definition
* name = "MEASLESDT02PlanDefinition"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $plan-definition-type#eca-rule
* description = "Whether to vaccinate today, defer, or not vaccinate. Hit policy FIRST. A mild concurrent infection is not a reason to defer. Adjudication: pending. L3 of input/decision-logic/MEASLES.DT.02.dmn."
* library = Canonical(MEASLESDT02)
* action[+].title = "Rule 1: do-not-vaccinate"
* action[=].description = "History of anaphylaxis or severe allergy to a component (e.g. neomycin, gelatin)."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 1 fires"
* action[+].title = "Rule 2: do-not-vaccinate"
* action[=].description = "Severe immunosuppression."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 2 fires"
* action[+].title = "Rule 3: defer"
* action[=].description = "Pregnant: vaccinate after the pregnancy."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 3 fires"
* action[+].title = "Rule 4: defer"
* action[=].description = "Another live vaccine less than 4 weeks ago: give on the same day or wait until 4 weeks have passed."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 4 fires"
* action[+].title = "Rule 5: proceed"
* action[=].description = "No contraindication; a mild concurrent infection does not count."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 5 fires"
* action[+].title = "Rule 6: unknown"
* action[=].description = "Not settled: ask about allergy, immunosuppression and pregnancy."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/cql-identifier
* action[=].condition[=].expression.expression = "Rule 6 fires"
