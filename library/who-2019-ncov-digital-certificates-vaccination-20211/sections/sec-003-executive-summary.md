---
doc_id: who-2019-ncov-digital-certificates-vaccination-20211
doc_title: "Digital Documentation of COVID-19 Certificates: Vaccination Status"
section_id: sec-003-executive-summary
section_title: "Executive Summary"
section_number: null
pages: 13-18
source_pdf: WHO-2019-nCoV-Digital_certificates-vaccination-2021.1.pdf
source_sha256: f57b14cb2acb728d
toc_source: inferred
---
concept of Digital Documentation of COVID-19 Certificates (DDCC) 
is proposed as a mechanism by which a person’s COVID-19-related 
health data can be digitally documented via an electronic certificate. 
A digital vaccination certificate that documents a person’s current 
vaccination status to protect against COVID-19 can then be used for 
continuity of care or as proof of vaccination for purposes other than 
health care. The resulting artefact of this approach is referred to as the 
Digital Documentation of COVID-19 Certificates: Vaccination Status 
(DDCC:VS). 
The current document is written for the ongoing global COVID-19 pandemic; thus, the approach is 
architected to respond to the evolving science and to the immediate needs of countries in this rapidly 
changing context; for this reason, the document is issued as interim guidance. The approach could 
eventually be extended to capture vaccination status to protect against other diseases.
The document is part of a series of guidance documents (see Fig. 1) on digital documentation of 
COVID-19-related data of interest: vaccination status (this document), laboratory test results, and 
history of SARS-CoV-2 infection.
The World Health Organization (WHO) has developed this guidance and accompanying technical 
specifications, in collaboration with a multidisciplinary group of partners and experts, in order to 
support WHO Member States in adopting interoperable standards for recording vaccination status. The 
audience of this document is therefore Member States and their implementing partners that want to 
put in place digitally signed vaccination records.
Executive summary
What is the DDCC:VS? 
A vaccination certificate is a health document that records a vaccination service received by an 
individual, traditionally as a paper card noting key details about the vaccinated individual, vaccine 
administered, date administered, and other data in the core data set (see section 5.2). Digital 
vaccination certificates are immunization records in an electronic format that are accessible by both 
the vaccinated person and authorized health workers, and which can be used in the same way as the 
paper card: to ensure continuity of care or provide proof of vaccination. These are the two scenarios 
considered in this document (see Table 1). 
A vaccination certificate can be purely digital (e.g. stored in a smartphone application or on a cloud-
based server) and replace the need for a paper card, or it can be a digital representation of the 
traditional paper-based record (see Fig. 2). A digital certificate should never require individuals to 
have a smartphone or computer. The link between the paper record and the digital record can be 
established using a one-dimensional (1D) or two-dimensional (2D) barcode, for example, printed on 
or affixed to the paper vaccination card. References to the “paper” record in this document mean a 
physical document (printed on paper, plastic card, cardboard, etc.). An illustrative example of a paper-
based DDCC:VS is given in Annex 1. 
The guidance in this document is for a digital record that only shows that a vaccination has occurred. 
The digital record is not intended to serve as an immunity passport or provide a judgement or decision 
on what that vaccination means or permits.
This guidance is consistent with advice provided to the WHO secretariat at the eighth meeting of the 
International Health Regulations (2005) Emergency Committee (IHR EC) regarding the coronavirus 
disease (COVID-19), “advocating for WHO to expedite the work to establish updated means for 
Figure 1
Guidance documents for DDCC
Guidance 
on digitally 
documenting 
COVID-19 
vaccination 
status
Guidance on digitally 
documenting SARS-CoV-2 
test results 
Guidance on digitally 
documenting history of 
SARS-CoV-2 infection 
DDCC: Vaccination Status
DDCC: SARS-CoV-2 
Test Result
DDCC: History of 
SARS-CoV-2 Infection
The DDCC:VS is a digitally signed representation of data content that describes a vaccination 
event. DDCC:VS data content respects the specified core data set and follows the Health Level 
Seven (HL7) Fast Healthcare Interoperability Resources (FHIR) standard detailed in the FHIR 
Implementation Guide. 
documenting COVID-19 status of travellers, including vaccination, history of SARS-CoV-2 infection, and 
SARS-CoV-2 test results.”1 In the absence of a mechanism to digitally document COVID-19 vaccination 
status, it may be recorded in the International Certificate of Vaccination and Prophylaxis (ICVP). The 
ICVP format and data set would suffice as a valid health document for any future digitization efforts. 
Furthermore, in response to the IHR EC advice to the Secretariat, WHO is actively working to update the 
design of the ICVP to accommodate the COVID-19 status of travelers, including vaccination, history of 
infection, and test results consistent with the DDCC:VS specifications. In relation to the ICVP, The IHR EC 
furthermore recommends States Parties “recognition of all COVID-19 vaccines that have received WHO 
Emergency Use Listing in the context of international travel. In addition, States Parties are encouraged 
to include information on COVID-19 status, in accordance with WHO guidance, within the WHO booklet 
containing the International Certificate of Vaccination and Prophylaxis; and to use the digitized version 
when available.”
1	 Statement on the eighth meeting of the International Health Regulations (2005) Emergency Committee regarding the coronavirus disease 
(COVID-19) pandemic
Digital Documentation of COVID-19 Certificates: Vaccination Status
Figure 2
Different illustrative formats of DDCC:VS
International 
Certificate of Vaccination 
or Prophylaxis 
(i.e. yellow card) 
National 
Immunization 
Home-based 
Record
A PDF print-out 
certificate with only a 
HCID which links to a 
DDCC:VS 
OR 
A PDF print-out with a 
2D barcode containing 
the full DDCC:VS core 
data set
A handwritten paper 
certificate with only a 
HCID, which links to a 
DDCC:VS 
OR 
A handwritten paper 
certificate with a 2D 
barcode containing the 
full DDCC:VS core data set
A DDCC:VS 
held on a smartphone
1
2
4
3
5
NATIONAL
CERTIFICATE
NATIONAL
CERTIFICATE
NATIONAL
CERTIFICATE
Scenarios of use of the DDCC:VS
The scope of this document covers two scenarios of use for the DDCC:VS (see Table 1). 
1.	
CONTINUITY OF CARE: Vaccination records are an important part of an individual’s medical records, 
starting at birth. The Continuity of Care scenario describes the primary purpose of a vaccination 
certificate. The vaccination record shows individuals and caregivers which vaccinations an 
individual has received, as part of that individual’s medical history; it therefore supports informed 
decision-making on any future health service provision.
2.	
PROOF OF VACCINATION: Vaccination records can also provide proof of vaccination status for 
purposes not related to health care. 
Table 1
Some possible uses of DDCC:VS
Continuity of Care 
Proof of Vaccination 
	
