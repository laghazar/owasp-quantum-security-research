$base = "02_QS_Audit\QS03"

# ============================================================
# 02_Attack_Scenarios_Analysis.md — FULL (merged, 5 scenarios)
# ============================================================
Set-Content "$base\02_Attack_Scenarios_Analysis.md" @'
# QS03 — Attack Scenarios Analysis (FULL)

## Merged scenario set — 5 total

- 3 existing OWASP scenarios (extended)
- 2 new scenarios (credential, re-establishment failure)
- 5 ChatGPT-style scenarios (software update, CA compromise,
  long-lived artifact, PQC signer + classical verifier, hardware-root failure)
- All content merged below, no reduction.

---

## Scenario 1 — Code-signing key compromise (ECDSA P-256)

### Current (OWASP draft)
"An attacker with a future CRQC recovers the private key of a code-signing
certificate still on ECDSA P-256. They sign malware that passes verification
on every device trusting that anchor, distributing a malicious 'update'
through the legitimate update channel."

### Core logic assessment
Correct. Active forgery model. Retain with extensions.

### Findings addressed
- OBS-007 (code-signing high impact)
- OBS-013 (HSM/verifier extension)
- OBS-021 (verifier migration)

### Proposed revised scenario 1 (FULL)

An organization distributes software updates signed with a quantum-vulnerable
RSA or ECDSA private signing key. An adversary obtains the corresponding public
key and retains information about the signing environment.

Once a CRQC becomes capable of compromising the underlying signature scheme,
the adversary derives the private signing key or otherwise obtains a practical
capability to create valid-looking signatures. The attacker then signs a
malicious software update. If update-verification systems trust the affected
signer and do not require an appropriately migrated post-quantum trust chain,
the malicious update may be accepted as authentic and installed.

The compromised key may be protected in an HSM, but HSM protection does not
alter the mathematical vulnerability of the algorithm; the quantum attack
recovers the corresponding private key from the public key, not by extracting
it from the HSM. The attack is indistinguishable from a legitimate update, and
revoking the signing certificate does not retroactively invalidate software
already installed by trusting verifiers.

The security impact is integrity and authenticity compromise rather than
decryption of the signed software.

---

## Scenario 2 — Partial CA hierarchy migration

### Current (OWASP draft)
"An organisation migrates its leaf TLS certificates to PQC but leaves the root
and intermediate CAs on RSA. An attacker forges an intermediate CA signature
with a CRQC and issues trusted certificates for arbitrary domains - the chain
is only as strong as its weakest classical link."

### Core logic assessment
Correct. Retain with extension.

### Findings addressed
- OBS-002 (trust-chain migration)
- OBS-014 (scenario chain precision)
- OBS-015 (certificate migration)

### Proposed revised scenario 2 (FULL)

A certificate hierarchy relies on a quantum-vulnerable signature mechanism.
The organization migrates its leaf TLS certificates to PQC but leaves the root
and intermediate CAs on RSA.

A future quantum-capable adversary compromises the corresponding CA private
key or obtains an equivalent signature-forgery capability. The attacker
generates a fraudulent certificate for a targeted identity. A relying party
that still trusts the affected CA and accepts the classical signature can be
induced to authenticate the attacker as the legitimate identity.

In a signature chain, the strength of the chain is bounded by its weakest
quantum-vulnerable link; partial migration that upgrades leaf certificates
while leaving roots or intermediates classical does not reduce the forgery
risk for the chain as a whole. The risk extends beyond the individual
certificate to the trust anchor, certificate issuance process, validation
policy, and relying-party trust store.

---

## Scenario 3 — Long-lived signed artefact

### Current (OWASP draft)
"A vendor issues software releases signed with ECDSA, with signatures expected
to remain valid for the product's decade-long support lifetime. Once a CRQC
exists, an attacker recovers the signing key and forges signatures on
malicious updates that still validate against the long-lived, un-rotated trust
anchor - the artefact was exposed from the day it was signed, under the same
Mosca's-inequality logic that governs confidentiality."

### Core logic assessment
Correct. Retain with retroactive framing extension.

### Findings addressed
- OBS-013 (long-lived signed artifacts)
- OBS-014 (signature assurance lifetime)
- OBS-040 (retroactive vs prospective exposure)

### Proposed revised scenario 3 (FULL)

