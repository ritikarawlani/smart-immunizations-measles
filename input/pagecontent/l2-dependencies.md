### L2 dependencies (stage 3)

Which existing DAKs this measles DAK reuses, extends or adapts, decided per
candidate as `l2-dependency-choice` asks. **Adjudication: pending** — the
programme manager and business analyst have not reviewed these rows.

| candidate | decision | reason | what is used |
|---|---|---|---|
| WHO SMART Base (smart-base) | **reuse** | The base every SMART Guideline builds on; it holds the generic personas and the DAK component definitions. | `DAK.Persona.HealthcareProvider`, `DAK.Persona.HealthSystemManager`, `DAK.Persona.Person`, `DAK.Persona.DataManager`; the DAK component set. |
| WHO SMART Immunizations (IMMZ) DAK | **not used** | Owner's source rule for issue #1: content comes only from the sources attached to the issue. Its personas, processes, decision tables and data dictionary are therefore not copied, though they cover the same ground. | — |

Toolchain per component, as stage 4 uses it:

| component | authored as | checked by |
|---|---|---|
| personas, user scenarios | Markdown pages (`personas.md`, `user-scenarios.md`) | review on the rendered page |
| business processes | BPMN 2.0 XML in `input/business-processes/` | BPMN XML parse; rendered for review |
| decision logic | DMN 1.3 XML in `input/decision-logic/` | DMN XML parse; the test scenarios run through each table |
| core data elements | CSV in `input/dictionary/` | column check against the decision tables' inputs |
| indicators | CSV in `input/indicators/` | each names its numerator and denominator data elements |
| requirements | CSV in `input/system-requirements/` | each names the user scenario it serves |
| test scenarios | Gherkin in `input/testing/` | each names the decision-table rule it exercises |
