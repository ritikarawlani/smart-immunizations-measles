---
doc_id: who-2019-ncov-digital-certificates-vaccination-20211
doc_title: "Digital Documentation of COVID-19 Certificates: Vaccination Status"
section_id: sec-front-matter
section_title: "Front matter"
section_number: null
pages: 1-7
source_pdf: WHO-2019-nCoV-Digital_certificates-vaccination-2021.1.pdf
source_sha256: f57b14cb2acb728d
toc_source: inferred
---
A
Digital Documentation 
of COVID-19 Certificates: 
Vaccination Status
TECHNICAL SPECIFICATIONS AND IMPLEMENTATION GUIDANCE
 27 August 2021
B
Digital Documentation 
of COVID-19 Certificates: 
Vaccination Status
TECHNICAL SPECIFICATIONS AND IMPLEMENTATION GUIDANCE
 27 August 2021
Digital Documentation of COVID-19 Certificates: Vaccination Status — Technical Specifications and 
Implementation Guidance, 27 August 2021. 
WHO/2019-nCoV/Digital_certificates/vaccination/2021.1 
© World Health Organization 2021 
Some rights reserved. This work is available under the Creative Commons Attribution-NonCommercial-ShareAlike 
3.0 IGO licence (CC BY-NC-SA 3.0 IGO; https://creativecommons.org/licenses/by-nc-sa/3.0/igo). 
Under the terms of this licence, you may copy, redistribute and adapt the work for non-commercial purposes, 
provided the work is appropriately cited, as indicated below. In any use of this work, there should be no 
suggestion that WHO endorses any specific organization, products or services. The use of the WHO logo is not 
permitted. If you adapt the work, then you must license your work under the same or equivalent Creative 
Commons licence. If you create a translation of this work, you should add the following disclaimer along with the 
suggested citation: “This translation was not created by the World Health Organization (WHO). WHO is not 
responsible for the content or accuracy of this translation. The original English edition shall be the binding and 
authentic edition”. 
Any mediation relating to disputes arising under the licence shall be conducted in accordance with the mediation 
rules of the World Intellectual Property Organization (http://www.wipo.int/amc/en/mediation/rules/). 
Suggested citation. Digital Documentation of COVID-19 Certificates: Vaccination Status — Technical 
Specifications and Implementation Guidance, 27 August 2021. Geneva: World Health Organization; 2021 
(WHO/2019-nCoV/Digital_certificates/vaccination/2021.1). Licence CC BY-NC-SA 3.0 IGO. 
Cataloguing-in-Publication (CIP) data. CIP data are available at http://apps.who.int/iris. 
Sales, rights and licensing. To purchase WHO publications, see http://apps.who.int/bookorders. To submit 
requests for commercial use and queries on rights and licensing, see http://www.who.int/about/licensing. 
Third-party materials. If you wish to reuse material from this work that is attributed to a third party, such as 
tables, figures or images, it is your responsibility to determine whether permission is needed for that reuse and to 
obtain permission from the copyright holder. The risk of claims resulting from infringement of any third-party-
owned component in the work rests solely with the user. 
General disclaimers. The designations employed and the presentation of the material in this publication do not 
imply the expression of any opinion whatsoever on the part of WHO concerning the legal status of any country, 
territory, city or area, or of its authorities, or concerning the delimitation of its frontiers or boundaries. Dotted 
and dashed lines on maps represent approximate border lines, for which there may not yet be full agreement. 
The mention of specific companies or of certain manufacturers’ products does not imply that they are endorsed or 
recommended by WHO in preference to others of a similar nature that are not mentioned. Errors and omissions 
excepted; the names of proprietary products are distinguished by initial capital letters. 
All reasonable precautions have been taken by WHO to verify the information contained in this publication. 
However, the published material is being distributed without warranty of any kind, either expressed or implied. 
The responsibility for the interpretation and use of the material lies with the reader. In no event shall WHO be 
liable for damages arising from its use. 
Editing: Green Ink Publishing Services Ltd. 
Design and layout: RRD Design LLC 
Contents
Acknowledgements	
v
Abbreviations	
vii
Glossary	
viii
1.1.	
Purpose of this document	
1
1.2.	
Target audience	
2
1.3.	
Scope 	
2
1.4.	
Assumptions	
3
1.5.	
Methods 	
5
1.6.	
Additional WHO guidance documents 	
5
1.7.	
Other initiatives	
5
2.1.	
Ethical considerations for a DDCC:VS	
6
2.2.	
Data protection principles for a DDCC:VS	
12
2.3.	
DDCC:VS design criteria	
15
3.1.	
Key settings, personas and digital services 	
16
3.2.	
Continuity of Care workflows and use cases	
18
3.3.	
Functional requirements for Continuity of Care scenario	
24
4.1.	
Key settings, personas and digital services	
27
4.2.	
Proof of Vaccination workflows and use cases 	
29
4.3.	
Functional requirements for Proof of Vaccination scenario	
37
SECTION 1 	 Introduction 	
1
Executive Summary 	
xi
SECTION 2 	 Ethical considerations and data protection principles 	
6
SECTION 3 	 Continuity of Care scenario 	
16
SECTION 4 	 Proof of Vaccination scenario  	
27
5.1.	
Core data set principles	
40
5.2.	
Core data elements	
42
6.1.	
Signing a DDCC:VS	
48
6.2.	
Verifying a DDCC:VS signature	
49
6.3.	
Trusting a DDCC:VS signature	
50
8.1.	
Considerations before deploying	
54
8.2.	
Key factors to consider with solution developers 	
56
8.3.	
Cost category considerations 	
57
8.4.	
Additional resources to support implementation	
59
References	
60
Annex 1 	
Illustrative example of Digital Documentation of COVID-19 
Certificates: Vaccination Status (DDCC:VS)	
63
Annex 2	
Business process symbols used in workflows	
64
Annex 3 	
Guiding principles for mapping the WHO Family of International 
Classifications (WHO-FIC) and other classifications	
65
Annex 4 	
What is public key infrastructure (PKI)?	
68
Annex 5 	
Non-functional requirements	
72
Annex 6 	
Open Health Information Exchange (OpenHIE)-based 
architectural blueprint	
77
	
Web Annex A	
DDCC:VS Core data dictionary
	
	
https://apps.who.int/iris/bitstream/handle/10665/343264/WHO-2019-
	
	
nCoV-Digital-certificates-vaccination-data-dictionary-2021.1-eng.xlsx
	
Web Annex B	
Technical Briefing
	
	
https://apps.who.int/iris/bitstream/handle/10665/344456/WHO-2019-
	
	
nCoV-Digital_certificates-vaccination-technical_briefing-2021.1-eng.pdf
SECTION 6 	 National Trust Architecture 	
46
SECTION 7	
National governance considerations 	
51
SECTION 8 	 Implementation considerations  	
53
Annexes 	
62
SECTION 5 	 DDCC:VS core data set 	
40