An organization stores a signed legal, financial, regulatory, or operational
artifact for decades. The artifact was signed using a classical public-key
signature algorithm whose security assumptions are expected to be vulnerable
to a sufficiently capable quantum computer.

The artifact itself remains unchanged, but future quantum capabilities
undermine confidence that the signature could not have been forged by an
unauthorized party. If the organization needs to demonstrate authenticity and
integrity throughout the artifact's required assurance lifetime, the original
classical signature may no longer provide sufficient evidence.

Unlike confidentiality exposure, which is prospective (data collected now,
decrypted later), signature exposure is retroactive: any signature produced
today with a quantum-vulnerable key becomes forgeable once a CRQC exists, and
the trust it carries may still be acted upon.

The mitigation therefore requires lifecycle planning for signature assurance,
archival validation, and, where appropriate, re-signing or migration to a
post-quantum signature mechanism. Re-signing with a PQC scheme before the
classical scheme is deprecated is therefore remediation, not migration.

---

## Scenario 4 — Long-lived credential

### Findings addressed
- OBS-006 (re-establishment failure, mode A)
- OBS-030 (re-signing vs re-issuance)
- OBS-031 (re-establishment detection)

### Proposed scenario 4 (FULL)

A government issues identity credentials with a ten-year validity period,
signed with ECDSA. A CRQC becomes available in year three. An attacker forges
credentials that verify against the still-trusted classical issuer.

Re-issuance of PQC credentials must not rely on the compromised classical
credential as proof of identity. A credential asserts that a named subject
controls a key; a PQC signature over the same claim only re-asserts it with
stronger cryptography - it does not re-establish the claim itself.

The issuance flow must require independent evidence: fresh identity proofing,
a still-trusted anchor, or hardware attestation. This is a concrete instance
of the re-establishment failure mode described in the Description section.

---

## Scenario 5 — Re-establishment failure

### Findings addressed
- OBS-006 (re-establishment failure, all 3 sub-modes)
- OBS-030 (re-signing vs re-issuance)
- OBS-031 (re-establishment detection)

### Proposed scenario 5 (FULL)

An organisation migrates its internal PKI to PQC. The migration is technically
correct on every cryptographic measure: new signatures verify, new certificate
chains build, algorithms are compliant.

However, the enrolment flow for the new PQC certificates accepts
proof-of-possession from the same classical key that the old certificates
used. An attacker who has already compromised the classical key (or who will
compromise it with a CRQC) can enrol for a PQC certificate under any identity
the enrolment flow will accept.

The resulting certificate chain verifies cleanly and is indistinguishable
from a correct migration. Detection requires auditing the issuance flow, not
just the output. Migration verification should confirm that the new credential
was issued on evidence independent of the credential being replaced.

### Sub-modes that QS03 should distinguish

**A. Trust re-establishment failure**
Old classical trust anchor cannot authenticate new PQC signer.

**B. Cryptographic migration failure**
PQC signature introduced, but legacy verifier doesn't support it, and the
artifact is rejected.

**C. Key lifecycle migration failure**
Old signing key -> new signing key requires cert / firmware / trust-store
update, and the device cannot safely transition.

---

## Scenario 6 — Post-quantum signer with classical verifier

### Findings addressed
- OBS-021 (verifier migration)
- OBS-023 (downgrade / fallback)

### Proposed scenario 6 (FULL)

A software publisher migrates its release signing system to a post-quantum
signature algorithm. However, a population of deployed devices still supports
only the legacy classical signature algorithm.

The publisher either cannot deploy the new signature at all or introduces a
fallback allowing both classical and post-quantum signatures. An attacker
targets the classical path, causing the device to continue accepting a
quantum-vulnerable signature even though the publisher considers the migration
complete.

This scenario demonstrates that post-quantum signing is not complete until
the complete signer-to-verifier trust path supports and enforces the intended
migration policy.

---

## Scenario 7 — Hardware-root migration failure

### Findings addressed
- OBS-008 (Secure Boot trust root)
- OBS-028 (TPM 2026 PQC support)
- OBS-029 (UEFI PQC direction)

### Proposed scenario 7 (FULL)

A device relies on Secure Boot and hardware-backed trust. Its current trust
chain depends on classical signature mechanisms embedded in firmware or device
trust stores.

A new post-quantum signing system is available at the software layer, but the
deployed device cannot securely update its trust anchors, verification
implementation, or firmware signing policy. The organization therefore cannot
establish a complete post-quantum trust chain without hardware or firmware
lifecycle changes.

