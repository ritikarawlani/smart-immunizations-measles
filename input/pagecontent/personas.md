### Personas

The people and systems that act in the measles processes. Each reuses a
generic SMART Base persona: the sources attached to issue #1 name the roles
but this guide adds no persona of its own. **Adjudication: pending** (Clinical
SME).

| id | persona | generic persona | who they are here | evidence (L1) |
|---|---|---|---|---|
| `MEASLES.P.HealthWorker` | Health worker (vaccinator) | `DAK.Persona.HealthcareProvider` | Checks a client's vaccination record, decides which measles-containing vaccine (MCV) dose is due, screens for contraindications, vaccinates, records the dose and gives the return date. At a fixed site, at outreach or at school. | Table 1 measles footnote (every per-client recommendation); catch-up guide practices `catchup.every-touchpoint`, `catchup.confirm-by-written-record`, `catchup.multi-dose-return-date` |
| `MEASLES.P.Client` | Client and caregiver | `DAK.Persona.Person` | The child, adolescent or adult who is vaccinated, and the caregiver who brings a child and keeps the home-based record. | catch-up guide `catchup.multi-dose-return-date` (instructs the caregiver) |
| `MEASLES.P.ProgrammeManager` | Immunization programme manager | `DAK.Persona.HealthSystemManager` | Sets the national schedule (MCV1 at 9 or 12 months, MCV2 at 15–18 months or school entry), the catch-up schedule and policy, health-worker immunity rules, and organises defaulter tracking. | Table 1 `measles.two-doses-standard`, `measles.mcv2-in-schedule`, `measles.policies-allow-older-ages`, `measles.mcv2-at-school-entry`; Table 4 `measles.health-worker-immunity`; catch-up `catchup.national-catch-up-schedule`, `catchup.defaulter-tracking` |
| `MEASLES.P.DataManager` | Immunization data manager | `DAK.Persona.DataManager` | Aggregates doses by antigen and dose number, computes coverage, and fills the WHO/UNICEF Joint Reporting Form. | JRF 2016, sheets `4A. Routine Coverage`, `6. Indicators`; catch-up `catchup.mcv2-only-after-mcv1` |
