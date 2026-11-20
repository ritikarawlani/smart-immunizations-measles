### User scenarios

The journeys the processes and decision tables serve, told as stories. The 42
scenario candidates written at L1 (one per recommendation or practice, under
`l1-extractions/*/scenarios/`) are grouped here into the four journeys a
measles programme runs. Names are made up. **Adjudication: pending** (Clinical
SME).

#### MEASLES.S1 — A routine first and second dose

Asha is 9 months old and lives where measles still circulates. Her mother
brings her and her home-based record to the clinic. The health worker reads
the record: no MCV yet. Asha is well, has had no other live vaccine in the
last four weeks, and has no history of allergy to the vaccine. The health
worker gives MCV1, records it with the date, and writes the return date for
MCV2 at 15 months. At 15 months Asha returns; at least four weeks have passed,
so she gets MCV2 and her measles series is complete.

Rests on: `measles.mcv1-9-months-high-transmission`, `measles.mcv2-15-18-months`,
`measles.mcv-minimum-interval`, `measles.live-vaccine-spacing`,
`measles.contraindications`, `catchup.multi-dose-return-date`.

#### MEASLES.S2 — An older child who missed doses

Daniel is 6 years old and comes to the clinic for a cough. The health worker
uses the visit to check his vaccination status. His caregiver has no
home-based record and the register holds none, so the health worker assumes
he is unvaccinated and offers MCV. He gets his first dose today and is told to
return in four weeks for the second; no booster follows.

Rests on: `measles.catch-up-every-opportunity`, `measles.routine-delivery-not-age-limited`,
`catchup.every-touchpoint`, `catchup.unconfirmed-assume-unvaccinated`,
`measles.interrupted-delayed-schedule-row`.

#### MEASLES.S3 — An infant at high risk

Lina is 7 months old, born to a mother living with HIV, during a measles
outbreak in her district. The health worker gives a supplementary dose and
records it as MCV0. It does not count towards her routine doses: she still
gets MCV1 and MCV2 at the scheduled ages.

Rests on: `measles.mcv0-situations`, `measles.mcv0-recording`,
`measles.mcv0-then-routine-doses`, `measles.hiv-exposed-mcv0`.

#### MEASLES.S4 — A client who should not be vaccinated today

Grace, 24, asks for a measles vaccine before starting work at a hospital,
which requires proof of measles immunity. She is pregnant. The health worker
does not vaccinate her now and records the reason; she can be vaccinated
after the pregnancy.

Rests on: `measles.avoid-in-pregnancy`, `measles.health-worker-immunity`.

#### MEASLES.S5 — Finding children who are behind

Each month the programme manager at a health facility reviews the register
for children whose MCV1 or MCV2 is overdue, and for zero-dose children in the
catchment area, and arranges reminders and outreach. The data manager counts
MCV1 and MCV2 doses by age group, never recording a dose as MCV2 for a child
without MCV1, and reports coverage on the Joint Reporting Form.

Rests on: `catchup.defaulter-tracking`, `catchup.mcv2-only-after-mcv1`,
JRF 2016 rows 4160, 4180, 4260, 4270, 6250, 6270.
