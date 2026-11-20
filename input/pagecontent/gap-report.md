### Gap report

What is missing between L1, L2 and L3, written after stage 4 as
`guideline-gap-report` asks. A QA report, not a gate. Updated at each stage.

#### L1 → L2

| L1 node | L2 asset | note |
|---|---|---|
| all 23 Table 1 measles recommendations | ✓ | via DT.01–DT.04, MEASLES.A/B, the data dictionary and requirements (`input/L2/provenance.json`) |
| Table 3 `measles.two-doses-standard`, `measles.mcv-minimum-interval`, `measles.routine-delivery-not-age-limited` | — | Table 3 repeats Table 1's sentences; L2 cites Table 1's nodes |
| Table 3 `measles.interrupted-resume-no-repeat`, `measles.interrupted-delayed-schedule-row` | ✓ | DT.01 rule 10, DT.03 rule 7 |
| Table 4 `measles.health-worker-immunity` | partial | data element DE.25 and requirement FR.13; **no process** (workforce policy) |
| all 13 catch-up practices | ✓ | |
| national policy recommendations (`measles.two-doses-standard`, `measles.mcv2-in-schedule`, `measles.policies-allow-older-ages`, `measles.mcv2-at-school-entry`, `measles.same-formulation-both-doses`, `catchup.national-catch-up-schedule`) | partial | they set DE.06 (schedule setting) and the denominators; **no process** is drawn for national schedule design |

#### Sources not yet computable

| source | state |
|---|---|
| WHO/UNICEF JRF 2016 (`.xls`) | cited by sheet and row in the indicators; not in `library/` (the tabular rung's output does not promote) |
| facility analysis guide; PAHO electronic immunization registry guide | **referenced only** (licence forbids a copy): cited by page, never quoted; nothing in L2 rests on their text |
| COVID-19 monitoring metrics; digital certificates guide | ingested; no measles recommendation; their candidates are listed but not curated |
| who.int/data/immunization | an interactive dashboard (immunizationdata.who.int); no text; not ingested |
| image descriptions | 10 (catch-up guide) and 14 (certificates guide) images still undescribed (`--qa-later`) |

#### Reviews

Every L1 node, every exclusion and every L2 asset is **pending**: no
review has been recorded. The exclusions (Table 2's duplicates and two of
Table 3's) count only once a person acting as `l1-extraction-reviewer`
signs them.

#### L2 → L3

Not started at the time of writing; see the next stage.
