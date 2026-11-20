### Decision logic

Four decision tables (DMN 1.3, hit policy FIRST) in `input/decision-logic/`. Each rule cites the page and the L1 node it rests on; the last rule of each returns *unknown* when a needed fact is missing. Checked with `bun run cat dmn:report` (0 errors, 0 warnings) and run against the dummy clients in [test scenarios](testing.html). **Adjudication: pending** (Clinical SME).

#### MEASLES.DT.01 — Determine measles-containing vaccine dose due

Which MCV dose, if any, a client needs today, from the doses DT.03 counted as valid. Hit policy FIRST. Derived from Table 1's measles footnote and Table 3's measles row (input/L2/provenance.json). Adjudication: pending.

| # | Valid routine MCV doses (from DT.03) | Age (months) | National schedule setting | Supplementary-dose indication | MCV0 already given | Weeks since last valid MCV | Age at MCV1 (months) | Dose due | Reason | Source |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | >= 2 | - | - | - | - | - | - | none | Series complete: two valid routine doses; no booster. | Table 3, page 2 (measles row and footnote); Table 1, page 3 (measles footnote) |
| 2 | < 1 | < 6 | - | - | - | - | - | none | Too young: no MCV dose before 6 months. | Table 1, page 3 (measles footnote) |
| 3 | < 1 | < 9 | - | true | false | - | - | MCV0 | Supplementary dose: an infant aged 6-8 months in a situation the footnote lists. | Table 1, page 3 (measles footnote) |
| 4 | < 1 | < 9 | - | - | - | - | - | none | MCV1 not yet due. | Table 1, page 3 (measles footnote) |
| 5 | < 1 | >= 9 | "high" | - | - | - | - | MCV1 | First routine dose (from 9 months where measles transmission and mortality risk are high; at any older age if missed). | Table 1, page 3 (measles footnote) |
| 6 | < 1 | >= 12 | "low" | - | - | - | - | MCV1 | First routine dose (from 12 months where measles transmission is low; at any older age if missed). | Table 1, page 3 (measles footnote) |
| 7 | < 1 | - | "low" | - | - | - | - | none | MCV1 due at 12 months in this schedule. | Table 1, page 3 (measles footnote) |
| 8 | < 2 | - | - | - | - | < 4 | - | none | Too soon: at least 4 weeks between MCV1 and MCV2. | Table 1, page 3 (measles footnote) |
| 9 | < 2 | >= 15 | - | - | - | - | - | MCV2 | Second routine dose (from 15 months; at any older age if missed). | Table 1, page 3 (measles footnote) |
| 10 | < 2 | - | - | - | - | - | > 12 | MCV2 | Late start: a child who began after 12 months gets the second dose 4 weeks after the first. | Table 3, page 2 (measles row and footnote) |
| 11 | < 2 | - | - | - | - | - | - | none | MCV2 due at 15 months. | Table 1, page 3 (measles footnote) |
| 12 | - | - | - | - | - | - | - | unknown | Not settled: a required fact (doses, age or schedule setting) is missing. | No source: returned only when the inputs match no rule above (a fact is missing or out of range). |

#### MEASLES.DT.02 — Screen before measles vaccination

Whether to vaccinate today, defer, or not vaccinate. Hit policy FIRST. A mild concurrent infection is not a reason to defer. Adjudication: pending.

| # | Anaphylaxis or severe allergy to a vaccine component | Severe immunosuppression | Pregnant | Weeks since another live vaccine (not today) | Screening | Reason | Source |
|---|---|---|---|---|---|---|---|
| 1 | true | - | - | - | do-not-vaccinate | History of anaphylaxis or severe allergy to a component (e.g. neomycin, gelatin). | Table 1, page 3 (measles footnote) |
| 2 | - | true | - | - | do-not-vaccinate | Severe immunosuppression. | Table 1, page 3 (measles footnote) |
| 3 | - | - | true | - | defer | Pregnant: vaccinate after the pregnancy. | Table 1, page 3 (measles footnote) |
| 4 | - | - | - | < 4 | defer | Another live vaccine less than 4 weeks ago: give on the same day or wait until 4 weeks have passed. | Table 1, page 3 (measles footnote); catch-up guide, page 14 |
| 5 | false | false | false | - | proceed | No contraindication; a mild concurrent infection does not count. | Table 1, page 3 (measles footnote) |
| 6 | - | - | - | - | unknown | Not settled: ask about allergy, immunosuppression and pregnancy. | No source: returned only when the inputs match no rule above (a fact is missing or out of range). |

