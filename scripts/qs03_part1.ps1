$base = "02_QS_Audit\QS03"
New-Item -ItemType Directory -Force -Path "$base","09_Issues\QS03","10_PRs\QS03" | Out-Null

# ============================================================
# 00_Master_Review.md — FULL
# ============================================================
Set-Content "$base\00_Master_Review.md" @'
# QS03 — Master Review (Unified)

**Entry:** QS03 — Vulnerable Signatures and Code-Signing
**Review date:** 2026-10-04
**OWASP project:** quantum-security-project/quantum-top-10
**Status:** Complete — unified finding register finalized
**Methodology:** Merged analysis from two independent review passes

---

## 1. Review Objective

Review QS03 for:

- Technical accuracy of the quantum signature-forgery threat model
- Distinction from QS01 (integrity/authenticity vs confidentiality)
- Trust-chain migration model rather than leaf-key replacement
- Signature assurance lifetime modelling
- Precision of cryptographic terminology (RSA/DSA/ECDSA/EdDSA, factorization
  vs discrete logarithm, stateful vs stateless HBS)
- Algorithm selection as a use-case-driven decision, not one-size-fits-all
- Verifier-side migration constraints
- Reference accuracy (current IETF RFCs, TCG TPM 2.0 v185, UEFI PQC work)
- Standards and regulatory mapping scope precision
- Cross-entry boundaries with QS01, QS04, QS05, QS06, QS07

---

## 2. Core Assessment

QS03 is technically stronger than the QS01 draft. It has THREE novel
conceptual contributions that are already present or newly identified:

1. **Re-establishment failure** — migration is technically correct on every
   cryptographic measure, but the issuance flow accepted a compromised anchor.
   Should be split into three sub-modes: trust re-establishment failure,
   cryptographic migration failure, key lifecycle migration failure.

2. **Re-signing vs re-issuance** — signed artefacts (fixed content) can be
   re-signed as remediation; credentials (key-control claims) require
   re-issuance resting on independent evidence; roots of trust require
   verifier update.

3. **Signature assurance lifetime** — a new dimension. The period during
   which a relying party needs to retain confidence that a signature provides
   reliable evidence of authenticity and integrity. Distinct from artifact
   retention, from confidentiality lifetime (QS01), and from operational
   lifetime.

### The five levels of issues found

| Level | Issue |
|---|---|
| Conceptual | Signature break ≠ instant invalidation of historical signatures; trust-chain migration model rather than leaf-key replacement |
| Technical | DSA verification-only status; RSA vs ECDSA vs EdDSA underlying problems; TPM 2026 PQC support; stateful HBS state management |
| Risk methodology | Signature assurance lifetime must be defined and separated from retention |
| Governance / regulatory | Standards/Regulatory Mapping has unresolved TODO; CNSA 2.0 scope precision; NCSC ML-DSA-65 verification; CRA qualification |
| Reference landscape | Modern IETF RFCs (9881, 9882, 9909, 9964), TCG TPM 2.0 v185, UEFI PQC work must be added |

---

## 3. Priority Findings Summary

- **Critical:** 1 (QS03-OBS-001)
- **Very High:** 13
- **High:** 17
- **Medium:** 9
- **Total granular observations:** 40

See `01_Master_Finding_Register.md` for the complete unified register.

---

## 4. The revised QS03 model

### Core framing

> **Signature forgery is an active exploitation problem, not a passive
> collection problem. Once a CRQC exists, a forged signature does not need
> to be harvested; it can be used immediately. Migration lead time is
> therefore more critical for signatures than for confidentiality, because
> there is no retroactive remediation once an active forgery has been trusted.**

### Exposure comparison

| Dimension | QS01 | QS03 |
|---|---|---|
| Protected property | Confidentiality | Integrity + Authenticity + Non-repudiation |
| Attack nature | Passive capture | Active forgery |
| Time model | Harvest now, decrypt later | Forge now, exploit now |
| Mosca Y | Confidentiality lifetime | Signature assurance lifetime |
| Remediation | Re-encrypt / re-wrap | Re-sign / re-issue / re-anchor |
| Verification gap | Decrypt-side | Verifier-side |

