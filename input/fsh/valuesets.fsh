// Generated from input/dictionary/measles-core-data-elements.csv (L2): one ValueSet per coded data element.

ValueSet: MeaslesSexVS
Title: "Sex"
Description: "Allowed values of MEASLES.DE.03 (Sex)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.03.female
* $MC#MEASLES.DE.03.male
* $MC#MEASLES.DE.03.other
* $MC#MEASLES.DE.03.unknown

ValueSet: MeaslesNationalScheduleSettingVS
Title: "National schedule setting"
Description: "Allowed values of MEASLES.DE.06 (National schedule setting)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.06.high
* $MC#MEASLES.DE.06.low

ValueSet: MeaslesSupplementaryDoseIndicationVS
Title: "Supplementary-dose indication"
Description: "Allowed values of MEASLES.DE.07 (Supplementary-dose indication)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.07.outbreak-intensified-service
* $MC#MEASLES.DE.07.high-risk-campaign
* $MC#MEASLES.DE.07.displaced-refugee-conflict
* $MC#MEASLES.DE.07.contact-or-high-exposure
* $MC#MEASLES.DE.07.travel-to-outbreak-country
* $MC#MEASLES.DE.07.hiv-infected-or-exposed
* $MC#MEASLES.DE.07.high-hiv-and-measles-incidence

ValueSet: MeaslesMcvDoseDoseLabelVS
Title: "MCV dose: dose label"
Description: "Allowed values of MEASLES.DE.09 (MCV dose: dose label)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.09.mcv0
* $MC#MEASLES.DE.09.mcv1
* $MC#MEASLES.DE.09.mcv2
* $MC#MEASLES.DE.09.extra
* $MC#MEASLES.DE.09.invalid
* $MC#MEASLES.DE.09.not-counted

ValueSet: MeaslesMcvDoseVaccineVS
Title: "MCV dose: vaccine"
Description: "Allowed values of MEASLES.DE.10 (MCV dose: vaccine)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.10.m
* $MC#MEASLES.DE.10.mm
* $MC#MEASLES.DE.10.mr
* $MC#MEASLES.DE.10.mmr
* $MC#MEASLES.DE.10.mmrv

ValueSet: MeaslesHivStatusVS
Title: "HIV status"
Description: "Allowed values of MEASLES.DE.17 (HIV status)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.17.infected
* $MC#MEASLES.DE.17.exposed-infant
* $MC#MEASLES.DE.17.negative
* $MC#MEASLES.DE.17.unknown

ValueSet: MeaslesScreeningOutcomeVS
Title: "Screening outcome"
Description: "Allowed values of MEASLES.DE.22 (Screening outcome)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.22.proceed
* $MC#MEASLES.DE.22.defer
* $MC#MEASLES.DE.22.do-not-vaccinate
* $MC#MEASLES.DE.22.unknown

ValueSet: MeaslesReasonNotVaccinatedVS
Title: "Reason not vaccinated"
Description: "Allowed values of MEASLES.DE.23 (Reason not vaccinated)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.23.not-due
* $MC#MEASLES.DE.23.series-complete
* $MC#MEASLES.DE.23.pregnant
* $MC#MEASLES.DE.23.contraindication
* $MC#MEASLES.DE.23.live-vaccine-spacing
* $MC#MEASLES.DE.23.other

ValueSet: MeaslesHealthWorkerMeaslesImmunityProofVS
Title: "Health worker measles immunity proof"
Description: "Allowed values of MEASLES.DE.25 (Health worker measles immunity proof)."
* ^meta.profile = $SGValueSet
* ^status = #draft
* ^experimental = true
* ^publisher = "WHO"
* $MC#MEASLES.DE.25.documented-immunization
* $MC#MEASLES.DE.25.documented-immunity
* $MC#MEASLES.DE.25.none
