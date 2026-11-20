// Generated from input/system-requirements/measles-functional-requirements.csv (L2).
Instance: MEASLES.FR
InstanceOf: $SGRequirements
Title: "Measles functional requirements"
Usage: #definition
* name = "MEASLESFunctionalRequirements"
* title = "Measles functional requirements"
* status = #draft
* experimental = true
* publisher = "WHO"
* description = "What a digital system supporting MEASLES.A and MEASLES.B must do; L3 of the L2 requirements."
* statement[+].key = "MEASLES.FR.01"
* statement[=].label = "MEASLES.FR.01"
* statement[=].requirement = "The system shall show a client's documented MCV doses with date and vaccine and how each counts (MCV0 MCV1 MCV2 invalid not counted)"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.02"
* statement[=].label = "MEASLES.FR.02"
* statement[=].requirement = "The system shall treat a client with no documented MCV dose as unvaccinated"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.03"
* statement[=].label = "MEASLES.FR.03"
* statement[=].requirement = "The system shall determine the MCV dose due today from age and valid doses and the national schedule setting"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.04"
* statement[=].label = "MEASLES.FR.04"
* statement[=].requirement = "The system shall not limit MCV1 or MCV2 to the target ages and shall offer missed doses at any contact"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.05"
* statement[=].label = "MEASLES.FR.05"
* statement[=].requirement = "The system shall record any MCV dose given before 9 months as MCV0 and keep MCV1 and MCV2 due"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.06"
* statement[=].label = "MEASLES.FR.06"
* statement[=].requirement = "The system shall never record a dose as MCV2 for a client without a valid MCV1"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.07"
* statement[=].label = "MEASLES.FR.07"
* statement[=].requirement = "The system shall prompt the screening questions (allergy to a component; severe immunosuppression; pregnancy; other live vaccine in the last 4 weeks) before vaccination"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.08"
* statement[=].label = "MEASLES.FR.08"
* statement[=].requirement = "The system shall record the reason a client was not vaccinated and the return date"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.09"
* statement[=].label = "MEASLES.FR.09"
* statement[=].requirement = "The system shall calculate the next MCV due date and print it for the home-based record"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.10"
* statement[=].label = "MEASLES.FR.10"
* statement[=].requirement = "The system shall flag the additional dose for an HIV-infected child on HAART"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.11"
* statement[=].label = "MEASLES.FR.11"
* statement[=].requirement = "The system shall list children overdue for MCV1 or MCV2 and zero-dose children each month"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.12"
* statement[=].label = "MEASLES.FR.12"
* statement[=].requirement = "The system shall compute IND.01 to IND.07 and produce the Joint Reporting Form measles rows"
* statement[=].conformance = #SHALL
* statement[+].key = "MEASLES.FR.13"
* statement[=].label = "MEASLES.FR.13"
* statement[=].requirement = "The system shall record a health worker's proof of measles immunity or immunization"
* statement[=].conformance = #SHALL