### Operational signature trust chain

    Trust Anchor
      |
      v
    CA / Issuer key
      |
      v
    Certificate / key identifier
      |
      v
    Signing key
      |
      v
    Artifact / message / token format
      |
      v
    Verifier implementation
      |
      v
    Trust-store policy
      |
      v
    Revocation / fallback mechanism
      |
      v
    Hardware / embedded components
      |
      v
    Business decision (trust acceptance)

---

## 5. The two signature trust pathways

### Path A — Signed artefacts (re-signable)

    TODAY
       |
    Artefact signed (classical)
       |
       v
    Distributed / archived
       |
    FUTURE
       |
       v
    CRQC
       |
       v
    Classical signature becomes forgeable
       |
       v
    Content unchanged; claim unchanged
       |
       v
    Re-sign with PQC scheme
       |
       v
    Claim re-attested

### Path B — Credentials (require re-issuance)

    TODAY
       |
    Credential issued (classical)
       |
       v
    Subject uses credential
       |
    FUTURE
       |
       v
    CRQC
       |
       v
    Classical credential becomes forgeable
       |
       v
    Claim must be re-established
       |
       v
    Re-issuance requires independent evidence
       |
       v
    New credential issued
       |
       v
    RISK: re-establishment failure if
    issuance flow trusts old (forgeable) anchor

---

## 6. QS03 conceptual model (full)

                        QS03
                         |
              Quantum-Compromised
                 Signature Trust
                         |
           +-------------+-------------+
           |             |             |
        Signing       Trust       Verification
          Keys        Chains        Systems
           |             |             |
           v             v             v
        Code-signing    CA / PKI     Legacy verifier
        Firmware        Certs        Protocols
        Documents       Roots        Libraries
        JWT/SAML        Issuers      Devices
        CMS             Identity     Hardware
        Attestation
                         |
                         v
                Quantum-capable attacker
                         |
                         v
                   Forgery / Trust
                     compromise
                         |
           +-------------+-------------+
           |             |             |
           v             v             v
       Malicious      Identity      False
        update       impersonation  evidence

---

## 7. Cross-entry boundaries (QS03 ↔ QS01 ↔ QS04 ↔ QS05 ↔ QS06 ↔ QS07)

| Topic | QS01 | QS03 | QS04 | QS05 | QS06 | QS07 |
|---|---|---|---|---|---|---|
| Mosca's inequality | Confidentiality | Signature assurance | — | — | — | — |
| Crypto discovery | Uses | Uses | Primary | Uses | Uses | Uses |
| Algorithm selection | KEM (ML-KEM) | Signatures (ML-DSA / SLH-DSA / HBS) | Inventory | Agility | Deployment | Hardware |
| Hybrid deployment | TLS hybrid | Signing hybrid | — | Migration | Primary | — |
| Code-signing / firmware | — | Primary | Discovery | Agility | Migration | Hardware root |
| CA hierarchy | TLS certs | Primary | Inventory | Migration | Deployment | HSM |
| Re-issuance / re-signing | — | Primary | — | — | — | — |
| Verifier population | TLS clients | Signature verifiers | Inventory | Migration | Deployment | Hardware |
| HSM / KMS | Key storage | Signing key storage | Inventory | Agility | Deployment | Primary |
| Stateful HBS | — | Primary | — | — | — | HSM state |
| Signature assurance lifetime | — | Primary | — | — | — | — |
| Long-lived signed artifacts | — | Primary | Discovery | Agility | Preservation | Hardware |

### Dependency flow

    QS04 -> discover signature and trust dependencies
    QS03 -> assess signature/trust exposure and assurance lifetime
    QS05 -> enable algorithm replacement (agility)
    QS06 -> execute PQC/hybrid migration securely (verifier compat, fallback)
    QS07 -> address hardware-root constraints (TPM, Secure Boot, HSM)

### Framing questions

- **QS01:** What confidentiality HNDL exposure do you have?
- **QS03:** What signature/trust exposure do you have, and how long must each signature remain trustworthy?
- **QS04:** Where is your cryptography and what does it depend on?
- **QS05:** Can you change algorithms without rebuilding the system?
- **QS06:** Are you executing PQC/hybrid migration securely (verifier compat, fallback)?
- **QS07:** What are you doing about hardware roots that cannot be easily updated?

