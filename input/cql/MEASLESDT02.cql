/*
 * MEASLES.DT.02 Screen before measles vaccination
 * DERIVED from the L2 decision table input/decision-logic/MEASLES.DT.02.dmn by input/L3/dmn2cql.py;
 * regenerate it, never edit it. Hit policy FIRST. Adjudication: pending.
 */
library MEASLESDT02 version '0.1.0'

// Anaphylaxis or severe allergy to a vaccine component
parameter anaphylaxisToComponent Boolean
// Severe immunosuppression
parameter severeImmunosuppression Boolean
// Pregnant
parameter pregnant Boolean
// Weeks since another live vaccine (not today)
parameter weeksSinceOtherLiveVaccine Decimal

/* Rule 1: Table 1, page 3 (measles footnote) — T1:measles.contraindications */
define "Rule 1":
  Coalesce(anaphylaxisToComponent is true, false)
define "Rule 1 fires":
  "Rule 1"

/* Rule 2: Table 1, page 3 (measles footnote) — T1:measles.contraindications. Asymptomatic HIV infection is not this: those clients are vaccinated (measles.hiv-routine-vaccination). */
define "Rule 2":
  Coalesce(severeImmunosuppression is true, false)
define "Rule 2 fires":
  "Rule 2" and not ("Rule 1")

/* Rule 3: Table 1, page 3 (measles footnote) — T1:measles.avoid-in-pregnancy. A precaution. */
define "Rule 3":
  Coalesce(pregnant is true, false)
define "Rule 3 fires":
  "Rule 3" and not ("Rule 1" or "Rule 2")

/* Rule 4: Table 1, page 3 (measles footnote); catch-up guide, page 14 — T1:measles.live-vaccine-spacing CU:catchup.live-vaccine-spacing. OPV is the printed exception and does not count here. */
define "Rule 4":
  Coalesce(weeksSinceOtherLiveVaccine < 4.0, false)
define "Rule 4 fires":
  "Rule 4" and not ("Rule 1" or "Rule 2" or "Rule 3")

/* Rule 5: Table 1, page 3 (measles footnote) — T1:measles.mild-infection-not-contraindication */
define "Rule 5":
  Coalesce(anaphylaxisToComponent is false
    and severeImmunosuppression is false
    and pregnant is false, false)
define "Rule 5 fires":
  "Rule 5" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4")

/* Rule 6: No source: returned only when the inputs match no rule above (a fact is missing or out of range). */
define "Rule 6":
  Coalesce(true, false)
define "Rule 6 fires":
  "Rule 6" and not ("Rule 1" or "Rule 2" or "Rule 3" or "Rule 4" or "Rule 5")

// Output: Screening
define "screening":
  case
    when "Rule 1 fires" then 'do-not-vaccinate'
    when "Rule 2 fires" then 'do-not-vaccinate'
    when "Rule 3 fires" then 'defer'
    when "Rule 4 fires" then 'defer'
    when "Rule 5 fires" then 'proceed'
    when "Rule 6 fires" then 'unknown'
    else null
  end

// Output: Reason
define "reason":
  case
    when "Rule 1 fires" then 'History of anaphylaxis or severe allergy to a component (e.g. neomycin, gelatin).'
    when "Rule 2 fires" then 'Severe immunosuppression.'
    when "Rule 3 fires" then 'Pregnant: vaccinate after the pregnancy.'
    when "Rule 4 fires" then 'Another live vaccine less than 4 weeks ago: give on the same day or wait until 4 weeks have passed.'
    when "Rule 5 fires" then 'No contraindication; a mild concurrent infection does not count.'
    when "Rule 6 fires" then 'Not settled: ask about allergy, immunosuppression and pregnancy.'
    else null
  end

// Output: Rests on
define "basis":
  case
    when "Rule 1 fires" then 'T1:measles.contraindications'
    when "Rule 2 fires" then 'T1:measles.contraindications'
    when "Rule 3 fires" then 'T1:measles.avoid-in-pregnancy'
    when "Rule 4 fires" then 'T1:measles.live-vaccine-spacing CU:catchup.live-vaccine-spacing'
    when "Rule 5 fires" then 'T1:measles.mild-infection-not-contraindication'
    when "Rule 6 fires" then ''
    else null
  end