The resulting exposure is a migration and trust-establishment failure rather
than simply a weak cryptographic algorithm.

---

## Assessment tables

### Scenario 1 — Code-signing key compromise
| Element | Assessment |
|---|---|
| Core concept | Correct |
| HSM interaction | Needs explicit statement |
| Verifier population | Needs extension |
| Revocation limits | Needs extension |
| Overall | Keep with extensions |

### Scenario 2 — Partial CA hierarchy migration
| Element | Assessment |
|---|---|
| Chain integrity concept | Correct |
| Weakest link precision | Needs extension |
| Overall | Keep with extension |

### Scenario 3 — Long-lived signed artefact
| Element | Assessment |
|---|---|
| Mosca's inequality use | Correct |
| Retroactive vs prospective | Needs explicit statement |
| Re-signing as remediation | Correct |
| Overall | Keep with extension |

### Scenario 4 — Long-lived credential (NEW)
| Element | Assessment |
|---|---|
| Core concept | Correct |
| Re-issuance requirement | Correct |
| Re-establishment risk | Highlighted |
| Overall | Add to entry |

### Scenario 5 — Re-establishment failure (NEW)
| Element | Assessment |
|---|---|
| Core concept | Novel contribution |
| Detection guidance | Required |
| Sub-modes (A/B/C) | Explicit |
| Overall | Add to entry |

### Scenario 6 — PQC signer + classical verifier (NEW)
| Element | Assessment |
|---|---|
| Core concept | Verifier-side gap |
| Downgrade risk | Explicit |
| Overall | Add to entry |

### Scenario 7 — Hardware-root migration failure (NEW)
| Element | Assessment |
|---|---|
| Core concept | Hardware lifecycle constraint |
| TPM/UEFI context | Referenced |
| Overall | Add to entry |

---

## Attack Scenarios — unified findings register

| ID | Finding | Type | Priority |
|---|---|---|---|
| OBS-007 | Code-signing high impact | Gap | Very High |
| OBS-013 | Long-lived signed artifacts | Gap | Very High |
| OBS-014 | Signature assurance lifetime | New dimension | Very High |
| OBS-015 | Certificate migration | Gap | High |
| OBS-016 | CMS / archive signatures | Extension | High |
| OBS-019 | Blockchain scope | Clarification | Medium-High |
| OBS-021 | Verifier migration | Gap | Very High |
| OBS-023 | Downgrade / fallback | Gap | High |
| OBS-028 | TPM 2026 PQC support | Current evidence | High |
| OBS-029 | UEFI PQC direction | Current evidence | High |
| OBS-030 | Re-signing vs re-issuance | Original contribution | Very High |
| OBS-031 | Re-establishment detection | Missing dimension | Very High |
| OBS-040 | Retroactive vs prospective | Conceptual | High |
'@

# ============================================================
# 03_Reference_Audit.md — FULL (merged, 13 sources)
# ============================================================
Set-Content "$base\03_Reference_Audit.md" @'
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
'@

# ============================================================
# 04_Regulatory_Mapping_Audit.md — FULL
# ============================================================
Set-Content "$base\04_Regulatory_Mapping_Audit.md" @'
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
'@

Write-Host ""
Write-Host "Part 2a/3 written: Attack Scenarios + References + Regulatory" -ForegroundColor Green
Write-Host ""

# ============================================================
# 05_Proposed_Text.md — FULL verbatim (merged)
# ============================================================
Set-Content "$base\05_Proposed_Text.md" @'
# QS03 — Proposed Revised Text (OWASP PR candidate — FULL)

This is the complete proposed revised QS03 text. Every section is written out
verbatim. When submitting the PR, use this file directly as the source.

---

## Description

Digital signatures provide authenticity and integrity for software, firmware,
certificates, documents, tokens, communications protocols, and other
security-sensitive objects. Many widely deployed signature mechanisms,
including RSA and discrete-logarithm-based schemes such as ECDSA, EdDSA, and
legacy DSA, rely on mathematical assumptions that a sufficiently capable
cryptographically relevant quantum computer (CRQC) is expected to undermine.