---

## 8. Contribution Disposition

### Direct PR
- Description rewrite (Shor's precision, trust-chain model, signature assurance lifetime)
- Re-establishment failure split into 3 sub-modes
- Re-signing vs re-issuance operational table
- Common Examples rewrite (verifier populations, TPM qualification, long-lived artifacts)
- Prevention restructure (lifecycle-based, 8 families)
- Attack Scenarios: 5 total (3 extended + 2 new)
- References: add RFC 9881, 9882, 9909, 9964, FIPS 186-5, CA/B SC-081, TCG v185, UEFI PQC, DORA Art. 30
- Standards/Regulatory Mapping taxonomy
- Cross-entry boundaries

### GitHub Issues (4 consolidated)
- #1 Signature forgery risk + signature assurance lifetime
- #2 Trust-chain migration model
- #3 Long-lived signed artifacts
- #4 Standards and protocol references update

### Discussion / Research
- Quantitative signature-trust exposure model
- Re-establishment failure detection tooling
- Verifier population migration patterns
- TPM/UEFI PQC field-upgrade constraints

---

## 9. Acceptance Criteria

The QS03 revision is complete when:

- [ ] Quantum signature risk framed as authenticity/integrity/trust risk
- [ ] Signature forgery distinguished from instant invalidation of historical signatures
- [ ] Signature assurance lifetime defined
- [ ] Signature assurance lifetime distinguished from retention and confidentiality lifetime
- [ ] Full trust-chain migration described (not just leaf-key replacement)
- [ ] DSA legacy verification status precise
- [ ] RSA/ECDSA/EdDSA/DSA underlying assumptions stated (factorization vs discrete log)
- [ ] Code-signing has a dedicated example
- [ ] Certificate / CA compromise has a dedicated example
- [ ] Long-lived signed artifacts covered
- [ ] Verifier migration covered
- [ ] Classical fallback/downgrade covered
- [ ] Secure Boot / firmware trust covered
- [ ] TPM described accurately; current PQC capabilities acknowledged (TCG v185)
- [ ] ML-DSA and SLH-DSA presented as standards, not proposals
- [ ] SP 800-208 correctly described (stateful hash-based, controlled use)
- [ ] X.509 / CMS / JOSE references current (RFC 9881, 9882, 9909, 9964)
- [ ] Regulatory claims scoped (CRA qualification, DORA Art. 30)
- [ ] QS03/QS01 boundary explicit
- [ ] QS03/QS04 boundary explicit
- [ ] QS03/QS05 boundary explicit
- [ ] QS03/QS06 boundary explicit
- [ ] QS03/QS07 boundary explicit
'@

# ============================================================
# 01_Master_Finding_Register.md — FULL UNIFIED (40 findings)
# ============================================================
Set-Content "$base\01_Master_Finding_Register.md" @'
# QS03 — Unified Master Finding Register

40 findings merged from two independent review passes. Not submitted to
OWASP directly. Consolidated into 4 Issues + 1 PR.

---

## 🔴 CRITICAL

### QS03-OBS-001 — "Signature broken" is not "all historical signatures instantly invalid"

**Type:** Conceptual clarification
**Disposition:** Issue + PR

QS03 must distinguish five separate concepts:

1. Future forgery capability
2. Existing signature verification
3. Historical assurance
4. Trust-chain compromise
5. Ability to issue new trusted artifacts

A quantum attacker gains the ability to create forged signatures once the
underlying hard problem can be solved. This does not change the byte content
of any existing signature. The relevant question becomes:

> Can you still trust that signature as authenticity evidence?

This is especially important for long-lived signed artifacts.

**Proposed framing:**
> "Quantum-capable adversaries may eventually defeat classical public-key
> signature mechanisms, enabling signature forgery and undermining the
> authenticity, integrity, and trust assumptions that depend on those
> signatures."

---

## 🟠 VERY HIGH

### QS03-OBS-002 — Trust-chain migration, not leaf-key replacement

**Type:** Structural
**Disposition:** Issue + PR

Signature migration must address the complete trust chain:

    Root / Trust Anchor
        |
    CA / Issuer
        |
    Certificate
        |
    Signing Key
        |
    Signed Artifact
        |
    Verifier
        |
    Trust Policy

For code signing / firmware:

    Platform Root
        |
    OEM / Publisher Key
        |
    Update Signing Key
        |
    Firmware / Driver / Application
        |
    Verifier / Secure Boot Policy

Migrating only the leaf signing key does not guarantee quantum-safe trust.

---

### QS03-OBS-003 — DSA verification-only status

**Type:** Technical clarification
**Disposition:** PR

FIPS 186-5 retains DSA only for verification of existing signatures, not for
new signature generation. RSA, ECDSA, and EdDSA remain in FIPS 186-5 for
generation and verification.

**Proposed wording:**
> "Classical public-key signature mechanisms such as RSA, ECDSA, EdDSA, and
> legacy DSA-based signatures are vulnerable to sufficiently capable quantum
> attacks. DSA is retained in FIPS 186-5 only for verification of existing
> signatures."

---

### QS03-OBS-004 — Underlying cryptographic assumptions

**Type:** Technical
**Disposition:** PR

Do not say "Shor breaks signatures." Decompose precisely:

    RSA          -> integer factorization
    ECDSA/EdDSA  -> elliptic-curve discrete logarithm
    DSA          -> finite-field discrete logarithm

Shor's algorithm makes the corresponding cryptanalytic problems polynomial-time
solvable in an idealized large-scale quantum setting.

---

### QS03-OBS-005 — Separate QS03 from QS01 HNDL model

**Type:** Structural
**Disposition:** PR

    QS01: ciphertext -> future decryption
    QS03: signed object -> future forgery / trust compromise

Overlap exists only in long-lived data/object context. QS03 needs its own
time-dimension model:

- Signature lifetime
- Artifact lifetime
- Trust-chain lifetime
- Verifier lifetime
- Cryptographic validity lifetime

---

### QS03-OBS-006 — Re-establishment failure must be split into 3 sub-modes

**Type:** Structural
**Disposition:** Issue + PR

Keep "re-establishment failure" as parent concept, but explain:

**A. Trust re-establishment failure**
    Old classical trust anchor cannot authenticate new PQC signer

**B. Cryptographic migration failure**
    PQC signature introduced -> legacy verifier doesn't support it -> artifact rejected

**C. Key lifecycle migration failure**
    Old signing key -> new signing key -> cert/firmware/trust-store update ->
    device cannot safely transition

---

### QS03-OBS-007 — Code-signing is a high-impact scenario

**Type:** Gap
**Disposition:** PR

    signing key compromise
        |
    forged update
        |
    verifier accepts signature
        |
    malicious code executes

Examples: software updates, firmware, drivers, package signing, container
signing, bootloader, OS loader, browser/plugin updates, IoT firmware.

---

### QS03-OBS-008 — Secure Boot must be treated as a trust-root problem

**Type:** Extension
**Disposition:** PR

UEFI Secure Boot uses RSA/ECDSA-based cryptographic mechanisms, certificate
path validation, and Secure Boot databases (db, dbx, KEK, PK). Migration is
not just changing the signer key — it requires updating:

    trust store
    verification implementation
    certificate formats
    policy
    revocation
    update mechanism
    rollback handling

---

### QS03-OBS-009 — TPM scope precision

**Type:** Clarification
**Disposition:** PR

TPM is not "another signing key." TPM provides:

- signing
- attestation
- device identity
- key protection
- measurement
- secure boot integration

**2026 update:** TCG TPM 2.0 v185 adds PQC support for ML-KEM/ML-DSA including
Attestation Keys. PTP 1.07 mandates ML-DSA support for PC-client TPM profiles.

**Proposed wording:**
> "Existing deployed TPM generations and their supported profiles may constrain
> PQC migration; current specifications increasingly incorporate PQC mechanisms,
> but deployed-device capability and secure upgrade paths must be assessed
> individually."

---

### QS03-OBS-010 — Algorithm selection is not one-size-fits-all

**Type:** Clarification
**Disposition:** PR

"Replace all with ML-DSA" is wrong. The correct reasoning:

    Use-case -> protocol constraints -> signature size ->
    verification performance -> hardware/storage constraints ->
    trust-chain format -> standardization status -> chosen scheme

This is especially important for firmware, embedded, and certificate use cases.

---

### QS03-OBS-011 — SLH-DSA positioning

**Type:** Clarification
**Disposition:** PR

FIPS 205 defines SLH-DSA as a stateless hash-based signature algorithm. Avoid
presenting ML-DSA and SLH-DSA as drop-in replacements for each other — they
have different engineering trade-offs.

**Proposed wording:**
> "Deploy ML-DSA or SLH-DSA as appropriate to the application and protocol
> requirements."

---

### QS03-OBS-012 — Stateful HBS constraints

**Type:** Technical
**Disposition:** PR

NIST SP 800-208 is stateful hash-based signatures (LMS/XMSS). Emphasize:

- state management is critical
- controlled private-key usage
- not general-purpose replacements

**Proposed wording:**
> "LMS/XMSS require strict state management and controlled private-key usage.
> They are not general-purpose replacements for RSA/ECDSA."

---

### QS03-OBS-013 — Long-lived signed artifacts are a distinct risk category

**Type:** Gap
**Disposition:** Issue + PR

Examples: signed contracts, legal documents, firmware, software releases,
signed configuration, archived XML/CMS objects, signed logs, signed
certificates, timestamped evidence.

Risk: artifact lifetime > current signature assurance lifetime.

**QS03 analog of QS01's confidentiality lifetime.**

---

### QS03-OBS-014 — Signature Assurance Lifetime (KEY NEW CONCEPT)

**Type:** New dimension
**Disposition:** Issue + PR

**Definition:**
> "Signature assurance lifetime is the period during which a relying party
> needs to retain confidence that a signature provides reliable evidence of
> the artifact's authenticity and integrity."

Distinct from:
- artifact retention period
- operational lifetime
- confidentiality lifetime (QS01)

**Examples:**

    Contract retained: 30 years
    Signature assurance required: 15 years

    Firmware artifact retained indefinitely
    Signature assurance required for operational lifetime

**This is QS03's strongest novel contribution — parallel to QS01's
confidentiality lifetime.**

---

### QS03-OBS-015 — Certificate migration must be in core threat model

**Type:** Gap
**Disposition:** PR

    Root CA -> Intermediate -> End-entity -> Service/device identity

PQC migration must address:

- algorithm
- certificate encoding
- algorithm identifiers
- issuance
- validation
- revocation
- trust store
- cross-signing / transition

**Concrete standard anchor:** RFC 9881 standardized ML-DSA algorithm
identifiers for X.509 certificates and CRLs.

---

### QS03-OBS-016 — CMS and archival signed objects

**Type:** Extension
**Disposition:** PR

For long-lived signed documents, CMS is very important.

**Concrete standard anchor:** RFC 9882 defines ML-DSA use in CMS (Standards
Track RFC).

    Signed archival object -> CMS -> ML-DSA migration

---

### QS03-OBS-017 — JWT/SAML must be algorithm-aware

**Type:** Clarification
**Disposition:** PR

Do not say "JWT and SAML are vulnerable to quantum attacks." Say:

> Deployments using quantum-vulnerable signature algorithms are exposed.

Examples in JWT: RS256, ES256, ES384, ES512, and similar classical algorithms.

**Concrete standard anchor:** RFC 9964 (May 2026) standardizes ML-DSA for JOSE
and COSE.

SAML should be algorithm/profile-specific, not protocol-wide.

---

### QS03-OBS-018 — Separate signing categories by attack impact

**Type:** Structural
**Disposition:** PR

| Category | Compromise impact |
|---|---|
| CA signing key | Forged certificate -> identity impersonation |
| Code-signing key | Forged update -> malware / malicious firmware |
| Document signing key | Forged legal / business artifact |
| Attestation signing key | False platform integrity evidence |

---

### QS03-OBS-019 — Blockchain example scope

**Type:** Clarification
**Disposition:** PR

Do not say "quantum computer breaks blockchain."

**Proposed framing:**
> classical signature-based ownership/control -> future quantum compromise of
> signing key -> forged authorization / transaction -> potential asset theft
> or state manipulation

Activity depends on blockchain design, signature scheme, and protocol migration
capability.

---

### QS03-OBS-020 — Prevention must be lifecycle-based

**Type:** Structural
**Disposition:** PR

Do not reduce to "replace RSA/ECDSA." The correct control flow:

    Inventory -> Classify -> Assess assurance lifetime -> Map trust chain ->
    Select PQ scheme -> Update verifier -> Update trust anchors ->
    Migrate issuers/signers -> Test compatibility -> Handle rollback ->
    Re-sign / re-issue -> Retire classical dependencies

Boundary with QS05/QS06.

---

### QS03-OBS-021 — Verifier migration must be explicit

**Type:** Gap
**Disposition:** Issue + PR

Common pitfall: organizations focus on signer migration (Signer -> ML-DSA)
but verifier is still:

    Legacy firmware
    Legacy OS
    Legacy library
    Legacy browser
    Legacy appliance
    Legacy smart card

Result:

    New PQ signature -> old verifier -> REJECT

or worse:

    new verifier -> still accepts weak classical signature -> downgrade

---

### QS03-OBS-022 — Hybrid boundary with QS06

**Type:** Structural
**Disposition:** PR

QS03 can say: "Consider hybrid or dual-signature transition strategies where
appropriate." Detailed hybrid cryptographic correctness belongs to QS06.

    QS03 -> What trust/signature exposure exists?
    QS06 -> How do we implement migration / hybrid safely?

---

### QS03-OBS-023 — Downgrade risk must be explicit

**Type:** Gap
**Disposition:** PR / QS06

    PQ signature available
        |
    legacy fallback allowed
        |
    attacker forces classical algorithm
        |
    quantum-vulnerable signature accepted

QS03 describes the risk; QS06 provides implementation-level mitigation.

---

### QS03-OBS-024 — PQ signature size/performance constraints

**Type:** Extension
**Disposition:** Discussion + PR

PQC signatures are significantly larger than classical ones. This matters for:

- certificates
- firmware
- constrained devices
- TPM
- embedded systems
- network protocols
- signed tokens

RFC 9964 records ML-DSA public/private key and signature sizes.

**Proposed prevention wording:**
> "Validate protocol, storage, bandwidth, parser, firmware, and hardware
> constraints associated with PQ signature sizes."

Overlaps with QS07.

---

### QS03-OBS-025 — Modern IETF references must be added

**Type:** Reference update
**Disposition:** PR

Add:

- RFC 9881 — ML-DSA in X.509 (October 2025)
- RFC 9882 — ML-DSA in CMS (October 2025)
- RFC 9909 — SLH-DSA in X.509 (December 2025)
- RFC 9964 — ML-DSA for JOSE and COSE (May 2026)

---

### QS03-OBS-026 — FIPS 204 errata status note

**Type:** Reference precision
**Disposition:** PR

FIPS 204 is final, but NIST has a planning note (2026-07-31) regarding future
update/revision and errata spreadsheet.

**Proposed wording:**
> "NIST FIPS 204 (Final, August 2024; see current NIST errata/planning note)."

---

### QS03-OBS-027 — SP 800-208 status must be correct

**Type:** Reference precision
**Disposition:** PR

SP 800-208 is Final (October 29, 2020). Do not present as draft.

---

### QS03-OBS-028 — TPM 2026 PQC support changes old hardware assumption

**Type:** Current evidence
**Disposition:** PR

TCG TPM 2.0 v185 supports ML-KEM and ML-DSA, including Attestation Keys.
PTP 1.07 mandates ML-DSA support in relevant TPM profiles.

QS03 should not say "TPM is classical-only blocker."

**Proposed wording:**
> "Existing deployed TPM generations and their supported profiles may
> constrain PQC migration; current specifications increasingly incorporate
> PQC mechanisms, but deployed-device capability and secure upgrade paths
> must be assessed individually."

---

### QS03-OBS-029 — UEFI PQC direction

**Type:** Current evidence
**Disposition:** PR

UEFI Forum has PQC work/planning (2026) related to Secure Boot, ML-KEM/ML-DSA/
SLH-DSA, and firmware authentication.

QS03 narrative should be:

    legacy signature trust roots -> migration challenge

not:

    UEFI cannot support PQC

---

## HIGH (additional original-pass findings)

### QS03-OBS-030 — Re-signing vs re-issuance operational table

**Type:** Original contribution emphasis
**Disposition:** Issue + PR

| Category | Claim | Remediation | Rationale |
|---|---|---|---|
| Signed artefact | Content approved by subject at time | Re-sign | Content unchanged; new signature re-attests same claim |
| Credential | Subject controls key | Re-issue | Claim requires independent evidence |
| Root of trust | Anchor is trusted | Distribution + verifier update | Anchor change requires verifier update |

For signed artefacts failing Mosca's inequality: re-signing is sufficient.

For credentials: re-signing is not equivalent to remediation. Require
re-issuance to rest on evidence independent of the credential being replaced.

---

### QS03-OBS-031 — Re-establishment failure detection guidance

**Type:** Missing dimension
**Disposition:** Issue + PR

Mitigation exists (Prevention item on re-signing vs re-issuance). Detection
does not.

**Proposed addition:**
> "Migration verification should include assurance that the new credential
> was issued on the basis of evidence independent of the credential being
> replaced. A migration that re-issues a strong algorithm over a compromised
> anchor produces a record indistinguishable from a correct migration on
> every cryptographic measure; detection requires auditing the issuance
> flow, not just the output."

---

### QS03-OBS-032 — CA/B Forum staged TLS cert timeline

**Type:** Factual precision
**Disposition:** PR

Precise staged milestones:

- March 15, 2026: 200 days max
- March 15, 2027: 100 days max
- March 15, 2029: 47 days max

**Proposed wording:**
> "Plan for progressively shorter TLS certificate lifetimes during
> transition: the CA/Browser Forum has approved a staged reduction to 200
> days (March 2026), 100 days (March 2027), and 47 days (March 2029).
> Shorter lifetimes reduce the exposure window of any individual certificate
> but do not by themselves remove the quantum vulnerability of the underlying
> signature algorithm."

---

### QS03-OBS-033 — CNSA 2.0 scope precision

**Type:** Scope / Regulatory precision
**Disposition:** PR

CNSA 2.0 is for U.S. National Security Systems (NSS), not commercial
regulation. Algorithm allowance:

- LMS and XMSS (single-tree): approved for firmware/software signing
- ML-DSA: approved
- SLH-DSA: NOT approved for NSS use
- HSS and XMSS^MT: NOT approved for NSS use

---

### QS03-OBS-034 — NSA FAQ document number verification

**Type:** Reference accuracy
**Disposition:** PR

Current reference: "PP-24-4014, December 2024." Must verify from NSA official
source. If unverifiable, remove or replace with official NSA CNSA 2.0 FAQ URL.

---

### QS03-OBS-035 — NCSC ML-DSA-65 claim verification

**Type:** Reference accuracy
**Disposition:** PR

"NCSC recommends ML-DSA-65 for most use cases" requires direct NCSC source.
If unverifiable, rephrase to "NCSC recommends ML-DSA as a general-purpose
PQC signature scheme."

---

### QS03-OBS-036 — CNSA 2.0 timeline precision

**Type:** Factual precision
**Disposition:** PR

| Year | Milestone |
|---|---|
| 2025 | New NSS acquisitions |
| 2027 | New NSS deployments |
| 2030 | Software/firmware signing exclusively CNSA 2.0 |
| 2033 | Full NSS transition |

---

### QS03-OBS-037 — CRA Annex I qualification

**Type:** Regulatory precision
**Disposition:** PR

CRA Annex I does not explicitly mandate PQC. Qualify.

**Proposed wording:**
> "EU Cyber Resilience Act Annex I requires products with digital elements to
> protect the integrity and authenticity of data using state-of-the-art
> mechanisms; its applicability to PQC signature migration should be assessed
> in light of the product's risk assessment, support period, applicable
> standards, and the evolving state of the art."

---

### QS03-OBS-038 — DORA Art. 30 emphasis

**Type:** Regulatory precision
**Disposition:** PR

DORA Articles 28-44 is too broad. Article 30 (contractual arrangements) is
most relevant for PKI / signing-service vendors.

---

### QS03-OBS-039 — Standards/Regulatory Mapping TODO resolution

**Type:** Structural / Process
**Disposition:** Issue + PR

Resolve TODO. Adopt QS01 taxonomy table (Source / Type / Scope / Relevance).
Verify each citation.

---

### QS03-OBS-040 — Retroactive vs prospective exposure

**Type:** Conceptual
**Disposition:** PR + Issue

Signature exposure is retroactive: any signature produced today with a
quantum-vulnerable key becomes forgeable once a CRQC exists, and the trust
it carries may still be acted upon.

Confidentiality exposure is prospective: data collected now, decrypted later.

**Proposed wording:**
> "Unlike confidentiality exposure, which is prospective (data collected
> now, decrypted later), signature exposure is retroactive: any signature
> produced today with a quantum-vulnerable key becomes forgeable once a
> CRQC exists, and the trust it carries may still be acted upon. Re-signing
> with a PQC scheme before the classical scheme is deprecated is therefore
> remediation, not migration."

