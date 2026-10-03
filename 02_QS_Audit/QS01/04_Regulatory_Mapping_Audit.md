# QS01 — Standards and Regulatory Mapping Audit (FULL)

## Problem (OBS-029)

Current QS01 Standards & Regulatory Mapping mixes fundamentally different
document types in one list:

- Standard (FIPS 203)
- Draft transition report (NIST IR 8547)
- Government guidance (NCSC)
- EU policy roadmap (EU PQC Roadmap)
- U.S. federal memorandum (OMB M-23-02)
- Algorithm suite / advisory (CNSA 2.0)
- EU directive (NIS2)
- EU regulation (DORA, CRA)
- Regulatory technical standard (DORA RTS)

This gives the reader the false impression that all have equivalent legal
weight.

## Proposed taxonomy table

| Source | Type | Jurisdiction / Scope | QS01 relevance |
|---|---|---|---|
| NIST FIPS 203 | Standard | U.S. / internationally influential | ML-KEM key establishment |
| NIST SP 800-227 | Standard / guidance | U.S. / internationally influential | KEM secure use |
| NIST IR 8547 | Initial Public Draft | U.S. transition planning | PQC migration |
| NCSC PQC timelines | Government guidance | UK / broader reference | Migration milestones |
| EU PQC Roadmap | Policy roadmap | EU Member States | Migration milestones |
| NSM-10 | U.S. national security policy | U.S. government | Quantum-risk migration |
| OMB M-23-02 | Federal memorandum | U.S. federal agencies | HNDL + inventory |
| NSA CNSA 2.0 | Algorithm suite / advisory | U.S. NSS | PQ-resistant cryptography |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography / encryption policies |
| DORA Art. 9 | Regulation | EU financial entities | Data confidentiality |
| DORA RTS Art. 6 | Regulatory technical standard | EU financial entities | Encryption / cryptographic controls |
| DORA RTS Art. 7 | Regulatory technical standard | EU financial entities | Cryptographic key lifecycle |
| CRA Annex I | Regulation | EU products with digital elements | State-of-the-art crypto / data minimisation |

## Category classification

### Category A — Cryptographic standards
- NIST FIPS 203 (final)
- NIST SP 800-227 (final)
- NIST IR 8547 (draft — transition guidance)

### Category B — Government / policy migration guidance
- UK NCSC PQC timelines
- EU Coordinated PQC Roadmap
- NSM-10 / OMB M-23-02
- NSA CNSA 2.0

### Category C — EU Directives
- NIS2 Art. 21(2)(h) — policies and procedures regarding cryptography and,
  where appropriate, encryption

### Category D — EU Regulations and RTS
- DORA Art. 9 — data confidentiality
- DORA RTS Art. 6 — encryption and cryptographic controls
- DORA RTS Art. 7 — cryptographic key lifecycle
- CRA Annex I — state-of-the-art crypto / data minimisation

## Key findings

**OBS-025 — U.S. federal policy scope**
NSM-10 and OMB M-23-02 are U.S. federal policy. Must be labeled as such.
Do not generalize to industry-wide obligations.

**OBS-026 — CRA does not mandate PQC**
CRA Annex I requires state-of-the-art confidentiality/integrity mechanisms but
does not explicitly mandate PQC. Phrase carefully.

**OBS-027 — Remove "many products extend past 2030"**
No direct source. Replace with migration-planning rationale.

**OBS-028 — Add DORA RTS Art. 6 and Art. 7**
Directly relevant to QS01 at-rest/in-transit encryption, key wrapping, and key
lifecycle controls.

**OBS-029 — Adopt taxonomy table**
Replace flat list with a structured table.

---

## DORA RTS Article 6 — Encryption and Cryptographic Controls

**Source:** Commission Delegated Regulation (EU) 2024/1774
**Related:** DORA Regulation (EU) 2022/2554, Article 9

Article 6 requires financial entities to develop and implement a policy on
encryption and cryptographic controls, based on data classification and ICT
risk assessment, covering at least:

- data at rest
- data in transit
- data in use where necessary
- internal and external network connections
- cryptographic key management and lifecycle

Article 6(4) addresses updating or changing cryptographic technology in
response to developments in cryptanalysis.

Article 7 extends the lifecycle treatment to generation, renewal, storage,
backup, archiving, retrieval, transmission, retirement, revocation and
destruction.

## Why DORA RTS Art. 6 is especially strong for QS01

QS01 covers:
- at-rest encryption
- in-transit encryption
- key wrapping
- key lifecycle
- data classification
- cryptographic risk

DORA RTS Article 6 covers exactly these dimensions.

## DORA RTS Article 6 — Key lifecycle (Article 7)

- Generation
- Renewal
- Storage
- Backup
- Archiving
- Retrieval
- Transmission
- Retirement
- Revocation
- Destruction

## NSA CNSA 2.0 — Scope limitation

NSA's CNSA 2.0 advisory is specifically for National Security Systems (NSS)
and related assets. Its purpose is transition toward quantum-resistant
algorithms.

- Keep as contextual reference
- Do not use CNSA 2.0 as a general regulatory requirement for commercial
  organisations
- This is particularly important for the Financial Services Profile

## NIS2 Article 21(2)(h) — Scope precision

NIS2 includes policies and procedures regarding the use of cryptography and,
where appropriate, encryption, among the cybersecurity risk-management
measures.

- NIS2 does NOT say "all organisations must deploy PQC"
- Phrase as: "NIS2 Article 21(2)(h) — policies and procedures regarding the
  use of cryptography and, where appropriate, encryption"
- NOT as: "NIS2 mandates PQC"

## Overall regulatory conclusion

QS01's core technical thesis has strong evidence support. NIST, NCSC, EU,
and U.S. federal policy materials all support the general idea that migration
must begin early and prioritisation matters.

The main current issues are not evidence gaps. They are:

- precision
- scope
- taxonomy
- architecture
- regulatory wording
