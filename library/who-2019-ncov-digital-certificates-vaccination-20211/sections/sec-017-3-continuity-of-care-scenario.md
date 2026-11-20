---
doc_id: who-2019-ncov-digital-certificates-vaccination-20211
doc_title: "Digital Documentation of COVID-19 Certificates: Vaccination Status"
section_id: sec-017-3-continuity-of-care-scenario
section_title: "Continuity of Care scenario"
section_number: 3
pages: 33-35
source_pdf: WHO-2019-nCoV-Digital_certificates-vaccination-2021.1.pdf
source_sha256: f57b14cb2acb728d
toc_source: inferred
---
physical location. 
1.	 CARE SITE: where the vaccination event takes place. Some examples of this include at a primary 
health-care facility, a temporary vaccination site, or a pharmacy, as determined by the Member 
State’s vaccine delivery plan. 
2.	 DATA ENTRY SITE: where the vaccination record is digitized. The record can be digitized at the care 
site if the digital solution is available, or it can be done retroactively under the auspices of the 
public health authority or health service provider.
The key personas, or relevant stakeholders, involved in the provision of a DDCC:VS are outlined in 
Table 2. These key personas are anticipated to interact with the digital services outlined in Table 3, 
including digital services that might not have a user interface that the key personas interact with, but 
are critical building blocks of the reference architecture.
Table 2
Key personas for Continuity of Care
Role
Description
Subject of Care
The person who receives the vaccination.
DDCC:VS Holder
The person who has the Subject of Care’s vaccination certificate. The person is usually 
the Subject of Care but does not have to be. For example, a caregiver may hold the DDCC:VS 
for a child or other dependant. 
Vaccinator
The person who administers the vaccine. Depending on national policies, the person who 
administers the vaccine might not be a formal health-care worker. Examples of vaccinators 
could include physicians, nurse practitioners, community health workers or other trained 
volunteers.    
Data Entry 
Personnel
The person who enters the information about the Subject of Care (as outlined in the core 
data set) that has been manually recorded at care sites into a digital system. Health workers 
can also be the Data Entry Personnel if a point-of-care system is in place that allows health 
workers to digitally document a vaccination event right away. 
Public Health 
Authority (PHA)
An entity or organization under whose auspices the vaccination is performed and the 
DDCC:VS is issued.
Table 3
Digital services for Continuity of Care
Digital service 
Description
Digital Health Solution
A secure system that is used at the point of care or health facility, such as an electronic 
immunization registry (EIR), an electronic medical record or a shared health record (SHR).
DDCC:VS Generation 
Service
The service that is responsible for taking data about a vaccination event, converting that data 
to use the FHIR standard, signing that HL7 FHIR document, returning it to the Digital Health 
Solution, and making the digital artefact available to serve Continuity of Care and Proof of 
Vaccination use cases.
The signed HL7 FHIR document is the DDCC:VS. The Digital Health Solution is, in turn, 
responsible for distributing the DDCC:VS and any associated representation of the data (such 
as a QR code) to the DDCC:VS Holder, based on PHA policy.
This service also registers this signed document in a location available to the DDCC:VS Registry 
Service and potentially generates extra artefacts, such as QR code representations.