---

## Summary table

| ID | Finding | Priority | Disposition |
|---|---|---|---|
| OBS-001 | Signature break ≠ instant invalidation | Critical | Issue + PR |
| OBS-002 | Trust-chain migration | Very High | Issue + PR |
| OBS-003 | DSA verification-only status | Very High | PR |
| OBS-004 | Underlying crypto assumptions | High | PR |
| OBS-005 | Separate QS03 from QS01 HNDL | Very High | PR |
| OBS-006 | Re-establishment failure (3 sub-modes) | Very High | Issue + PR |
| OBS-007 | Code-signing impact | Very High | PR |
| OBS-008 | Secure Boot trust root | Very High | PR |
| OBS-009 | TPM scope precision | High | PR |
| OBS-010 | Algorithm selection not one-size-fits-all | High | PR |
| OBS-011 | SLH-DSA positioning | High | PR |
| OBS-012 | Stateful HBS constraints | High | PR |
| OBS-013 | Long-lived signed artifacts | Very High | Issue + PR |
| OBS-014 | Signature assurance lifetime | Very High | Issue + PR |
| OBS-015 | Certificate migration | High | PR |
| OBS-016 | CMS/archive signatures | High | PR |
| OBS-017 | JWT/SAML algorithm specificity | High | PR |
| OBS-018 | Separate signing categories | High | PR |
| OBS-019 | Blockchain scope | Medium-High | PR |
| OBS-020 | Lifecycle-based prevention | High | PR |
| OBS-021 | Verifier migration | Very High | Issue + PR |
| OBS-022 | Hybrid boundary QS06 | High | PR |
| OBS-023 | Downgrade/fallback | High | PR / QS06 |
| OBS-024 | PQ signature size/performance | Medium-High | Discussion + PR |
| OBS-025 | Modern IETF references | High | PR |
| OBS-026 | FIPS 204 errata status | Medium | PR |
| OBS-027 | SP 800-208 final status | Medium | PR |
| OBS-028 | TPM 2026 PQC support | High | PR |
| OBS-029 | UEFI PQC direction | High | PR |
| OBS-030 | Re-signing vs re-issuance table | Very High | Issue + PR |
| OBS-031 | Re-establishment detection | Very High | Issue + PR |
| OBS-032 | CA/B Forum staged timeline | High | PR |
| OBS-033 | CNSA 2.0 scope precision | High | PR |
| OBS-034 | NSA FAQ verification | High | PR |
| OBS-035 | NCSC ML-DSA-65 verification | High | PR |
| OBS-036 | CNSA 2.0 timeline precision | High | PR |
| OBS-037 | CRA qualification | High | PR |
| OBS-038 | DORA Art. 30 emphasis | High | PR |
| OBS-039 | Mapping TODO resolution | Critical | Issue + PR |
| OBS-040 | Retroactive vs prospective | High | PR + Issue |
'@

Write-Host ""
Write-Host "Part 1/3 written: Master Review + Finding Register (40 findings)" -ForegroundColor Green
Write-Host ""