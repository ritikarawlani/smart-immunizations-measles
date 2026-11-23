# language: en
# Test scenarios (DAK component 9) for the measles decision tables. Every client is made up.
# Each scenario names the table and the expected outcome; the same cases are in decision-table-tests.json
# and are run against each table (all pass at the commit that added them). Adjudication: pending (Clinical SME).

Feature: MEASLES.DT.01 Determine measles-containing vaccine dose due

  Scenario: Asha, 9 months, high transmission, no doses
    Given validRoutineDoses is 0
    And ageMonths is 9
    And transmissionSetting is "high"
    And supplementaryIndication is false
    And mcv0Given is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV1"

  Scenario: Asha, 15 months, MCV1 at 9 months, 26 weeks ago
    Given validRoutineDoses is 1
    And ageMonths is 15
    And transmissionSetting is "high"
    And weeksSinceLastMcv is 26
    And ageAtMcv1Months is 9
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV2"

  Scenario: Asha, complete
    Given validRoutineDoses is 2
    And ageMonths is 16
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

  Scenario: Daniel, 6 years, no record
    Given validRoutineDoses is 0
    And ageMonths is 72
    And transmissionSetting is "high"
    And supplementaryIndication is false
    And mcv0Given is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV1"

  Scenario: Daniel, 4 weeks after MCV1 at 72 months
    Given validRoutineDoses is 1
    And ageMonths is 73
    And transmissionSetting is "high"
    And weeksSinceLastMcv is 4
    And ageAtMcv1Months is 72
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV2"

  Scenario: Daniel, 2 weeks after MCV1
    Given validRoutineDoses is 1
    And ageMonths is 72
    And weeksSinceLastMcv is 2
    And ageAtMcv1Months is 72
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

  Scenario: Lina, 7 months, HIV-exposed during an outbreak
    Given validRoutineDoses is 0
    And ageMonths is 7
    And transmissionSetting is "high"
    And supplementaryIndication is true
    And mcv0Given is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV0"

  Scenario: Lina, 7 months, MCV0 given
    Given validRoutineDoses is 0
    And ageMonths is 7
    And transmissionSetting is "high"
    And supplementaryIndication is true
    And mcv0Given is true
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

  Scenario: Low transmission, 10 months
    Given validRoutineDoses is 0
    And ageMonths is 10
    And transmissionSetting is "low"
    And supplementaryIndication is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

  Scenario: Low transmission, 12 months
    Given validRoutineDoses is 0
    And ageMonths is 12
    And transmissionSetting is "low"
    And supplementaryIndication is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "MCV1"

  Scenario: MCV1 at 9 months, now 12 months
    Given validRoutineDoses is 1
    And ageMonths is 12
    And weeksSinceLastMcv is 13
    And ageAtMcv1Months is 9
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

  Scenario: Infant, 4 months
    Given validRoutineDoses is 0
    And ageMonths is 4
    And supplementaryIndication is true
    And mcv0Given is false
    When MEASLES.DT.01 is evaluated
    Then the outcome is "none"

Feature: MEASLES.DT.02 Screen before measles vaccination

  Scenario: Asha, well
    Given anaphylaxisToComponent is false
    And severeImmunosuppression is false
    And pregnant is false
    When MEASLES.DT.02 is evaluated
    Then the outcome is "proceed"

  Scenario: Grace, pregnant
    Given anaphylaxisToComponent is false
    And severeImmunosuppression is false
    And pregnant is true
    When MEASLES.DT.02 is evaluated
    Then the outcome is "defer"

  Scenario: Gelatin anaphylaxis
    Given anaphylaxisToComponent is true
    And severeImmunosuppression is false
    And pregnant is false
    When MEASLES.DT.02 is evaluated
    Then the outcome is "do-not-vaccinate"

  Scenario: Yellow fever vaccine 2 weeks ago
    Given anaphylaxisToComponent is false
    And severeImmunosuppression is false
    And pregnant is false
    And weeksSinceOtherLiveVaccine is 2
    When MEASLES.DT.02 is evaluated
    Then the outcome is "defer"

  Scenario: Daniel, with a cough
    Given anaphylaxisToComponent is false
    And severeImmunosuppression is false
    And pregnant is false
    When MEASLES.DT.02 is evaluated
    Then the outcome is "proceed"

Feature: MEASLES.DT.03 Count a recorded measles-containing vaccine dose

  Scenario: Daniel: caregiver recalls a dose, no record
    Given documented is false
    And ageAtDoseMonths is 10
    And priorRoutineDoses is 0
    When MEASLES.DT.03 is evaluated
    Then the outcome is "not counted"

  Scenario: Lina's dose at 7 months
    Given documented is true
    And ageAtDoseMonths is 7
    And priorRoutineDoses is 0
    When MEASLES.DT.03 is evaluated
    Then the outcome is "MCV0"

  Scenario: Dose at 5 months
    Given documented is true
    And ageAtDoseMonths is 5
    And priorRoutineDoses is 0
    When MEASLES.DT.03 is evaluated
    Then the outcome is "invalid"

  Scenario: Asha's MCV1 at 9 months
    Given documented is true
    And ageAtDoseMonths is 9
    And priorRoutineDoses is 0
    When MEASLES.DT.03 is evaluated
    Then the outcome is "MCV1"

  Scenario: Recorded as MCV2, no MCV1 before
    Given documented is true
    And ageAtDoseMonths is 18
    And priorRoutineDoses is 0
    When MEASLES.DT.03 is evaluated
    Then the outcome is "MCV1"

  Scenario: Second dose 3 weeks after the first
    Given documented is true
    And ageAtDoseMonths is 13
    And priorRoutineDoses is 1
    And weeksSincePreviousRoutine is 3
    When MEASLES.DT.03 is evaluated
    Then the outcome is "invalid"

  Scenario: Asha's MCV2 at 15 months
    Given documented is true
    And ageAtDoseMonths is 15
    And priorRoutineDoses is 1
    And weeksSincePreviousRoutine is 26
    When MEASLES.DT.03 is evaluated
    Then the outcome is "MCV2"

Feature: MEASLES.DT.04 Additional measles dose for a child living with HIV on HAART

  Scenario: On HAART, CD4 22%
    Given hivInfected is true
    And additionalDoseGiven is false
    And onHaart is true
    And cd4Monitored is true
    And cd4Percent is 22
    When MEASLES.DT.04 is evaluated
    Then the outcome is "yes"

  Scenario: On HAART, CD4 15%
    Given hivInfected is true
    And additionalDoseGiven is false
    And onHaart is true
    And cd4Monitored is true
    And cd4Percent is 15
    When MEASLES.DT.04 is evaluated
    Then the outcome is "no"

  Scenario: On HAART 8 months, no CD4 monitoring
    Given hivInfected is true
    And additionalDoseGiven is false
    And onHaart is true
    And cd4Monitored is false
    And monthsSinceHaartStart is 8
    When MEASLES.DT.04 is evaluated
    Then the outcome is "yes"

  Scenario: On HAART 3 months, no CD4 monitoring
    Given hivInfected is true
    And additionalDoseGiven is false
    And onHaart is true
    And cd4Monitored is false
    And monthsSinceHaartStart is 3
    When MEASLES.DT.04 is evaluated
    Then the outcome is "no"
