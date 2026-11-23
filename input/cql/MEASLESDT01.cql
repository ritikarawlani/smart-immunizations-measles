/*
 * MEASLES.DT.01 Determine measles-containing vaccine dose due
 * DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.01.dmn by input/L3/dmn2cql.py;
 * regenerate it, never edit it. Hit policy FIRST. Adjudication: pending.
 */
library MEASLESDT01 version '0.1.0'

// Valid routine MCV doses (from DT.03)
parameter validRoutineDoses Decimal
// Age (months)
parameter ageMonths Decimal
// National schedule setting
parameter transmissionSetting String
// Supplementary-dose indication
parameter supplementaryIndication Boolean
// MCV0 already given
parameter mcv0Given Boolean
// Weeks since last valid MCV
parameter weeksSinceLastMcv Decimal
// Age at MCV1 (months)
parameter ageAtMcv1Months Decimal

/* Rule 1: Table 3, page 2 (measles row and footnote); Table 1, page 3 (measles footnote) — T3:measles.interrupted-delayed-schedule-row T1:measles.two-doses-standard. Two doses complete the series; Table 3 prints no booster. */
define "Rule 1":
  Coalesce(validRoutineDoses >= 2.0, false)
define "Rule 1 fires":
  "Rule 1"

/* Rule 2: Table 1, page 3 (measles footnote) — T1:measles.mcv0-situations. Supplementary doses start at 6 months. */
define "Rule 2":
  Coalesce(validRoutineDoses < 1.0
    and ageMonths < 6.0, false)
define "Rule 2 fires":
  "Rule 2" and not ("Rule 1")

/* Rule 3: Table 1, page 3 (measles footnote) — T1:measles.mcv0-situations T1:measles.hiv-high-incidence-mcv0-6-months T1:measles.hiv-exposed-mcv0. Record it as MCV0; MCV1 and MCV2 still follow. */
define "Rule 3":
  Coalesce(validRoutineDoses < 1.0
    and ageMonths < 9.0
    and supplementaryIndication is true
    and mcv0Given is false, false)
define "Rule 3 fires":
  "Rule 3" and not ("Rule 1" or "Rule 2")

/* Rule 4: Table 1, page 3 (measles footnote) — T1:measles.mcv1-9-months-high-transmission T1:measles.mcv1-12-months-low-transmission. Earliest routine MCV1 is 9 months. */
define "Rule 4":
  Coalesce(validRoutineDoses < 1.0
    and ageMonths < 9.0, false)
define "Rule 4 fires":
  "Rule 4" and not ("Rule 1" or "Rule 2" or "Rule 3")

/* Rule 5: Table 1, page 3 (measles footnote) — T1:measles.mcv1-9-months-high-transmission T1:measles.routine-delivery-not-age-limited T1:measles.catch-up-every-opportunity. Not limited to 9-12 months. */
define "Rule 5":
  Coalesce(validRoutineDoses < 1.0
    and ageMonths >= 9.0
    and transmissionSetting in { 'high' }, false)
define "Rule 5 fires":
  "Rule 5" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4")

/* Rule 6: Table 1, page 3 (measles footnote) — T1:measles.mcv1-12-months-low-transmission T1:measles.routine-delivery-not-age-limited. Context-specific: the national schedule chooses 12 months. */
define "Rule 6":
  Coalesce(validRoutineDoses < 1.0
    and ageMonths >= 12.0
    and transmissionSetting in { 'low' }, false)
define "Rule 6 fires":
  "Rule 6" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5")

/* Rule 7: Table 1, page 3 (measles footnote) — T1:measles.mcv1-12-months-low-transmission */
define "Rule 7":
  Coalesce(validRoutineDoses < 1.0
    and transmissionSetting in { 'low' }, false)
define "Rule 7 fires":
  "Rule 7" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6")

/* Rule 8: Table 1, page 3 (measles footnote) — T1:measles.mcv-minimum-interval. Give MCV2 once 4 weeks have passed. */
define "Rule 8":
  Coalesce(validRoutineDoses < 2.0
    and weeksSinceLastMcv < 4.0, false)
define "Rule 8 fires":
  "Rule 8" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7")

/* Rule 9: Table 1, page 3 (measles footnote) — T1:measles.mcv2-15-18-months T1:measles.routine-delivery-not-age-limited T1:measles.catch-up-every-opportunity. A national schedule may give it at school entry instead (measles.mcv2-at-school-entry). */
define "Rule 9":
  Coalesce(validRoutineDoses < 2.0
    and ageMonths >= 15.0, false)
