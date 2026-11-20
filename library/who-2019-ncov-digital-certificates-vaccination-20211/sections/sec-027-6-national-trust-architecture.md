---
doc_id: who-2019-ncov-digital-certificates-vaccination-20211
doc_title: "Digital Documentation of COVID-19 Certificates: Vaccination Status"
section_id: sec-027-6-national-trust-architecture
section_title: "National Trust Architecture"
section_number: 6
pages: 63-65
source_pdf: WHO-2019-nCoV-Digital_certificates-vaccination-2021.1.pdf
source_sha256: f57b14cb2acb728d
toc_source: inferred
---
Architecture for
the DDCC:VS
6 
The scenarios presented in earlier chapters, and the data associated 
with them, suggest the need for a digital ecosystem within a country 
for the issuance, updating and verification of the DDCC:VS. This 
ecosystem would comprise a suite of digital tools for the management 
of DDCC:VS data and the processes and governance rules for using 
these systems. It could be as simple as a server for storing and 
managing the data or as extensive as an entire health information 
exchange infrastructure. 
In Annex 6, considerations for such a national architecture of digital components are presented as a 
generic design for a set of interconnected components that would facilitate the successful operation 
of a national DDCC:VS system. Member States are at different levels of digital health maturity and 
investment, and have different local contexts. The architecture is presented as general guidance with 
the expectation that this guidance will be adapted and tailored to suit the specific real-world needs of 
each Member State. 
In order to sign a digital document, PKI technology is required. PKI uses private and public key pairs 
to operationalize digital signing and cryptographic verification. Content that is signed by a private 
key can be verified by the corresponding public key of the key pair. This sign–verify mechanism is 
leveraged to establish the trust framework (chain of trust; see Fig. 13). There are many different 
mechanisms/technologies to implement this approach. PKI is described in further detail in Annex 4.
Member States will need to establish or utilize a domestic PKI that can be leveraged to issue and to 
verify DDCC:VS. An existing PKI framework may be used, provided it meets the requirements outlined 
in this document. This document assumes that a PKI has already been deployed or is available within 
a country to support the DDCC:VS workflows described in sections 3 and 4. The PKI can be maintained 
and managed by another government entity (e.g. ministry of ICT, ministry of interior, ministry of 
foreign affairs) or by a contractor that the PHA has selected. Regardless, PHAs will have the signing 
authority. The two key steps for establishing a PKI framework are: 
1.	 The PHA will need to generate at least one document signer certificate (DSC) – a private–public 
key pair that can be used by the trusted agents of the PHA to sign the DDCC:VS. 
2.	 The Member State will need to establish a mechanism to assert that a DSC from a PHA has been 
authorized to sign health documents. Two approaches are outlined in section 7.
There are many ways in which a PKI can be implemented. An example implementation of digital 
signing is provided in the implementation guide available at: https://WorldHealthOrganization.github.
io/ddcc. The precise algorithms used for the implementation – for example, for hashing and for 
signature generation – are at the discretion of the Member State.
Figure 13
The chain of trust
CSCA
country signing 
certificate authority
DSC
document signer 
certificate
DDCC
Digital 
Documentation 
of COVID-19 
Certificate
public
private
public
private
Signing and Issuing a DDCC
Verifying a DDCC
1
3
3
1
2
2
