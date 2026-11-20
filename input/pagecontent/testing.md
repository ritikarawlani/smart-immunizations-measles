### Test scenarios

Dummy clients (all made up) run through each decision table; the same cases are `input/testing/measles-decision-tables.feature` (Gherkin) and `input/testing/decision-table-tests.json`. The Clinical SME reviews whether each outcome is right. **Adjudication: pending.**

#### MEASLES.DT.01

| client | facts | outcome |
|---|---|---|
| Asha, 9 months, high transmission, no doses | validRoutineDoses = 0, ageMonths = 9, transmissionSetting = "high", supplementaryIndication = false, mcv0Given = false | MCV1 |
| Asha, 15 months, MCV1 at 9 months, 26 weeks ago | validRoutineDoses = 1, ageMonths = 15, transmissionSetting = "high", weeksSinceLastMcv = 26, ageAtMcv1Months = 9 | MCV2 |
| Asha, complete | validRoutineDoses = 2, ageMonths = 16 | none |
| Daniel, 6 years, no record | validRoutineDoses = 0, ageMonths = 72, transmissionSetting = "high", supplementaryIndication = false, mcv0Given = false | MCV1 |
| Daniel, 4 weeks after MCV1 at 72 months | validRoutineDoses = 1, ageMonths = 73, transmissionSetting = "high", weeksSinceLastMcv = 4, ageAtMcv1Months = 72 | MCV2 |
| Daniel, 2 weeks after MCV1 | validRoutineDoses = 1, ageMonths = 72, weeksSinceLastMcv = 2, ageAtMcv1Months = 72 | none |
| Lina, 7 months, HIV-exposed during an outbreak | validRoutineDoses = 0, ageMonths = 7, transmissionSetting = "high", supplementaryIndication = true, mcv0Given = false | MCV0 |
| Lina, 7 months, MCV0 given | validRoutineDoses = 0, ageMonths = 7, transmissionSetting = "high", supplementaryIndication = true, mcv0Given = true | none |
| Low transmission, 10 months | validRoutineDoses = 0, ageMonths = 10, transmissionSetting = "low", supplementaryIndication = false | none |
| Low transmission, 12 months | validRoutineDoses = 0, ageMonths = 12, transmissionSetting = "low", supplementaryIndication = false | MCV1 |
| MCV1 at 9 months, now 12 months | validRoutineDoses = 1, ageMonths = 12, weeksSinceLastMcv = 13, ageAtMcv1Months = 9 | none |
| Infant, 4 months | validRoutineDoses = 0, ageMonths = 4, supplementaryIndication = true, mcv0Given = false | none |

#### MEASLES.DT.02

| client | facts | outcome |
|---|---|---|
| Asha, well | anaphylaxisToComponent = false, severeImmunosuppression = false, pregnant = false | proceed |
| Grace, pregnant | anaphylaxisToComponent = false, severeImmunosuppression = false, pregnant = true | defer |
| Gelatin anaphylaxis | anaphylaxisToComponent = true, severeImmunosuppression = false, pregnant = false | do-not-vaccinate |
| Yellow fever vaccine 2 weeks ago | anaphylaxisToComponent = false, severeImmunosuppression = false, pregnant = false, weeksSinceOtherLiveVaccine = 2 | defer |
| Daniel, with a cough | anaphylaxisToComponent = false, severeImmunosuppression = false, pregnant = false | proceed |

#### MEASLES.DT.03

| client | facts | outcome |
|---|---|---|
| Daniel: caregiver recalls a dose, no record | documented = false, ageAtDoseMonths = 10, priorRoutineDoses = 0 | not counted |
| Lina's dose at 7 months | documented = true, ageAtDoseMonths = 7, priorRoutineDoses = 0 | MCV0 |
| Dose at 5 months | documented = true, ageAtDoseMonths = 5, priorRoutineDoses = 0 | invalid |
| Asha's MCV1 at 9 months | documented = true, ageAtDoseMonths = 9, priorRoutineDoses = 0 | MCV1 |
| Recorded as MCV2, no MCV1 before | documented = true, ageAtDoseMonths = 18, priorRoutineDoses = 0 | MCV1 |
| Second dose 3 weeks after the first | documented = true, ageAtDoseMonths = 13, priorRoutineDoses = 1, weeksSincePreviousRoutine = 3 | invalid |
| Asha's MCV2 at 15 months | documented = true, ageAtDoseMonths = 15, priorRoutineDoses = 1, weeksSincePreviousRoutine = 26 | MCV2 |

#### MEASLES.DT.04

| client | facts | outcome |
|---|---|---|
| On HAART, CD4 22% | hivInfected = true, additionalDoseGiven = false, onHaart = true, cd4Monitored = true, cd4Percent = 22 | yes |
| On HAART, CD4 15% | hivInfected = true, additionalDoseGiven = false, onHaart = true, cd4Monitored = true, cd4Percent = 15 | no |
| On HAART 8 months, no CD4 monitoring | hivInfected = true, additionalDoseGiven = false, onHaart = true, cd4Monitored = false, monthsSinceHaartStart = 8 | yes |
| On HAART 3 months, no CD4 monitoring | hivInfected = true, additionalDoseGiven = false, onHaart = true, cd4Monitored = false, monthsSinceHaartStart = 3 | no |
