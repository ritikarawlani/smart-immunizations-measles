/*
 * MEASLES.DT.04 Additional measles dose for a child living with HIV on HAART
 * DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.04.dmn by input/L3/dmn2cql.py;
 * regenerate it, never edit it. Hit policy FIRST. Adjudication: pending.
 */
library MEASLESDT04 version '0.1.0'

// HIV-infected
parameter hivInfected Boolean
// Additional dose already given
parameter additionalDoseGiven Boolean
// Receiving HAART
parameter onHaart Boolean
// CD4+ monitored
parameter cd4Monitored Boolean
// CD4+ T lymphocyte (%)
parameter cd4Percent Decimal
// Months since HAART started
parameter monthsSinceHaartStart Decimal

/* Rule 1: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-additional-dose */
define "Rule 1":
  Coalesce(hivInfected is false, false)
define "Rule 1 fires":
  "Rule 1"

/* Rule 2: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-additional-dose */
define "Rule 2":
  Coalesce(additionalDoseGiven is true, false)
define "Rule 2 fires":
  "Rule 2" and not ("Rule 1")

/* Rule 3: Table 1, page 3 (measles footnote) — T1:measles.hiv-exposed-mcv0 */
define "Rule 3":
  Coalesce(onHaart is false, false)
define "Rule 3 fires":
  "Rule 3" and not ("Rule 1" or "Rule 2")

/* Rule 4: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-additional-dose */
define "Rule 4":
  Coalesce(cd4Monitored is true
    and cd4Percent >= 20.0, false)
define "Rule 4 fires":
  "Rule 4" and not ("Rule 1" or "Rule 2" or "Rule 3")

/* Rule 5: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-additional-dose */
define "Rule 5":
  Coalesce(cd4Monitored is true, false)
define "Rule 5 fires":
  "Rule 5" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4")

/* Rule 6: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-no-cd4-monitoring */
define "Rule 6":
  Coalesce(cd4Monitored is false
    and monthsSinceHaartStart >= 6.0, false)
define "Rule 6 fires":
  "Rule 6" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5")

/* Rule 7: Table 1, page 3 (measles footnote) — T1:measles.hiv-haart-no-cd4-monitoring */
define "Rule 7":
  Coalesce(cd4Monitored is false
    and monthsSinceHaartStart < 6.0, false)
define "Rule 7 fires":
  "Rule 7" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6")

/* Rule 8: No source: returned only when the inputs match no rule above (a fact is missing or out of range). */
define "Rule 8":
  Coalesce(true, false)
define "Rule 8 fires":
  "Rule 8" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5" or "Rule 6" or "Rule 7")

// Output: Additional dose due
define "additionalDoseDue":
  case
    when "Rule 1 fires" then 'no'
    when "Rule 2 fires" then 'no'
    when "Rule 3 fires" then 'no'
    when "Rule 4 fires" then 'yes'
    when "Rule 5 fires" then 'no'
    when "Rule 6 fires" then 'yes'
    when "Rule 7 fires" then 'no'
    when "Rule 8 fires" then 'unknown'
    else null
  end

// Output: Reason
define "reason":
  case
    when "Rule 1 fires" then 'Not HIV-infected.'
    when "Rule 2 fires" then 'Additional dose already given.'
    when "Rule 3 fires" then 'Not on HAART: no additional dose yet; an infant at high risk may get MCV0 (DT.01).'
    when "Rule 4 fires" then 'Immune reconstitution reached (CD4+ 20-25% or more).'
    when "Rule 5 fires" then 'Wait for immune reconstitution (CD4+ 20-25%).'
    when "Rule 6 fires" then 'CD4+ not monitored: give 6-12 months after HAART started.'
    when "Rule 7 fires" then 'Due 6-12 months after HAART started.'
    when "Rule 8 fires" then 'Not settled: HIV status, HAART or CD4+ facts are missing.'
    else null
  end

// Output: Rests on
define "basis":
  case
    when "Rule 1 fires" then 'T1:measles.hiv-haart-additional-dose'
    when "Rule 2 fires" then 'T1:measles.hiv-haart-additional-dose'
    when "Rule 3 fires" then 'T1:measles.hiv-exposed-mcv0'
    when "Rule 4 fires" then 'T1:measles.hiv-haart-additional-dose'
    when "Rule 5 fires" then 'T1:measles.hiv-haart-additional-dose'
    when "Rule 6 fires" then 'T1:measles.hiv-haart-no-cd4-monitoring'
    when "Rule 7 fires" then 'T1:measles.hiv-haart-no-cd4-monitoring'
    when "Rule 8 fires" then ''
    else null
  end