define "Rule 9 fires":
  "Rule 9" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7" or "Rule 8")

/* Rule 10: Table 3, page 2 (measles row and footnote) — T3:measles.interrupted-delayed-schedule-row T3:measles.interrupted-resume-no-repeat. Table 3: doses for those who start late, >12 months: 2 doses (4 weeks). */
define "Rule 10":
  Coalesce(validRoutineDoses < 2.0
    and ageAtMcv1Months > 12.0, false)
define "Rule 10 fires":
  "Rule 10" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7" or "Rule 8" or "Rule 9")

/* Rule 11: Table 1, page 3 (measles footnote) — T1:measles.mcv2-15-18-months */
define "Rule 11":
  Coalesce(validRoutineDoses < 2.0, false)
define "Rule 11 fires":
  "Rule 11" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7" or "Rule 8" or "Rule 9" or "Rule 10")

/* Rule 12: No source: returned only when the inputs match no rule above (a fact is missing or out of range). */
define "Rule 12":
  Coalesce(true, false)
define "Rule 12 fires":
  "Rule 12" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7" or "Rule 8" or "Rule 9" or "Rule 10" or "Rule 11")

// Output: Dose due
define "doseDue":
  case
    when "Rule 1 fires" then 'none'
    when "Rule 2 fires" then 'none'
    when "Rule 3 fires" then 'MCV0'
    when "Rule 4 fires" then 'none'
    when "Rule 5 fires" then 'MCV1'
    when "Rule 6 fires" then 'MCV1'
    when "Rule 7 fires" then 'none'
    when "Rule 8 fires" then 'none'
    when "Rule 9 fires" then 'MCV2'
    when "Rule 10 fires" then 'MCV2'
    when "Rule 11 fires" then 'none'
    when "Rule 12 fires" then 'unknown'
    else null
  end

// Output: Reason
define "reason":
  case
    when "Rule 1 fires" then 'Series complete: two valid routine doses; no booster.'
    when "Rule 2 fires" then 'Too young: no MCV dose before 6 months.'
    when "Rule 3 fires" then 'Supplementary dose: an infant aged 6-8 months in a situation the footnote lists.'
    when "Rule 4 fires" then 'MCV1 not yet due.'
    when "Rule 5 fires" then 'First routine dose (from 9 months where measles transmission and mortality risk are high; at any older age if missed).'
    when "Rule 6 fires" then 'First routine dose (from 12 months where measles transmission is low; at any older age if missed).'
    when "Rule 7 fires" then 'MCV1 due at 12 months in this schedule.'
    when "Rule 8 fires" then 'Too soon: at least 4 weeks between MCV1 and MCV2.'
    when "Rule 9 fires" then 'Second routine dose (from 15 months; at any older age if missed).'
    when "Rule 10 fires" then 'Late start: a child who began after 12 months gets the second dose 4 weeks after the first.'
    when "Rule 11 fires" then 'MCV2 due at 15 months.'
    when "Rule 12 fires" then 'Not settled: a required fact (doses, age or schedule setting) is missing.'
    else null
  end

// Output: Rests on
define "basis":
  case
    when "Rule 1 fires" then 'T3:measles.interrupted-delayed-schedule-row T1:measles.two-doses-standard'
    when "Rule 2 fires" then 'T1:measles.mcv0-situations'
    when "Rule 3 fires" then 'T1:measles.mcv0-situations T1:measles.hiv-high-incidence-mcv0-6-months T1:measles.hiv-exposed-mcv0'
    when "Rule 4 fires" then 'T1:measles.mcv1-9-months-high-transmission T1:measles.mcv1-12-months-low-transmission'
    when "Rule 5 fires" then 'T1:measles.mcv1-9-months-high-transmission T1:measles.routine-delivery-not-age-limited T1:measles.catch-up-every-opportunity'
    when "Rule 6 fires" then 'T1:measles.mcv1-12-months-low-transmission T1:measles.routine-delivery-not-age-limited'
    when "Rule 7 fires" then 'T1:measles.mcv1-12-months-low-transmission'
    when "Rule 8 fires" then 'T1:measles.mcv-minimum-interval'
    when "Rule 9 fires" then 'T1:measles.mcv2-15-18-months T1:measles.routine-delivery-not-age-limited T1:measles.catch-up-every-opportunity'
    when "Rule 10 fires" then 'T3:measles.interrupted-delayed-schedule-row T3:measles.interrupted-resume-no-repeat'
    when "Rule 11 fires" then 'T1:measles.mcv2-15-18-months'
    when "Rule 12 fires" then ''
    else null
  end

