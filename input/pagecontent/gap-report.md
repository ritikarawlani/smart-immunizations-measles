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

The readiness gate (`input/L3/l3-readiness.json`) found nothing missing
before stage 6. What L3 now holds, and what it does not:

| L2 asset | L3 | note |
|---|---|---|
| DT.01–DT.04 | ✓ Library (CQL) + SGDecisionTable PlanDefinition each | derived rule for rule by `input/L3/dmn2cql.py`; compiled; 28/28 dummy clients pass |
| IND.01, .02, .06, .07 | ✓ Measures + `MEASLESIndicators.cql` | denominators are an **interpretation** of the JRF's population estimates (registered children turning 1 or 2), pending the programme manager |
| IND.03, .04 (districts by coverage band), IND.05 (late MCV1 doses) | — | aggregate counts over districts and doses, not patient-level Measures |
| core data elements | ✓ logical model, CodeSystem, 9 ValueSets | **local codes only**: no SNOMED CT / LOINC / ICD-11 binding until the terminologist reviews |
| personas | ✓ 4 ActorDefinitions | |
| functional requirements | ✓ Requirements | |
| MEASLES.A / MEASLES.B (BPMN) | — | no workflow PlanDefinition yet |
| forms | — | **no Questionnaire**: stage 4 designed no form wireframe (`wireframe-design-review`), and the Questionnaire is derived from the chosen wireframe |
| test scenarios | — | run against the CQL (above); no FHIR test bundles |

The IG Publisher has not been run here: SUSHI builds clean (0 errors,
0 warnings), but the rendered IG, its QA report and the CQL packaging by
the Publisher are not checked. No build workflow is installed yet.
