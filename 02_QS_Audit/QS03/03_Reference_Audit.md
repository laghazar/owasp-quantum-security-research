# QS03 — Reference Links Audit (FULL, unified)

Audit chain: Claim -> Reference -> Evidence -> Supports claim? -> Scope -> Status -> Keep/Replace/Add

## Current QS03 references (8) + additions (5)

| # | Source | Keep? | Assessment |
|---|---|---|---|
| 1 | NIST FIPS 204 (ML-DSA) | Keep | Final, 13 August 2024. Strong anchor. |
| 2 | NIST FIPS 205 (SLH-DSA) | Keep | Final, 13 August 2024. Strong anchor. |
| 3 | NSA CNSA 2.0 | Keep with scope | NSS only. Not a commercial regulation. |
| 4 | IETF LAMPS WG | Keep | Active, PQC X.509 and CMS extensions. |
| 5 | EU CRA Annex I | Keep with qualification | Not explicit PQC mandate. |
| 6 | NIST SP 800-208 | Keep | Final, October 29, 2020. LMS/XMSS anchor. |
| 7 | NSA CNSA 2.0 FAQ v2.1, PP-24-4014, Dec 2024 | Verify | Document number and date must be confirmed. |
| 8 | NIST IR 8547 (Draft) | Keep with label | Draft, not standard. |
| 9 | NIST FIPS 186-5 | ADD | Classical signature baseline. |
| 10 | RFC 9881 | ADD | ML-DSA in X.509. |
| 11 | RFC 9882 | ADD | ML-DSA in CMS. |
| 12 | RFC 9909 | ADD | SLH-DSA in X.509. |
| 13 | RFC 9964 | ADD | ML-DSA for JOSE and COSE. |
| 14 | TCG TPM 2.0 v185 | ADD | PQC hardware support. |
| 15 | TCG PTP 1.07 | ADD | ML-DSA in TPM platform profile. |
| 16 | UEFI Secure Boot | ADD | Firmware / code-signing trust. |
| 17 | UEFI PQC work (2026) | ADD | Migration direction. |
| 18 | CA/Browser Forum SC-081 | ADD | TLS certificate lifetime reduction. |
| 19 | DORA Article 30 | ADD | Contractual arrangements for PKI vendors. |

---

## 1. NIST FIPS 204 — ML-DSA

**Claim in QS03:** "ML-DSA (FIPS 204) for general digital signatures."

**Assessment:** KEEP — Very strong

Final standard, 13 August 2024. Module-lattice digital signature standard.
CNSA 2.0-approved for NSS firmware/software signing.

**NIST status note:** 2026-07-31 planning note regarding future update/revision
and errata spreadsheet. Reference as "Final, August 2024; see current NIST
errata/planning note."

---

## 2. NIST FIPS 205 — SLH-DSA

**Claim in QS03:** "SLH-DSA (FIPS 205) for very long-lived, high-assurance signatures."

**Assessment:** KEEP — Very strong

Final standard, 13 August 2024. Stateless hash-based signature standard.
NOT approved for NSS use under CNSA 2.0.

---

## 3. NSA CNSA 2.0

**Claim in QS03:** "Software and firmware signing exclusively CNSA 2.0 by 2030."

**Assessment:** KEEP WITH SCOPE

Policy directive / algorithm suite for U.S. National Security Systems.
Not a commercial regulation.

**Timeline:**
| Year | Milestone |
|---|---|
| 2025 | New NSS acquisitions |
| 2027 | New NSS deployments |
| 2030 | Software/firmware signing exclusively CNSA 2.0 |
| 2033 | Full NSS transition |

**Algorithm-allowance for signatures:**
- LMS and XMSS (single-tree only): approved
- ML-DSA: approved
- SLH-DSA: NOT approved
- HSS and XMSS^MT: NOT approved

---

## 4. IETF LAMPS Working Group

**Claim in QS03:** "PQC X.509 and CMS extensions."

**Assessment:** KEEP

Active standards development. Several RFCs now published (see below).

---

## 5. EU Cyber Resilience Act — Annex I

**Claim in QS03:** "State-of-the-art integrity and authenticity requirements."

**Assessment:** KEEP WITH QUALIFICATION

Not explicit PQC mandate.

**Proposed wording:**
> "EU Cyber Resilience Act Annex I requires products with digital elements to
> protect the integrity and authenticity of data using state-of-the-art
> mechanisms; its applicability to PQC signature migration should be assessed
> in light of the product's risk assessment, support period, applicable
> standards, and the evolving state of the art."

---

## 6. NIST SP 800-208

**Claim in QS03:** "Recommendation for Stateful Hash-Based Signature Schemes (LMS, XMSS)."

**Assessment:** KEEP — Final, October 29, 2020.

Primary anchor for LMS and XMSS. Emphasize:
- state management is critical
- controlled private-key usage
- not general-purpose replacements

---

## 7. NSA CNSA 2.0 FAQ v2.1, PP-24-4014, December 2024