The security impact is not primarily loss of confidentiality. Instead, quantum
compromise of a classical signing mechanism can enable an adversary to forge
signatures or otherwise undermine the authenticity and integrity decisions
that depend on those signatures. The impact therefore extends beyond the
individual signing key to the trust architecture that accepts the signature,
including certificate authorities, trust anchors, firmware verification
systems, software update mechanisms, token validators, document-verification
systems, and hardware-backed identities.

A digital-signature migration must therefore be assessed as a trust-chain
migration rather than a simple algorithm replacement. Depending on the use
case, the chain may include a root or trust anchor, certificate issuer, signing
key, certificate or key identifier, artifact or message format, verifier
implementation, trust-store policy, revocation mechanism, update process, and
hardware or embedded components. A migration can fail when a new post-quantum
signature can be generated but cannot be validated by deployed verifiers, when
classical signatures remain accepted as a fallback, or when trust anchors and
other cryptographic dependencies cannot be updated securely.

Long-lived signed artifacts create an additional risk dimension. The period
for which a relying party needs confidence in a signature may extend beyond
the expected migration lifetime of the underlying classical signature
mechanism. This signature assurance lifetime is distinct from the retention
period of the artifact itself. Examples include long-lived software and
firmware, archived contracts and records, certificates, signed configuration,
legal or regulatory evidence, and other artifacts that may need to remain
trusted for many years.

Post-quantum migration should therefore assess the required signature
assurance lifetime, the complete trust chain, deployed verifier capabilities,
algorithm and encoding support, hardware and protocol constraints, and the
availability of secure migration and rollback mechanisms. NIST has
standardized ML-DSA and SLH-DSA as post-quantum signature mechanisms, while
current IETF standards define ML-DSA use in X.509, CMS, and JOSE/COSE.
Appropriate algorithm selection should remain dependent on the application,
protocol, security requirements, and implementation constraints.

Deployment of a post-quantum signing algorithm in one component does not by
itself remove the risk. Residual classical dependencies may remain in
certificate chains, trust anchors, verification libraries, firmware, hardware
roots of trust, tokens, archived artifacts, or third-party systems.
Organizations should therefore track migration at the level of the complete
signature and trust lifecycle rather than treating individual algorithm
replacement as proof of quantum readiness.

## Cryptographic assumptions

RSA, DSA, ECDSA, and EdDSA are quantum-vulnerable: they rely on integer
factorization or discrete-logarithm assumptions that a sufficiently capable
CRQC could break using Shor's algorithm. Until such a machine exists, these
algorithms remain secure against classical attack, but their migration must
begin well before that point.

- RSA -> integer factorization
- ECDSA / EdDSA -> elliptic-curve discrete logarithm
- DSA -> finite-field discrete logarithm

DSA is retained in FIPS 186-5 only for verification of existing signatures,
not for new signature generation.

## Re-establishment failure mode

A signature or credential migration can complete correctly on every
cryptographic measure — the new signature verifies, the new certificate chains,
the algorithm is compliant — while the process that issued the new credential
accepted the wrong evidence. If an enrolment flow takes proof-of-possession
from a key this entry already classifies as forgeable, and issues a strong
new credential on the strength of it, it produces two certificates that both
verify and a record indistinguishable from a correct migration.

The risk is not that the signature fails; it is that the re-issuance accepted
a compromised anchor as sufficient authority to mint its replacement.

Three distinct failure modes should be distinguished:

**A. Trust re-establishment failure.** An old classical trust anchor cannot
authenticate the new PQC signer.

**B. Cryptographic migration failure.** A PQC signature is introduced, but a
legacy verifier does not support it, and the artifact is rejected.

**C. Key lifecycle migration failure.** An old signing key transitions to a
new signing key requiring certificate, firmware, or trust-store update, and
the device cannot safely transition.

Prevention item 5 (distinguish re-signing from re-issuance) is the mitigation
for this failure mode specifically. Detection requires auditing the issuance
flow, not just the output: any verification of a migration should confirm
that the new credential was issued on evidence independent of the credential
being replaced.

---

## Common Examples of Vulnerability

1. **Quantum-vulnerable software and firmware signing.** Software updates,
   drivers, operating-system components, firmware, bootloaders, or embedded
   code rely on RSA, ECDSA, EdDSA, or other quantum-vulnerable signatures for
   release or execution authorization.

2. **Classical PKI trust chains.** Root, intermediate, or end-entity
   certificates depend on quantum-vulnerable signature algorithms, leaving
   identity authentication and certificate issuance exposed to future
   signature forgery.

