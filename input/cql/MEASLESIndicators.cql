/*
 * Measles indicators MEASLES.IND.01, .02, .06 and .07, patient-level, for
 * the Measures in input/fsh/measures.fsh. L3 of the L2 asset
 * input/indicators/measles-indicators.csv. Adjudication: pending.
 *
 * A dose is an Immunization whose protocolApplied.doseNumber (string) is the
 * dose label of MEASLES.DE.09 (MCV0, MCV1, MCV2), as MEASLES.DT.03 counted it.
 *
 * INTERPRETATION, pending the programme manager's review: the JRF counts
 * against population estimates (surviving infants; the national MCV2 target
 * population). A patient-level measure cannot read an estimate, so the
 * denominators here are registered children who reached age 1 (IND.01) or
 * age 2 (IND.02) during the measurement period.
 */
library MEASLESIndicators version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "MeaslesConcepts": 'http://smart.who.int/immunizations-measles/CodeSystem/MeaslesConcepts'

code "Confirmed measles case": 'MEASLES.DE.26' from "MeaslesConcepts" display 'Confirmed measles case'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2026-01-01T00:00:00.0, @2027-01-01T00:00:00.0)

context Patient

define "Completed MCV doses":
  [Immunization] I
    where I.status = 'completed'

define function "Dose label"(I Immunization):
  First(I.protocolApplied PA return (PA.doseNumber as FHIR.string).value)

define function "Has dose"(label String):
  exists ("Completed MCV doses" I where "Dose label"(I) = label)

define "Has MCV1": "Has dose"('MCV1')
define "Has MCV2": "Has dose"('MCV2')

define "Turned 1 in period":
  (Patient.birthDate.value + 1 year) during Interval[date from start of "Measurement Period", date from end of "Measurement Period"]

define "Turned 2 in period":
  (Patient.birthDate.value + 2 years) during Interval[date from start of "Measurement Period", date from end of "Measurement Period"]

// MEASLES.IND.01 MCV1 coverage
define "IND01 Denominator": "Turned 1 in period"
define "IND01 Numerator": "IND01 Denominator" and "Has MCV1"

// MEASLES.IND.02 MCV2 coverage
define "IND02 Denominator": "Turned 2 in period"
define "IND02 Numerator": "IND02 Denominator" and "Has MCV2"

// MEASLES.IND.06 MCV1-MCV2 dropout: children with MCV1 who have no MCV2
define "IND06 Denominator": "Turned 2 in period" and "Has MCV1"
define "IND06 Numerator": "IND06 Denominator" and not "Has MCV2"

// MEASLES.IND.07 Confirmed measles cases recorded in the period
define "IND07 Initial Population":
  exists ([Condition: "Confirmed measles case"] C
    where FHIRHelpers.ToDateTime(C.recordedDate) during "Measurement Period")
