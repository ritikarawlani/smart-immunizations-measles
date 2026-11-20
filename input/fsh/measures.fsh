// L3 of input/indicators/measles-indicators.csv (MEASLES.IND.*). Logic: input/cql/MEASLESIndicators.cql.
// IND.03/.04 (districts by coverage band) and IND.05 (late MCV1 doses) are aggregate counts over
// districts and doses, not patient-level Measures: see the gap report.
Instance: MEASLESIndicators
InstanceOf: $SGLibrary
Title: "Measles indicators (logic)"
Usage: #definition
* name = "MEASLESIndicators"
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* type = $library-type#logic-library
* description = "CQL for the measles indicator Measures; L3 of input/indicators/measles-indicators.csv."
* content.id = "ig-loader-MEASLESIndicators.cql"

RuleSet: MeaslesMeasure
* status = #draft
* experimental = true
* publisher = "WHO"
* version = "0.1.0"
* library = Canonical(MEASLESIndicators)
* improvementNotation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase

Instance: MEASLES.IND.01
InstanceOf: $SGMeasure
Usage: #definition
* insert MeaslesMeasure
* name = "MEASLESIND01"
* title = "MCV1 coverage"
* description = "Percentage of surviving infants who received MCV1 (JRF 2016 row 4160). Denominator interpreted as registered children who turned 1 in the period."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND01 Denominator"
* group[=].population[+].code = $measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND01 Denominator"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND01 Numerator"

Instance: MEASLES.IND.02
InstanceOf: $SGMeasure
Usage: #definition
* insert MeaslesMeasure
* name = "MEASLESIND02"
* title = "MCV2 coverage"
* description = "Percentage of the MCV2 target population who received MCV2 (JRF 2016 row 4180). Denominator interpreted as registered children who turned 2 in the period."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND02 Denominator"
* group[=].population[+].code = $measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND02 Denominator"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND02 Numerator"

Instance: MEASLES.IND.06
InstanceOf: $SGMeasure
Usage: #definition
* insert MeaslesMeasure
* name = "MEASLESIND06"
* title = "MCV1-MCV2 dropout"
* description = "Percentage of children with MCV1 who have no MCV2, among children who turned 2 in the period."
* improvementNotation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#decrease
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND06 Denominator"
* group[=].population[+].code = $measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND06 Denominator"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND06 Numerator"

Instance: MEASLES.IND.07
InstanceOf: $SGMeasure
Usage: #definition
* insert MeaslesMeasure
* name = "MEASLESIND07"
* title = "Confirmed measles cases"
* description = "Number of patients with a confirmed measles case recorded in the period (JRF 2016 row 1020)."
* scoring = $measure-scoring#cohort
* group[+].population[+].code = $measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "IND07 Initial Population"