3. **Long-lived signed artifacts.** Contracts, regulatory evidence, signed
   records, firmware images, signed configuration, archived documents, or
   other artifacts require signature assurance longer than the migration
   lifetime of the underlying classical signature mechanism.

4. **Token and message signatures.** JWT, JOSE, COSE, SAML, CMS, or similar
   signed objects rely on quantum-vulnerable signature algorithms and
   continue to trust those algorithms after post-quantum alternatives
   become available.

5. **Hardware-anchored signature trust.** TPMs, Secure Boot, firmware
   verification systems, smart cards, HSM-backed signing systems, or
   embedded trust anchors contain or depend on classical public-key
   signature mechanisms and lack a validated migration or upgrade path.

6. **Verifier-side migration gaps.** Signers or issuers have migrated to
   post-quantum signatures, but deployed verifiers, gateways, devices,
   libraries, trust stores, or protocol implementations cannot validate
   the new signatures.

7. **Classical fallback during PQC migration.** Systems support a
   post-quantum signature mechanism but retain unconditional acceptance of
   quantum-vulnerable classical signatures, creating a downgrade or
   residual-trust path.

8. **Third-party signing dependencies.** SaaS providers, software suppliers,
   certificate authorities, firmware vendors, package registries, or other
   external trust providers continue to depend on quantum-vulnerable signing
   mechanisms while the relying organization assumes its own migration is
   complete.

---

## How to Prevent

**1. Inventory signature and trust dependencies.**

Identify signing keys, certificates, trust anchors, signature algorithms,
artifact formats, verification libraries, token validators, firmware
verification mechanisms, hardware-backed identities, and third-party trust
dependencies. Record where each signature is generated, where it is verified,
and how trust is established.

**2. Assess signature assurance lifetime.**

Determine how long each artifact, identity, firmware image, certificate,
record, or security assertion must remain trustworthy. Assess this signature
assurance lifetime separately from retention or operational lifetime and
prioritize assets whose required assurance extends beyond the expected
migration window.

**3. Migrate the complete trust chain.**

Replace quantum-vulnerable signing mechanisms with appropriate post-quantum
signatures such as ML-DSA or SLH-DSA where suitable. Update trust anchors,
certificate authorities, certificates, signing keys, verification libraries,
trust stores, policy engines, and dependent protocols rather than migrating
only the leaf signing key.

**4. Validate verifier compatibility and interoperability.**

Confirm that all relying parties can validate the selected post-quantum
signature, key format, certificate or object encoding, and protocol
representation. Test constrained devices, firmware, legacy applications,
HSMs, TPMs, network components, and third-party integrations where relevant.

**5. Control classical fallback and downgrade paths.**

Do not treat the presence of a post-quantum signature option as sufficient
protection if quantum-vulnerable classical signatures remain unconditionally
accepted. Define explicit algorithm-selection and fallback policies and test
downgrade resistance.

**6. Protect long-lived signed artifacts.**

Identify artifacts whose signature assurance must survive for many years.
Where required, establish an architecture for re-signing, archival
validation, trusted time evidence, algorithm transition, and preservation of
the evidence needed to demonstrate authenticity and integrity over the
required assurance period.

**7. Plan hardware and embedded trust migration.**

Assess TPM, Secure Boot, smart-card, HSM, firmware, and other hardware-root
dependencies for algorithm support, storage, update capability, lifecycle,
and field-upgrade constraints. Do not assume hardware-backed protection is
itself post-quantum; verify the algorithms and secure migration path
supported by the deployed component.

**8. Track residual classical dependencies.**

Maintain migration status until classical signature dependencies are removed,
isolated, or explicitly risk-accepted. Include external certificate
authorities, software suppliers, SaaS platforms, device vendors, package
ecosystems, and other third parties in the assessment.

---

## Example Attack Scenarios

### Scenario #1 — Forged software update

An organization distributes software updates signed with a quantum-vulnerable
RSA or ECDSA private signing key. An adversary obtains the corresponding
public key and retains information about the signing environment.

Once a CRQC becomes capable of compromising the underlying signature scheme,
the adversary derives the private signing key or otherwise obtains a practical
capability to create valid-looking signatures. The attacker then signs a
malicious software update. If update-verification systems trust the affected
signer and do not require an appropriately migrated post-quantum trust chain,
the malicious update may be accepted as authentic and installed.

