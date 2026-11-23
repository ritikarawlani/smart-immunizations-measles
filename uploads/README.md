# uploads/

The L1 sources attached to issue #1, as the owner uploaded them (commit
182c762), unchanged. They are the only content sources of this guideline.

| file | sha256 |
|---|---|
| `Monitoring-Metrics-Related-to-the-Global-Covid-19-Vaccination-Strategy---July-2022-update.pdf` | `129415f7c33d6069c1e200fe2848ebbfbab0dcec2d78149012b7a9543d7f033e` |
| `WHO-2019-nCoV-Digital_certificates-vaccination-2021.1.pdf` | `f57b14cb2acb728d74f37934b2f16f21bc6f1841bbbe4fd0a878ed26c4e9c607` |
| `electronic-immunization-registry-PAHO-9789275119532_eng.pdf` | `1010a882f2c1990aec1b6ad1f69a6eda548ba007f3c667db5c1edef1b87dcd34` |
| `facilityanalysisguide-immunization.pdf` | `899513a64de612a66e318efdd8ed84ec1d63eec3a72bba49f73bdfefe387d01b` |
| `immunization-summary-table-1.pdf` | `9861c483644986f477485fdf98f61f493a4f1e2ace8e20f48c04ba70e0d18f8d` |
| `immunization-summary-table-2.pdf` | `ad39704721d999437c3856de0ccb1e825e4f414358142f3bb5970da031fbe025` |
| `immunization-summary-table-3.pdf` | `aead588449159c46bad3a190f6427f4bf3d53ead55786b165105ccffaeb357a2` |
| `immunization-summary-table-4.pdf` | `e821b7b570ddb9ec58d779609cbc7c5f1592d67dcb53aa578e4669beb74bc59a` |
| `leave-no-one-behind-catch-up-vaccination-9789240016514.pdf` | `f13c21a9eec89c9b36112f6cb50b5de83bdbe4b541e650ba0ef39402c6cbedca` |
| `WHO_UNICEF_JRF_EN_2016.xls` | `e2ed10af525065644714dba4ad4eb24cf56cf74b26e9d604fe2971f83ba9175e` |

## One derived copy

`WHO_UNICEF_JRF_EN_2016.xlsx` is `WHO_UNICEF_JRF_EN_2016.xls` converted by
LibreOffice (`soffice --headless --convert-to xlsx`) on 2026-11-20, because
the platform's ingestion reads only OOXML/ODF workbooks
(cat-harness-tools `TABULAR_MIMETYPES`), not the legacy binary `.xls`.
Checked after conversion: the same 15 sheets, the same dimensions, and the
same empty/non-empty state in every cell (xlrd against openpyxl). The `.xls`
remains the source; the `.xlsx` is what `library/who-unicef-jrf-en-2016/`
was ingested from. sha256 of the copy:
`ece9ad01bc2f459fbde705deae427ce30906be32fd26ac05e80552f682acfa81`.

who.int/data/immunization, also named by the issue, redirects to the WHO
Immunization Data portal (immunizationdata.who.int), an interactive dashboard
with no guideline text; it is cited, not ingested.
