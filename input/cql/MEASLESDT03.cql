/*
 * MEASLES.DT.03 Count a recorded measles-containing vaccine dose
 * DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.03.dmn by input/L3/dmn2cql.py;
 * regenerate it, never edit it. Hit policy FIRST. Adjudication: pending.
 */
library MEASLESDT03 version '0.1.0'

// Documented (home-based record or register)
parameter documented Boolean
// Age at the dose (months)
parameter ageAtDoseMonths Decimal
// Valid routine doses before this one
parameter priorRoutineDoses Decimal
// Weeks since the previous valid routine dose
parameter weeksSincePreviousRoutine Decimal

/* Rule 1: catch-up guide, page 14 — CU:catchup.unconfirmed-assume-unvaccinated CU:catchup.confirm-by-written-record */
define "Rule 1":
  Coalesce(documented is false, false)
define "Rule 1 fires":
  "Rule 1"

/* Rule 2: catch-up guide, page 14; Table 1, page 3 (measles footnote) — CU:catchup.invalid-early-dose-repeat T1:measles.mcv0-situations */
define "Rule 2":
  Coalesce(ageAtDoseMonths < 6.0, false)
define "Rule 2 fires":
  "Rule 2" and not ("Rule 1")

/* Rule 3: Table 1, page 3 (measles footnote) — T1:measles.mcv0-recording T1:measles.mcv0-then-routine-doses */
define "Rule 3":
  Coalesce(ageAtDoseMonths < 9.0, false)
define "Rule 3 fires":
  "Rule 3" and not ("Rule 1" or "Rule 2")

/* Rule 4: Table 1, page 3 (measles footnote); catch-up guide, page 14 — T1:measles.mcv-minimum-interval CU:catchup.invalid-early-dose-repeat */
define "Rule 4":
  Coalesce(priorRoutineDoses >= 1.0
    and weeksSincePreviousRoutine < 4.0, false)
define "Rule 4 fires":
  "Rule 4" and not ("Rule 1" or "Rule 2" or "Rule 3")

/* Rule 5: catch-up guide, page 19 — CU:catchup.mcv2-only-after-mcv1. A dose is never counted as MCV2 without an MCV1. */
define "Rule 5":
  Coalesce(priorRoutineDoses < 1.0, false)
define "Rule 5 fires":
  "Rule 5" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4")

/* Rule 6: Table 1, page 3 (measles footnote) — T1:measles.mcv2-15-18-months */
define "Rule 6":
  Coalesce(priorRoutineDoses < 2.0, false)
define "Rule 6 fires":
  "Rule 6" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5")

/* Rule 7: Table 3, page 2 (measles row and footnote) — T3:measles.interrupted-delayed-schedule-row */
define "Rule 7":
  Coalesce(priorRoutineDoses >= 2.0, false)
define "Rule 7 fires":
  "Rule 7" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6")

/* Rule 8: No source: returned only when the inputs match no rule above (a fact is missing or out of range). */
define "Rule 8":
  Coalesce(true, false)
define "Rule 8 fires":
  "Rule 8" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7")

// Output: Counts as
define "countsAs":
  case
    when "Rule 1 fires" then 'not counted'
    when "Rule 2 fires" then 'invalid'
    when "Rule 3 fires" then 'MCV0'
    when "Rule 4 fires" then 'invalid'
    when "Rule 5 fires" then 'MCV1'
    when "Rule 6 fires" then 'MCV2'
    when "Rule 7 fires" then 'extra'
    when "Rule 8 fires" then 'unknown'
    else null
  end

// Output: Reason
define "reason":
  case
    when "Rule 1 fires" then 'No written evidence: treat as not received and offer vaccination.'
    when "Rule 2 fires" then 'Given before the minimum age of 6 months: not valid; repeat as age-appropriate.'
    when "Rule 3 fires" then 'Given before 9 months: a supplementary dose, recorded as MCV0; MCV1 and MCV2 still follow.'
    when "Rule 4 fires" then 'Less than 4 weeks after the previous MCV: not valid; repeat 4 weeks after this dose.'
    when "Rule 5 fires" then 'The first valid routine dose, whatever it was recorded as.'
    when "Rule 6 fires" then 'The second valid routine dose.'
    when "Rule 7 fires" then 'Series already complete; this dose is not needed.'
    when "Rule 8 fires" then 'Not settled: the dose date, age or earlier doses are missing.'
    else null
  end

// Output: Rests on
define "basis":
  case
    when "Rule 1 fires" then 'CU:catchup.unconfirmed-assume-unvaccinated CU:catchup.confirm-by-written-record'
    when "Rule 2 fires" then 'CU:catchup.invalid-early-dose-repeat T1:measles.mcv0-situations'
    when "Rule 3 fires" then 'T1:measles.mcv0-recording T1:measles.mcv0-then-routine-doses'
    when "Rule 4 fires" then 'T1:measles.mcv-minimum-interval CU:catchup.invalid-early-dose-repeat'
    when "Rule 5 fires" then 'CU:catchup.mcv2-only-after-mcv1'
    when "Rule 6 fires" then 'T1:measles.mcv2-15-18-months'
    when "Rule 7 fires" then 'T3:measles.interrupted-delayed-schedule-row'
    when "Rule 8 fires" then ''
    else null
  end

