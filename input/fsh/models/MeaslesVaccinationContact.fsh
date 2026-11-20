// Generated from input/dictionary/measles-core-data-elements.csv (L2).
Logical: MeaslesVaccinationContact
Title: "Measles vaccination contact"
Description: "The data a measles vaccination contact (MEASLES.A) and its reporting (MEASLES.B) record: the core data elements MEASLES.DE.01-26."
* ^status = #draft
* ^publisher = "WHO"
* ^experimental = true
* clientIdentifier 1..1 Identifier "Client identifier" "Unique identifier of the client in the register or EIR (MEASLES.DE.01; used by MEASLES.A; rests on catchup.confirm-by-written-record)"
* clientIdentifier ^code = $MC#MEASLES.DE.01
* dateOfBirth 1..1 date "Date of birth" "Client's date of birth (MEASLES.DE.02; used by DT.01 DT.03 (age); rests on T1 measles footnote (ages throughout))"
* dateOfBirth ^code = $MC#MEASLES.DE.02
* sex 0..1 Coding "Sex" "Client's sex (MEASLES.DE.03; used by IND.01 IND.02 disaggregation; rests on JRF 4A. Routine Coverage)"
* sex ^code = $MC#MEASLES.DE.03
* sex from MeaslesSexVS (required)
* caregiverName 0..1 string "Caregiver name" "Name of the caregiver who brings a child (MEASLES.DE.04; used by MEASLES.A; rests on catchup.multi-dose-return-date)"
* caregiverName ^code = $MC#MEASLES.DE.04
* homeBasedRecordPresented 1..1 boolean "Home-based record presented" "Whether a home-based record was presented at this contact (MEASLES.DE.05; used by MEASLES.A A1; rests on catchup.confirm-by-written-record)"
* homeBasedRecordPresented ^code = $MC#MEASLES.DE.05
* nationalScheduleSetting 1..1 Coding "National schedule setting" "Whether the national schedule gives MCV1 at 9 months (high transmission) or 12 months (low transmission) (MEASLES.DE.06; used by DT.01 transmissionSetting; rests on measles.mcv1-9-months-high-transmission; measles.mcv1-12-months-low-transmission)"
* nationalScheduleSetting ^code = $MC#MEASLES.DE.06
* nationalScheduleSetting from MeaslesNationalScheduleSettingVS (required)
* supplementaryDoseIndication 0..* Coding "Supplementary-dose indication" "The infant is in a situation the measles footnote lists for a dose from 6 months (MEASLES.DE.07; used by DT.01 supplementaryIndication; rests on measles.mcv0-situations; measles.hiv-high-incidence-mcv0-6-months)"
* supplementaryDoseIndication ^code = $MC#MEASLES.DE.07
* supplementaryDoseIndication from MeaslesSupplementaryDoseIndicationVS (required)
* mcvDoseDateGiven 1..1 date "MCV dose: date given" "Date a measles-containing vaccine dose was given (MEASLES.DE.08; used by DT.03 DT.01; rests on measles.mcv0-recording)"
* mcvDoseDateGiven ^code = $MC#MEASLES.DE.08
* mcvDoseDoseLabel 1..1 Coding "MCV dose: dose label" "How the dose counts (MEASLES.DE.09; used by DT.03 countsAs; rests on measles.mcv0-recording; catchup.mcv2-only-after-mcv1)"
* mcvDoseDoseLabel ^code = $MC#MEASLES.DE.09
* mcvDoseDoseLabel from MeaslesMcvDoseDoseLabelVS (required)
* mcvDoseVaccine 1..1 Coding "MCV dose: vaccine" "Which measles-containing vaccine was given (MEASLES.DE.10; used by IND.01 IND.02; rests on JRF 2A. Schedule rows 2270-2310; measles.same-formulation-both-doses)"
* mcvDoseVaccine ^code = $MC#MEASLES.DE.10
* mcvDoseVaccine from MeaslesMcvDoseVaccineVS (required)
* mcvDoseDocumented 1..1 boolean "MCV dose: documented" "Whether the dose is documented in a home-based record or register (MEASLES.DE.11; used by DT.03 documented; rests on catchup.confirm-by-written-record; catchup.unconfirmed-assume-unvaccinated)"
* mcvDoseDocumented ^code = $MC#MEASLES.DE.11
* anaphylaxisOrSevereAllergyToAVaccineComponent 1..1 boolean "Anaphylaxis or severe allergy to a vaccine component" "History of anaphylaxis or severe allergic reaction to any component (e.g. neomycin or gelatin) (MEASLES.DE.12; used by DT.02; rests on measles.contraindications)"
* anaphylaxisOrSevereAllergyToAVaccineComponent ^code = $MC#MEASLES.DE.12
* severeImmunosuppression 1..1 boolean "Severe immunosuppression" "Client has any form of severe immunosuppression (MEASLES.DE.13; used by DT.02; rests on measles.contraindications)"
* severeImmunosuppression ^code = $MC#MEASLES.DE.13
* pregnant 0..1 boolean "Pregnant" "Client is pregnant (MEASLES.DE.14; used by DT.02; rests on measles.avoid-in-pregnancy)"
* pregnant ^code = $MC#MEASLES.DE.14
* mildConcurrentInfection 0..1 boolean "Mild concurrent infection" "Client has a mild concurrent infection (recorded; not a reason to defer) (MEASLES.DE.15; used by DT.02; rests on measles.mild-infection-not-contraindication)"
* mildConcurrentInfection ^code = $MC#MEASLES.DE.15
* dateOfLastOtherLiveVaccine 0..1 date "Date of last other live vaccine" "Date another live vaccine (not OPV) was last given (MEASLES.DE.16; used by DT.02 weeksSinceOtherLiveVaccine; rests on measles.live-vaccine-spacing; catchup.live-vaccine-spacing)"
* dateOfLastOtherLiveVaccine ^code = $MC#MEASLES.DE.16
* hivStatus 0..1 Coding "HIV status" "Client's HIV status (MEASLES.DE.17; used by DT.01 DT.04; rests on measles.hiv-routine-vaccination; measles.hiv-exposed-mcv0)"
* hivStatus ^code = $MC#MEASLES.DE.17
* hivStatus from MeaslesHivStatusVS (required)
* receivingHaart 0..1 boolean "Receiving HAART" "Client is receiving highly active antiretroviral therapy (MEASLES.DE.18; used by DT.04; rests on measles.hiv-haart-additional-dose)"
* receivingHaart ^code = $MC#MEASLES.DE.18
* haartStartDate 0..1 date "HAART start date" "Date HAART was started (MEASLES.DE.19; used by DT.04 monthsSinceHaartStart; rests on measles.hiv-haart-no-cd4-monitoring)"
* haartStartDate ^code = $MC#MEASLES.DE.19
* cd4TLymphocytePercentage 0..1 Quantity "CD4+ T lymphocyte percentage" "Most recent CD4+ T lymphocyte count as a percentage (MEASLES.DE.20; used by DT.04; rests on measles.hiv-haart-additional-dose)"
* cd4TLymphocytePercentage ^code = $MC#MEASLES.DE.20
* hivAdditionalMcvDoseGiven 0..1 boolean "HIV additional MCV dose given" "The additional dose after immune reconstitution has been given (MEASLES.DE.21; used by DT.04; rests on measles.hiv-haart-additional-dose)"
* hivAdditionalMcvDoseGiven ^code = $MC#MEASLES.DE.21
* screeningOutcome 1..1 Coding "Screening outcome" "Outcome of screening before vaccination (MEASLES.DE.22; used by MEASLES.A G2; rests on DT.02)"
* screeningOutcome ^code = $MC#MEASLES.DE.22
* screeningOutcome from MeaslesScreeningOutcomeVS (required)
* reasonNotVaccinated 0..1 Coding "Reason not vaccinated" "Why no dose was given at this contact (MEASLES.DE.23; used by MEASLES.A A9; rests on measles.avoid-in-pregnancy; measles.contraindications; measles.live-vaccine-spacing)"
* reasonNotVaccinated ^code = $MC#MEASLES.DE.23
* reasonNotVaccinated from MeaslesReasonNotVaccinatedVS (required)
* nextMcvDueDate 0..1 date "Next MCV due date" "Date the next MCV dose is due (MEASLES.DE.24; used by MEASLES.A A7 A9; MEASLES.B B1; rests on catchup.multi-dose-return-date)"
* nextMcvDueDate ^code = $MC#MEASLES.DE.24
* healthWorkerMeaslesImmunityProof 0..1 Coding "Health worker measles immunity proof" "Proof or documentation of measles immunity or immunization for a health worker (MEASLES.DE.25; used by MEASLES.S4; rests on measles.health-worker-immunity)"
* healthWorkerMeaslesImmunityProof ^code = $MC#MEASLES.DE.25
* healthWorkerMeaslesImmunityProof from MeaslesHealthWorkerMeaslesImmunityProofVS (required)
* confirmedMeaslesCase 0..1 boolean "Confirmed measles case" "A confirmed measles case (laboratory or epidemiological link; reported clinical cases included as the JRF instructs) (MEASLES.DE.26; used by IND.07; rests on JRF 1. Reported Cases row 1020; Instructions row 10)"
* confirmedMeaslesCase ^code = $MC#MEASLES.DE.26
