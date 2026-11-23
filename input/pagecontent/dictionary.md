### Core data elements

The data a measles vaccination contact and its reporting need; each element names the decision table or process step that uses it and the L1 node it rests on. Reviewed by the Clinical SME (meaning) and a terminologist (codes; none bound yet).

| id | label | description | data type | allowed values | required | used by | source (L1) |
|---|---|---|---|---|---|---|---|
| MEASLES.DE.01 | Client identifier | Unique identifier of the client in the register or EIR | Identifier |  | R | MEASLES.A | catchup.confirm-by-written-record |
| MEASLES.DE.02 | Date of birth | Client's date of birth | Date |  | R | DT.01 DT.03 (age) | T1 measles footnote (ages throughout) |
| MEASLES.DE.03 | Sex | Client's sex | Coding | female \| male \| other \| unknown | O | IND.01 IND.02 disaggregation | JRF 4A. Routine Coverage |
| MEASLES.DE.04 | Caregiver name | Name of the caregiver who brings a child | String |  | O | MEASLES.A | catchup.multi-dose-return-date |
| MEASLES.DE.05 | Home-based record presented | Whether a home-based record was presented at this contact | Boolean |  | R | MEASLES.A A1 | catchup.confirm-by-written-record |
| MEASLES.DE.06 | National schedule setting | Whether the national schedule gives MCV1 at 9 months (high transmission) or 12 months (low transmission) | Coding | high \| low | R | DT.01 transmissionSetting | measles.mcv1-9-months-high-transmission; measles.mcv1-12-months-low-transmission |
| MEASLES.DE.07 | Supplementary-dose indication | The infant is in a situation the measles footnote lists for a dose from 6 months | Coding (multiple) | outbreak-intensified-service \| high-risk-campaign \| displaced-refugee-conflict \| contact-or-high-exposure \| travel-to-outbreak-country \| hiv-infected-or-exposed \| high-hiv-and-measles-incidence | O | DT.01 supplementaryIndication | measles.mcv0-situations; measles.hiv-high-incidence-mcv0-6-months |
| MEASLES.DE.08 | MCV dose: date given | Date a measles-containing vaccine dose was given | Date |  | R | DT.03 DT.01 | measles.mcv0-recording |
| MEASLES.DE.09 | MCV dose: dose label | How the dose counts | Coding | MCV0 \| MCV1 \| MCV2 \| extra \| invalid \| not counted | R | DT.03 countsAs | measles.mcv0-recording; catchup.mcv2-only-after-mcv1 |
| MEASLES.DE.10 | MCV dose: vaccine | Which measles-containing vaccine was given | Coding | M \| MM \| MR \| MMR \| MMRV | R | IND.01 IND.02 | JRF 2A. Schedule rows 2270-2310; measles.same-formulation-both-doses |
| MEASLES.DE.11 | MCV dose: documented | Whether the dose is documented in a home-based record or register | Boolean |  | R | DT.03 documented | catchup.confirm-by-written-record; catchup.unconfirmed-assume-unvaccinated |
| MEASLES.DE.12 | Anaphylaxis or severe allergy to a vaccine component | History of anaphylaxis or severe allergic reaction to any component (e.g. neomycin or gelatin) | Boolean |  | R | DT.02 | measles.contraindications |
| MEASLES.DE.13 | Severe immunosuppression | Client has any form of severe immunosuppression | Boolean |  | R | DT.02 | measles.contraindications |
| MEASLES.DE.14 | Pregnant | Client is pregnant | Boolean |  | R (if of childbearing age) | DT.02 | measles.avoid-in-pregnancy |
| MEASLES.DE.15 | Mild concurrent infection | Client has a mild concurrent infection (recorded; not a reason to defer) | Boolean |  | O | DT.02 | measles.mild-infection-not-contraindication |
| MEASLES.DE.16 | Date of last other live vaccine | Date another live vaccine (not OPV) was last given | Date |  | O | DT.02 weeksSinceOtherLiveVaccine | measles.live-vaccine-spacing; catchup.live-vaccine-spacing |
| MEASLES.DE.17 | HIV status | Client's HIV status | Coding | infected \| exposed-infant \| negative \| unknown | O | DT.01 DT.04 | measles.hiv-routine-vaccination; measles.hiv-exposed-mcv0 |
| MEASLES.DE.18 | Receiving HAART | Client is receiving highly active antiretroviral therapy | Boolean |  | O | DT.04 | measles.hiv-haart-additional-dose |
| MEASLES.DE.19 | HAART start date | Date HAART was started | Date |  | O | DT.04 monthsSinceHaartStart | measles.hiv-haart-no-cd4-monitoring |
| MEASLES.DE.20 | CD4+ T lymphocyte percentage | Most recent CD4+ T lymphocyte count as a percentage | Quantity (%) |  | O | DT.04 | measles.hiv-haart-additional-dose |
| MEASLES.DE.21 | HIV additional MCV dose given | The additional dose after immune reconstitution has been given | Boolean |  | O | DT.04 | measles.hiv-haart-additional-dose |
| MEASLES.DE.22 | Screening outcome | Outcome of screening before vaccination | Coding | proceed \| defer \| do-not-vaccinate \| unknown | R | MEASLES.A G2 | DT.02 |
| MEASLES.DE.23 | Reason not vaccinated | Why no dose was given at this contact | Coding | not-due \| series-complete \| pregnant \| contraindication \| live-vaccine-spacing \| other | C | MEASLES.A A9 | measles.avoid-in-pregnancy; measles.contraindications; measles.live-vaccine-spacing |
| MEASLES.DE.24 | Next MCV due date | Date the next MCV dose is due | Date |  | C | MEASLES.A A7 A9; MEASLES.B B1 | catchup.multi-dose-return-date |
| MEASLES.DE.25 | Health worker measles immunity proof | Proof or documentation of measles immunity or immunization for a health worker | Coding | documented-immunization \| documented-immunity \| none | C (health workers) | MEASLES.S4 | measles.health-worker-immunity |
| MEASLES.DE.26 | Confirmed measles case | A confirmed measles case (laboratory or epidemiological link; reported clinical cases included as the JRF instructs) | Boolean |  | O | IND.07 | JRF 1. Reported Cases row 1020; Instructions row 10 |

Source file: `input/dictionary/measles-core-data-elements.csv`. **Adjudication: pending.**
