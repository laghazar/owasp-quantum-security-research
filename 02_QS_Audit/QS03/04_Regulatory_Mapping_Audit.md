# QS03 — Standards and Regulatory Mapping Audit (FULL)

## Problem (OBS-039)

Section has unresolved TODO: "Confirm whether to keep it in the final entry
format, and verify each standard/citation."

## Proposed taxonomy table (adopt QS01 structure)

| Source | Type | Scope | QS03 relevance |
|---|---|---|---|
| NIST FIPS 204 | Standard | U.S. / intl. | ML-DSA general signatures |
| NIST FIPS 205 | Standard | U.S. / intl. | SLH-DSA high-assurance signatures |
| NIST FIPS 186-5 | Standard | U.S. / intl. | Current DSA/ECDSA/EdDSA baseline |
| NIST SP 800-208 | Standard / recommendation | U.S. / intl. | LMS/XMSS stateful HBS |
| NIST IR 8547 | Initial Public Draft | U.S. transition planning | PQC migration |
| NSA CNSA 2.0 | Policy directive / algorithm suite | U.S. NSS | Firmware/software signing by 2030 |
| NSA CNSA 2.0 FAQ | Advisory | U.S. NSS | Algorithm-allowance table |
| NCSC PQC guidance | Government guidance | UK / broader reference | ML-DSA recommendations |
| RFC 9881 | IETF Standards Track | International | ML-DSA in X.509 |
| RFC 9882 | IETF Standards Track | International | ML-DSA in CMS |
| RFC 9909 | IETF Standards Track | International | SLH-DSA in X.509 |
| RFC 9964 | IETF Standards Track | International | ML-DSA for JOSE and COSE |
| TCG TPM 2.0 v185 | Platform specification | International | PQC hardware-backed trust |
| TCG PTP 1.07 | Platform specification | International | ML-DSA in TPM platform profile |
| UEFI Secure Boot | Platform specification | International | Firmware / code-signing trust |
| CA/Browser Forum SC-081 | Industry ballot | Global TLS ecosystem | Certificate lifetime reduction |
| IETF LAMPS WG | Standards development | International | PQC X.509 / CMS extensions |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies |
| DORA Art. 28-44 (esp. 30) | Regulation | EU financial entities | Third-party PKI risk |
| CRA Annex I | Regulation | EU products w/ digital elements | Integrity / authenticity |

## Category classification

### Category A — Cryptographic standards
- NIST FIPS 204 (final)
- NIST FIPS 205 (final)
- NIST FIPS 186-5 (final — classical baseline)
- NIST SP 800-208 (final)
- NIST IR 8547 (draft)

### Category B — Government / policy migration guidance
- NSA CNSA 2.0
- NSA CNSA 2.0 FAQ
- NCSC PQC guidance
- EU Coordinated PQC Roadmap

### Category C — IETF standards
- RFC 9881 — ML-DSA in X.509
- RFC 9882 — ML-DSA in CMS
- RFC 9909 — SLH-DSA in X.509
- RFC 9964 — ML-DSA for JOSE and COSE

### Category D — Platform specifications / industry
- TCG TPM 2.0 v185
- TCG PTP 1.07
- UEFI Secure Boot
- CA/Browser Forum Ballot SC-081
- IETF LAMPS Working Group

### Category E — EU regulatory references
- NIS2 Article 21(2)(h)
- DORA Articles 28-44 (esp. Article 30)
- CRA Annex I

---

## Key findings

**OBS-039 — Mapping TODO must be resolved.**
Adopt taxonomy table. Verify each citation.

**OBS-035 — Verify NCSC ML-DSA-65 claim.**
Direct NCSC source verification required. If unverifiable, rephrase.

**OBS-036 — CNSA 2.0 timeline precision.**
2025 / 2027 / 2030 / 2033 milestones.

**OBS-037 — CRA Annex I qualification.**
Not a PQC mandate. Rephrase as risk-assessment-driven.

**OBS-038 — DORA Art. 30 emphasis.**
Contractual arrangements for PKI / signing-service vendors.

**OBS-033 — CNSA 2.0 scope precision.**
NSS only. Single-tree LMS/XMSS only. ML-DSA approved. SLH-DSA NOT approved.

---

## CNSA 2.0 — Scope limitation

NSA's CNSA 2.0 advisory is specifically for National Security Systems (NSS)
and related assets.

**Algorithm-allowance for signatures:**

| Algorithm | NSS firmware/software signing |
|---|---|
| LMS (single-tree) | Approved |
| XMSS (single-tree) | Approved |
| ML-DSA | Approved |
| SLH-DSA | NOT approved |
| HSS (multi-tree LMS) | NOT approved |
| XMSS^MT (multi-tree XMSS) | NOT approved |

Do not use CNSA 2.0 as a general regulatory requirement for commercial
organisations.

---

## NIS2 Article 21(2)(h) — Scope precision

NIS2 includes policies and procedures regarding the use of cryptography and,
where appropriate, encryption, among the cybersecurity risk-management
measures.

- NIS2 does NOT say "all organisations must deploy PQC"
- Phrase as: "NIS2 Article 21(2)(h) — policies and procedures regarding the
  use of cryptography and, where appropriate, encryption"
- NOT as: "NIS2 mandates PQC"

---

## DORA Articles 28-44 — Scope precision

DORA's ICT third-party risk management framework applies to PKI, CA, and
signing-service vendors.

**Article 30 (contractual arrangements)** is particularly relevant where
long-lived signing trust depends on external providers.

Key requirements under Art. 30:
- Contractual arrangements with ICT third-party service providers
- Exit strategies
- Data location and processing
- Access, use, and control
- Audit and access rights
- Termination rights

---

## CRA Annex I — Qualification

CRA Annex I requires products with digital elements to have an appropriate
level of cybersecurity, including data confidentiality and integrity.

- It does NOT explicitly mandate PQC
- It does NOT establish an explicit PQC signature migration deadline

Phrase as: "CRA requirements concerning state-of-the-art mechanisms for
integrity and authenticity can be relevant to PQC signature migration
planning; the regulation should not be presented as explicitly mandating a
particular PQC algorithm unless a separate implementing/harmonised requirement
establishes that obligation."

---

## Proposed final ordering for the entry

1. Primary standards: FIPS 204, 205, 186-5, SP 800-208, IR 8547
2. IETF standards: RFC 9881, 9882, 9909, 9964
3. Migration guidance: NCSC, EU Roadmap
4. U.S. government policy: CNSA 2.0, FAQ
5. Platform / industry: TCG TPM 2.0 v185, PTP 1.07, UEFI, CA/B SC-081, LAMPS
6. EU regulatory: NIS2, DORA (Art. 30), CRA