The security impact is integrity and authenticity compromise rather than
decryption of the signed software.

### Scenario #2 — Compromised certificate authority signing key

A certificate hierarchy relies on a quantum-vulnerable signature mechanism. A
future quantum-capable adversary compromises the corresponding CA private key
or obtains an equivalent signature-forgery capability.

The attacker generates a fraudulent certificate for a targeted identity. A
relying party that still trusts the affected CA and accepts the classical
signature can be induced to authenticate the attacker as the legitimate
identity.

The risk therefore extends beyond the individual certificate to the trust
anchor, certificate issuance process, validation policy, and relying-party
trust store. In a signature chain, the strength of the chain is bounded by
its weakest quantum-vulnerable link.

### Scenario #3 — Long-lived signed artifact loses assurance

An organization stores a signed legal, financial, regulatory, or operational
artifact for decades. The artifact was signed using a classical public-key
signature algorithm whose security assumptions are expected to be vulnerable
to a sufficiently capable quantum computer.

The artifact itself remains unchanged, but future quantum capabilities
undermine confidence that the signature could not have been forged by an
unauthorized party. If the organization needs to demonstrate authenticity and
integrity throughout the artifact's required assurance lifetime, the original
classical signature may no longer provide sufficient evidence.

The mitigation therefore requires lifecycle planning for signature assurance,
archival validation, and, where appropriate, re-signing or migration to a
post-quantum signature mechanism.

### Scenario #4 — Long-lived credential

A government issues identity credentials with a ten-year validity period,
signed with ECDSA. A CRQC becomes available in year three. An attacker forges
credentials that verify against the still-trusted classical issuer.

Re-issuance of PQC credentials must not rely on the compromised classical
credential as proof of identity; the issuance flow must require independent
evidence.

### Scenario #5 — Re-establishment failure

An organisation migrates its internal PKI to PQC. The migration is
technically correct on every cryptographic measure: new signatures verify,
new certificate chains build, algorithms are compliant.

However, the enrolment flow for the new PQC certificates accepts
proof-of-possession from the same classical key that the old certificates
used. An attacker who has already compromised the classical key (or who will
compromise it with a CRQC) can enrol for a PQC certificate under any identity
the enrolment flow will accept. The resulting certificate chain verifies
cleanly and is indistinguishable from a correct migration.

### Scenario #6 — Post-quantum signer with classical verifier

A software publisher migrates its release signing system to a post-quantum
signature algorithm. However, a population of deployed devices still supports
only the legacy classical signature algorithm.

The publisher either cannot deploy the new signature at all or introduces a
fallback allowing both classical and post-quantum signatures. An attacker
targets the classical path, causing the device to continue accepting a
quantum-vulnerable signature even though the publisher considers the migration
complete.

This scenario demonstrates that post-quantum signing is not complete until
the complete signer-to-verifier trust path supports and enforces the intended
migration policy.

### Scenario #7 — Hardware-root migration failure

A device relies on Secure Boot and hardware-backed trust. Its current trust
chain depends on classical signature mechanisms embedded in firmware or device
trust stores.

A new post-quantum signing system is available at the software layer, but the
deployed device cannot securely update its trust anchors, verification
implementation, or firmware signing policy. The organization therefore cannot
establish a complete post-quantum trust chain without hardware or firmware
lifecycle changes.

The resulting exposure is a migration and trust-establishment failure rather
than simply a weak cryptographic algorithm.

---

## Reference Links

### Primary technical standards

- **NIST FIPS 204 — ML-DSA.** Final, August 2024; see current NIST
  errata/planning note.
- **NIST FIPS 205 — SLH-DSA.** Final, August 2024.
- **NIST FIPS 186-5 — Digital Signature Standard.** Classical signature
  baseline (RSA, ECDSA, EdDSA; DSA verification-only).
- **NIST SP 800-208 — Stateful Hash-Based Signature Schemes (LMS, XMSS).**
  Final, October 2020.
- **NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
  Cryptography Standards.** 12 November 2024.

### IETF standards

- **RFC 9881 — ML-DSA in X.509.** October 2025.
- **RFC 9882 — ML-DSA in CMS.** October 2025.
- **RFC 9909 — SLH-DSA in X.509.** December 2025.
- **RFC 9964 — ML-DSA for JOSE and COSE.** May 2026.