→
Provides a basis for health workers to offer a subsequent 
dose and/or appropriate health services
	
→
Provides schedule information for an individual to know 
whether another dose, and of which vaccine, is needed, and 
when the next dose is due
	
→
Enables investigation into adverse events by health workers, 
as per existing guidance on adverse events following 
immunization (AEFI) (vaccine safety)
	
→
Establishes the vaccination status of individuals in coverage 
monitoring surveys 
	
→
Establishes vaccination status after a positive COVID-19 test, 
to understand vaccine effectiveness
	
→
For work
	
→
For university education
	
→
For international travel*
*	In the context of international travel, in accordance with advice from the 8th meeting of the International Health Regulations (2005) Emergency Committee on COVID-19, held on 
14 July 2021, countries should not require proof of COVID-19 vaccination as a condition for travel.
The use cases within the two scenarios will vary depending on the digital maturity and local context of 
the country in which a DDCC:VS solution is implemented.
What are the minimum requirements to implement a 
DDCC:VS?
Digital vaccination certificates should meet the public health needs of each WHO Member State, 
as well as the needs of individuals around the world. They should never create inequity due to lack 
of access to specific software or technologies (i.e. a digital divide). The recommendations for the 
implementation of DDCC:VS must therefore be applicable to the widest range of use cases, catering to 
many different levels of digital maturity between implementing countries. The minimum requirements 
were developed accordingly, to allow the greatest possible flexibility for Member States and their 
implementer(s) to build a solution that is fit for purpose in the context of their overall health 
information systems.  
The minimum requirements for a DDCC:VS are as follows.
	
→The potential benefits, risks and costs of implementing a DDCC:VS solution should be assessed 
before introducing a DDCC:VS system and its associated infrastructure. This includes an impact 
assessment of the ethical and privacy implications and potential risks that may arise with the 
implementation of a DDCC:VS.
	
→Member States must establish the appropriate policies for appropriate use, data protection and 
governance of the DDCC:VS to reduce the potential harms, while achieving the public health 
benefits involved in deploying such a solution. 
	
→A digitally signed electronic version of the data about a vaccination event, called a DDCC:VS, must 
exist. As a minimum, both the required data elements in the core data set and the metadata should 
be recorded, as described in section 5.2.
	
→An individual who has received a vaccination should have access to proof of this – either as a 
traditional paper card or a version of the electronic DDCC:VS.
	
→Where a paper vaccination card is used, it should be associated with a health certificate identifier 
(HCID). A DDCC:VS should be associated, as a digital representation, with the paper vaccination 
card via the HCID. Multiple forms of digital representations of the DDCC:VS may be associated with 
the paper vaccination card via the HCID.
	
→The HCID should appear on any paper card in both a human-readable and a machine-readable 
format (i.e. alphanumeric characters that are printed, as well as rendered as a 1D or 2D barcode).
	
→A DDCC:VS Generation Service should exist. The DDCC:VS Generation Service is responsible for 
taking data about a vaccination event, converting it to use the FHIR standard, and then digitally 
signing the FHIR document and returning it to the DDCC:VS Holder. This signed FHIR document is 
the DDCC:VS.
	
→A DDCC:VS Registry Service should exist. The DDCC:VS Registry Service is responsible for storing 
an index that associates an HCID with metadata about the DDCC:VS. As a minimum, the Registry 
Service stores the core metadata described in section 5.2. One or more DDCC:VS Repository 
Service(s) may exist, which can be used to retrieve a DDCC:VS; in which case the location of the 
DDCC:VS may also be included in the metadata within the DDCC:VS Registry Service. 
The different services are discussed in more detail in sections 3 and 4, and are shown in Fig. 7.
These components are minimum requirements; Member States may adopt and develop additional 
components for their deployed DDCC:VS system.