**Claim in QS03:** Algorithm-allowance table.

**Assessment:** VERIFY

Document number PP-24-4014 and December 2024 date must be verified from NSA
official source. If unverifiable, remove or replace with official NSA CNSA 2.0
FAQ URL.

---

## 8. NIST IR 8547 (Draft)

**Claim in QS03:** "Transition planning guidance referencing Mosca's inequality."

**Assessment:** KEEP WITH LABEL

Initial Public Draft, 12 November 2024. Label as "Initial Public Draft".

---

## 9. NIST FIPS 186-5 — ADD

Digital Signature Standard. RSA, ECDSA, EdDSA for generation/verification.
DSA retained only for verification of existing signatures.

Context for what is being replaced.

---

## 10. RFC 9881 — ADD

**Internet X.509 PKI — Algorithm Identifiers for ML-DSA.**

Published October 2025. Standards Track.

Concrete anchor for certificate migration (OBS-015).

---

## 11. RFC 9882 — ADD

**Use of the ML-DSA Signature Algorithm in the Cryptographic Message Syntax (CMS).**

Published October 2025. Standards Track.

Concrete anchor for CMS / archival signed objects (OBS-016).

---

## 12. RFC 9909 — ADD

**Algorithm Identifiers for SLH-DSA in X.509.**

Published December 2025. Standards Track.

Extends certificate migration anchor to SLH-DSA.

---

## 13. RFC 9964 — ADD

**ML-DSA for JSON Object Signing and Encryption (JOSE) and CBOR Object Signing and Encryption (COSE).**

Published May 2026. Standards Track.

Concrete anchor for JWT/JOSE/COSE migration (OBS-017).

---

## 14. TCG TPM 2.0 v185 — ADD

**PQC support for ML-KEM / ML-DSA**, including Attestation Keys.

Changes old hardware assumption (OBS-028).

---

## 15. TCG PTP 1.07 — ADD

**PC Client Platform TPM Profile for TPM 2.0.** ML-DSA support mandatory in
relevant profile.

---

## 16. UEFI Secure Boot — ADD

UEFI specification, section 32 (Secure Boot and Driver Signing). RSA/ECDSA-based
cryptographic mechanisms, certificate path validation, Secure Boot databases
(db, dbx, KEK, PK).

Anchor for OBS-008 (Secure Boot trust root).

---

## 17. UEFI PQC work (2026) — ADD

UEFI Forum PQC planning/work related to Secure Boot, ML-KEM/ML-DSA/SLH-DSA,
firmware authentication.

Anchor for OBS-029 (UEFI PQC direction).

---

## 18. CA/Browser Forum Ballot SC-081 — ADD

TLS certificate lifetime reduction. Staged milestones:
- 200 days (March 15, 2026)
- 100 days (March 15, 2027)
- 47 days (March 15, 2029)

Anchor for OBS-032.

---

## 19. DORA Article 30 — ADD

Contractual arrangements for ICT third-party risk management. Particularly
relevant for PKI, CA, and signing-service vendors.

Anchor for OBS-038.

---

## Findings

- **OBS-034** — NSA FAQ verification required
- **OBS-025** — Modern IETF RFC references added (9881, 9882, 9909, 9964)
- **OBS-026** — FIPS 204 errata status noted
- **OBS-027** — SP 800-208 final status confirmed
- **OBS-028** — TPM 2026 PQC support added (TCG v185)
- **OBS-029** — UEFI PQC work added
- **OBS-035** — NCSC ML-DSA-65 claim verification required

---

## Reference Architecture — proposed final set

### Primary technical standards
- NIST FIPS 204 — ML-DSA (Final, August 2024; errata note)
- NIST FIPS 205 — SLH-DSA (Final, August 2024)
- NIST FIPS 186-5 — Digital Signature Standard (classical baseline)
- NIST SP 800-208 — Stateful Hash-Based Signatures (LMS, XMSS; Final, October 2020)

### Migration guidance / roadmaps
- NIST IR 8547 (Initial Public Draft, 12 November 2024)
- NCSC — PQC migration guidance
- EU Coordinated Implementation Roadmap for the Transition to PQC

### IETF standards
- RFC 9881 — ML-DSA in X.509
- RFC 9882 — ML-DSA in CMS
- RFC 9909 — SLH-DSA in X.509
- RFC 9964 — ML-DSA for JOSE and COSE

### U.S. government policy
- NSA CNSA 2.0
- NSA CNSA 2.0 FAQ (algorithm-allowance table)

### Industry / hardware
- IETF LAMPS Working Group
- CA/Browser Forum Ballot SC-081
- TCG TPM 2.0 v185
- TCG PTP 1.07
- UEFI Secure Boot specification
- UEFI PQC work (2026)

### EU regulatory references
- NIS2 Article 21(2)(h)
- DORA Articles 28-44 (esp. Article 30)
- Cyber Resilience Act, Annex I