### Migration guidance / roadmaps

- **NCSC — PQC migration guidance.**
- **EU Coordinated Implementation Roadmap for the Transition to PQC.**

### U.S. government policy

- **NSA CNSA 2.0.**
- **NSA CNSA 2.0 FAQ** — algorithm-allowance table.

### Platform / industry references

- **TCG TPM 2.0 v185** — PQC support (ML-KEM, ML-DSA, Attestation Keys).
- **TCG PTP 1.07** — ML-DSA in PC Client TPM profile.
- **UEFI Secure Boot specification.**
- **UEFI PQC work (2026).**
- **CA/Browser Forum Ballot SC-081** — TLS certificate lifetime reduction.
- **IETF LAMPS Working Group** — PQC X.509 and CMS extensions.

### EU regulatory references

- **NIS2 Article 21(2)(h)** — cryptography / encryption policies.
- **DORA Articles 28-44 (esp. Article 30)** — ICT third-party risk management.
- **Cyber Resilience Act, Annex I** — integrity / authenticity.

---

## Standards and Regulatory Mapping

| Source | Type | Jurisdiction / Scope | QS03 relevance |
|---|---|---|---|
| NIST FIPS 204 | Standard | U.S. / intl. | ML-DSA general signatures |
| NIST FIPS 205 | Standard | U.S. / intl. | SLH-DSA high-assurance signatures |
| NIST FIPS 186-5 | Standard | U.S. / intl. | Classical signature baseline |
| NIST SP 800-208 | Standard / recommendation | U.S. / intl. | LMS/XMSS stateful HBS |
| NIST IR 8547 | Initial Public Draft | U.S. transition planning | PQC migration |
| NSA CNSA 2.0 | Policy directive / algorithm suite | U.S. NSS | Firmware/software signing by 2030 |
| NSA CNSA 2.0 FAQ | Advisory | U.S. NSS | Algorithm-allowance table |
| NCSC PQC guidance | Government guidance | UK / broader reference | ML-DSA recommendations |
| RFC 9881 | IETF Standards Track | International | ML-DSA in X.509 |
| RFC 9882 | IETF Standards Track | International | ML-DSA in CMS |
| RFC 9909 | IETF Standards Track | International | SLH-DSA in X.509 |
| RFC 9964 | IETF Standards Track | International | ML-DSA for JOSE / COSE |
| TCG TPM 2.0 v185 | Platform specification | International | PQC hardware-backed trust |
| TCG PTP 1.07 | Platform specification | International | ML-DSA in TPM profile |
| UEFI Secure Boot | Platform specification | International | Firmware / code-signing trust |
| CA/Browser Forum SC-081 | Industry ballot | Global TLS ecosystem | Certificate lifetime reduction |
| IETF LAMPS WG | Standards development | International | PQC X.509 / CMS extensions |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies |
| DORA Art. 28-44 (esp. 30) | Regulation | EU financial entities | Third-party PKI risk |
| CRA Annex I | Regulation | EU products w/ digital elements | Integrity / authenticity |
'@

Write-Host ""
Write-Host "Part 2b/3 written: Proposed Text (full verbatim)" -ForegroundColor Green
Write-Host ""

# ============================================================
# Verification
# ============================================================
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " QS03 Part 2 verification:" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

$expected = @(
    "02_QS_Audit\QS03\00_Master_Review.md",
    "02_QS_Audit\QS03\01_Master_Finding_Register.md",
    "02_QS_Audit\QS03\02_Attack_Scenarios_Analysis.md",
    "02_QS_Audit\QS03\03_Reference_Audit.md",
    "02_QS_Audit\QS03\04_Regulatory_Mapping_Audit.md",
    "02_QS_Audit\QS03\05_Proposed_Text.md"
)
$missing = 0
foreach ($f in $expected) {
    if (Test-Path $f) {
        Write-Host ("OK   {0,-72} {1,6} bytes" -f $f, (Get-Item $f).Length) -ForegroundColor Green
    } else {
        Write-Host ("MISS {0}" -f $f) -ForegroundColor Red
        $missing++
    }
}
Write-Host ""
if ($missing -eq 0) {
    Write-Host "QS03 Part 2 complete. 6 files. Ready for Part 3." -ForegroundColor Green
} else {
    Write-Host "$missing file(s) missing." -ForegroundColor Red
}
Write-Host ""