#### MEASLES.DT.03 — Count a recorded measles-containing vaccine dose

How one recorded MCV dose counts, evaluated dose by dose in date order. Hit policy FIRST. Adjudication: pending.

| # | Documented (home-based record or register) | Age at the dose (months) | Valid routine doses before this one | Weeks since the previous valid routine dose | Counts as | Reason | Source |
|---|---|---|---|---|---|---|---|
| 1 | false | - | - | - | not counted | No written evidence: treat as not received and offer vaccination. | catch-up guide, page 14 |
| 2 | - | < 6 | - | - | invalid | Given before the minimum age of 6 months: not valid; repeat as age-appropriate. | catch-up guide, page 14; Table 1, page 3 (measles footnote) |
| 3 | - | < 9 | - | - | MCV0 | Given before 9 months: a supplementary dose, recorded as MCV0; MCV1 and MCV2 still follow. | Table 1, page 3 (measles footnote) |
| 4 | - | - | >= 1 | < 4 | invalid | Less than 4 weeks after the previous MCV: not valid; repeat 4 weeks after this dose. | Table 1, page 3 (measles footnote); catch-up guide, page 14 |
| 5 | - | - | < 1 | - | MCV1 | The first valid routine dose, whatever it was recorded as. | catch-up guide, page 19 |
| 6 | - | - | < 2 | - | MCV2 | The second valid routine dose. | Table 1, page 3 (measles footnote) |
| 7 | - | - | >= 2 | - | extra | Series already complete; this dose is not needed. | Table 3, page 2 (measles row and footnote) |
| 8 | - | - | - | - | unknown | Not settled: the dose date, age or earlier doses are missing. | No source: returned only when the inputs match no rule above (a fact is missing or out of range). |

#### MEASLES.DT.04 — Additional measles dose for a child living with HIV on HAART

Whether an HIV-infected child receiving HAART needs the additional MCV dose after immune reconstitution. Hit policy FIRST. Adjudication: pending.

| # | HIV-infected | Additional dose already given | Receiving HAART | CD4+ monitored | CD4+ T lymphocyte (%) | Months since HAART started | Additional dose due | Reason | Source |
|---|---|---|---|---|---|---|---|---|---|
| 1 | false | - | - | - | - | - | no | Not HIV-infected. | Table 1, page 3 (measles footnote) |
| 2 | - | true | - | - | - | - | no | Additional dose already given. | Table 1, page 3 (measles footnote) |
| 3 | - | - | false | - | - | - | no | Not on HAART: no additional dose yet; an infant at high risk may get MCV0 (DT.01). | Table 1, page 3 (measles footnote) |
| 4 | - | - | - | true | >= 20 | - | yes | Immune reconstitution reached (CD4+ 20-25% or more). | Table 1, page 3 (measles footnote) |
| 5 | - | - | - | true | - | - | no | Wait for immune reconstitution (CD4+ 20-25%). | Table 1, page 3 (measles footnote) |
| 6 | - | - | - | false | - | >= 6 | yes | CD4+ not monitored: give 6-12 months after HAART started. | Table 1, page 3 (measles footnote) |
| 7 | - | - | - | false | - | < 6 | no | Due 6-12 months after HAART started. | Table 1, page 3 (measles footnote) |
| 8 | - | - | - | - | - | - | unknown | Not settled: HIV status, HAART or CD4+ facts are missing. | No source: returned only when the inputs match no rule above (a fact is missing or out of range). |
