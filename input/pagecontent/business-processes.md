### Business processes

Two processes (BPMN 2.0 with diagram interchange) in `input/business-processes/`, checked with `bun run cat bpmn:detangle` (layout) and drawn with the platform's renderer. **Adjudication: pending** (Clinical SME; programme SME for MEASLES.B).

#### MEASLES.A — Measles vaccination contact

Lanes: client and caregiver; health worker. A client at any health contact (fixed site, outreach, school, or a visit for something else) brings a home-based record if there is one. The health worker retrieves the history, counts the recorded doses (DT.03), determines the dose due (DT.01, and DT.04 for a child living with HIV on HAART), screens (DT.02), gives MCV, records it with the next due date, or records why not and when to return.

Rests on: the per-client recommendations of Table 1's measles footnote and Table 3's measles row; the catch-up guide's practices on records, validity, spacing and return dates. Serves user scenarios S1–S4.

#### MEASLES.B — Defaulter tracking and coverage reporting

Lanes: programme manager; data manager; health worker. Monthly, the programme manager lists children overdue for MCV1 or MCV2 and zero-dose children; health workers remind caregivers and reach them (they then go through MEASLES.A); the data manager aggregates MCV doses and computes the indicators; the programme manager reviews coverage and dropout; the data manager reports annually on the Joint Reporting Form.

Rests on: catch-up guide `catchup.defaulter-tracking`, `catchup.mcv2-only-after-mcv1`; JRF 2016. Serves user scenario S5.

#### Not drawn

Recommendations acted on outside a client contact have no process here: national schedule and policy decisions (`measles.two-doses-standard`, `measles.mcv2-in-schedule`, `measles.policies-allow-older-ages`, `measles.mcv2-at-school-entry`, `measles.same-formulation-both-doses`, `catchup.national-catch-up-schedule`) and the health-worker immunity condition (`measles.health-worker-immunity`). They configure MEASLES.A (DE.06, the schedule setting) or are listed in the gap report.
