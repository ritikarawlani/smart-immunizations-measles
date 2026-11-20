// L3 of input/pagecontent/personas.md (MEASLES.P.*). Each persona specialises a smart-base generic persona.
Instance: MEASLES.P.HealthWorker
InstanceOf: $SGActor
Usage: #definition
* status = #draft
* experimental = true
* name = "MEASLESHealthWorker"
* title = "Health worker (vaccinator)"
* type = #person
* description = "Checks a client's vaccination record, decides which measles-containing vaccine dose is due, screens for contraindications, vaccinates, records the dose and gives the return date. Specialises DAK.Persona.HealthcareProvider."

Instance: MEASLES.P.Client
InstanceOf: $SGActor
Usage: #definition
* status = #draft
* experimental = true
* name = "MEASLESClient"
* title = "Client and caregiver"
* type = #person
* description = "The child, adolescent or adult who is vaccinated, and the caregiver who brings a child and keeps the home-based record. Specialises DAK.Persona.Person."

Instance: MEASLES.P.ProgrammeManager
InstanceOf: $SGActor
Usage: #definition
* status = #draft
* experimental = true
* name = "MEASLESProgrammeManager"
* title = "Immunization programme manager"
* type = #person
* description = "Sets the national schedule, the catch-up policy and health-worker immunity rules, and organises defaulter tracking. Specialises DAK.Persona.HealthSystemManager."

Instance: MEASLES.P.DataManager
InstanceOf: $SGActor
Usage: #definition
* status = #draft
* experimental = true
* name = "MEASLESDataManager"
* title = "Immunization data manager"
* type = #person
* description = "Aggregates doses by antigen and dose number, computes coverage and fills the WHO/UNICEF Joint Reporting Form. Specialises DAK.Persona.DataManager."
