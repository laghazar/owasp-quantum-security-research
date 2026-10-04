# QS04 — Standards and Regulatory Mapping Audit (FULL)

## Problem

Same as QS01 and QS03:
- Section has unresolved TODO
- Mixed document types (guidance, roadmap, fact sheet, specification)
- Regulatory claims risk being over-stated

## Proposed taxonomy table (adopt QS01/QS03 structure)

| Source | Type | Scope | QS04 relevance |
|---|---|---|---|
| UK NCSC PQC Timelines | Government guidance | UK / broader reference | Discovery & assessment |
| CISA/NSA/NIST Quantum-Readiness | Government guidance | U.S. / broader reference | Cryptographic discovery |
| EU PQC Roadmap | Policy roadmap | EU Member States | Asset management & dependency mapping |
| NIST IR 8547 | Initial Public Draft | U.S. / broader reference | Migration planning |
| CycloneDX CBOM | Industry/open specification | Global | Machine-readable crypto inventory |
| CycloneDX Cryptography Registry | Open specification / registry | Global | Canonical crypto naming / model |
| SPDX specification | Open specification | Global | Adjacent BOM ecosystem |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Crypto / encryption risk management |
| DORA Art. 9 | Regulation | EU financial entities | ICT risk management |
| DORA RTS Art. 6 | Regulatory Technical Standard | EU financial entities | Encryption / cryptographic controls |
| DORA RTS Art. 7 | Regulatory Technical Standard | EU financial entities | Cryptographic key lifecycle |
| CRA Annex I | Regulation | EU products with digital elements | Product security / crypto requirements |

## Category classification

### Category A — Government migration guidance
- UK NCSC PQC Timelines
- CISA / NSA / NIST Quantum-Readiness fact sheet
- EU Coordinated PQC Roadmap

### Category B — Standards / specifications
- NIST IR 8547 (Initial Public Draft) — transition planning
- CycloneDX CBOM
- CycloneDX Cryptography Registry
- SPDX specification

### Category C — EU regulatory references
- NIS2 Art. 21(2)(h)
- DORA Art. 9
- DORA RTS Art. 6
- DORA RTS Art. 7
- CRA Annex I

---

## Key findings

**OBS-004 — SPDX claim unsupported.**
Rephrase or remove SPDX CBOM-equivalence wording.

**OBS-043 — NCSC scope precision.**
NCSC 2028 milestone is UK guidance, not universal deadline.

**OBS-044 — EU roadmap scope precision.**
EU roadmap is Member State coordination framework, not direct regulation.

**OBS-045 — CISA/NSA/NIST fact sheet strength.**
Strong primary evidence for cryptographic discovery as readiness activity.

**OBS-046 — Regulatory mapping precision.**
NIS2, DORA, CRA do not mandate CBOM directly.

**OBS-052 — CRA regulatory mapping.**
CRA applies to products with digital elements; cryptographic inventory is an
implementation mechanism, not an explicit CRA mandate.

---

## Regulatory wording discipline

### Do NOT write

- "NIS2 requires organizations to maintain a CBOM."
- "DORA requires a CBOM."
- "EU roadmap requires every company to complete a CBOM by end-2026."
- "CRA mandates cryptographic inventory."

### DO write

> "Cryptographic inventory and dependency mapping provide implementation
> mechanisms for identifying and managing cryptographic risks addressed by
> applicable cybersecurity, ICT-risk, and PQC-transition requirements."

---

## NIS2 Article 21(2)(h) — Scope precision

NIS2 includes policies and procedures regarding the use of cryptography and,
where appropriate, encryption, among the cybersecurity risk-management
measures.

- NIS2 does NOT say "all organisations must maintain a CBOM"
- Phrase as: "NIS2 Article 21(2)(h) — policies and procedures regarding the
  use of cryptography and, where appropriate, encryption"
- NOT as: "NIS2 mandates CBOM"

---

## DORA — Scope precision

### Article 9
Financial entities must maintain high standards of confidentiality, integrity,
and availability of data at rest, in use, and in transit.

### DORA RTS Article 6
Requires financial entities to develop and implement a policy on encryption
and cryptographic controls, based on data classification and ICT risk
assessment, covering at least:
- data at rest
- data in transit
- data in use where necessary
- internal and external network connections
- cryptographic key management and lifecycle

Article 6(4) addresses updating or changing cryptographic technology in
response to developments in cryptanalysis.

### DORA RTS Article 7
Extends cryptographic key lifecycle to generation, renewal, storage, backup,
archiving, retrieval, transmission, retirement, revocation, and destruction.

### DORA Articles 28-44 (esp. Article 30)
ICT third-party risk management framework. Article 30 (contractual
arrangements) is particularly relevant for PKI, CA, signing-service, cloud,
and SaaS vendors.

- DORA does NOT say "build a CBOM"
- Phrase as: "DORA ICT risk management and cryptographic control requirements
  provide the regulatory basis for cryptographic visibility as an
  implementation mechanism"

---

## CRA Annex I — Qualification

CRA Annex I requires products with digital elements to have an appropriate
level of cybersecurity, including data confidentiality and integrity.

- It does NOT explicitly mandate PQC
- It does NOT explicitly mandate CBOM
- It does NOT establish an explicit cryptographic inventory deadline

Phrase as: "CRA requirements concerning state-of-the-art mechanisms for
confidentiality and integrity can be relevant to cryptographic inventory
practice; the regulation should not be presented as explicitly mandating a
particular inventory format unless a separate implementing/harmonised
requirement establishes that obligation."

---

## Proposed final ordering for the entry

1. Primary government migration guidance: NCSC, CISA/NSA/NIST, EU Roadmap
2. Standards / specifications: NIST IR 8547, CycloneDX CBOM, CycloneDX
   Registry, SPDX
3. EU regulatory references: NIS2, DORA (Art. 9, RTS Art. 6/7, Art. 30),
   CRA
