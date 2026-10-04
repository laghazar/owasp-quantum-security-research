# QS01 — Master Finding Register

Internal audit register. Not submitted to OWASP directly.
27 granular observations consolidated into ~10 findings and 4 Issues + 1 PR.
---

## Critical

### QS01-OBS-003 — CRQC planning horizon vs PQC migration milestones

**Section:** Description / Common Examples
**Type:** Correction / Clarification
**Priority:** Critical
**Disposition:** Direct PR + GitHub Issue

**Current statement:**
> "CRQC planning horizon most regulators use (2030-2035)"

**Problem:**
Presenting 2030-2035 as "CRQC planning horizon most regulators use" is misleading.
NCSC's 2028/2031/2035 are PQC migration milestones, not CRQC arrival forecasts.
EU roadmap's 2026/2030 are also migration milestones. They do not say the CRQC
will necessarily arrive in those years.

**Proposed wording:**
> "Data sets whose confidentiality lifetime, combined with migration lead time,
> extends beyond the organisation's assessed quantum-risk horizon..."

---

## Very High

### QS01-OBS-002 — Confidentiality lifetime is undefined

**Section:** Description
**Type:** Missing dimension / Clarification
**Priority:** Very High
**Disposition:** Issue + PR

**Current wording:**
> "required confidentiality lifetime"

**Problem:**
Readers can interpret this as retention period. They are not the same.

Realistic examples:
- Retention = 30 years / Confidentiality lifetime = 7 years
- Retention = 5 years / Confidentiality lifetime = 20 years

**Proposed definition:**
> "Confidentiality lifetime is the period during which unauthorized disclosure
> of the data would remain materially harmful or unacceptable, and should be
> assessed separately from the retention period."

---

### QS01-OBS-012 — Data classification needs to become operational

**Section:** Prevention
**Type:** Gap / Extension
**Priority:** Very High
**Disposition:** PR + Financial Services Profile

**Current wording:**
> "Classify data by confidentiality lifetime, not just sensitivity."

**Problem:**
Correct idea, no operationalization.

**Proposed wording:**
> "Classify and prioritize data based on confidentiality lifetime and adversarial
> value, not sensitivity alone. Assess confidentiality lifetime separately from
> retention period, and use the result to prioritize migration of data whose
> protection depends on quantum-vulnerable cryptographic mechanisms."

---

### QS01-OBS-022 — Retention period is not confidentiality lifetime

**Section:** Attack Scenario 2
**Type:** Clarification
**Priority:** Very High
**Disposition:** PR

**Problem:**
30-year retention does not imply 30-year confidentiality requirement.

**Proposed wording:**
> "A regulated entity retains sensitive personal records for a statutory 30-year
> period; the records have a confidentiality lifetime that must be assessed
> separately from the retention requirement."

---

## High

### QS01-OBS-001 — "same exposure" overstates transit/rest relationship

**Section:** Description
**Type:** Structural / Clarification
**Priority:** High
**Disposition:** PR

**Current wording:**
> "Both are the same exposure ... differing only in where the ciphertext currently resides."

**Problem:**
Same HNDL risk outcome, but different acquisition and remediation path.

**Better model:**

    HNDL
    ├── In-transit collection
    │   ├── passive interception
    │   ├── handshake capture
    │   ├── session-key dependency
    │   └── protocol migration
    │
    └── At-rest exfiltration
        ├── encrypted database/archive
        ├── wrapped DEK/KEK
        ├── key hierarchy
        └── re-wrapping / re-encryption / archive migration

**Proposed wording:**
> "The in-transit and at-rest cases share the same HNDL risk outcome—data
> acquired before quantum-safe protection is deployed may become decryptable
> later—but differ materially in acquisition, cryptographic dependency, and
> remediation path."

---

### QS01-OBS-005 — At-rest architecture needs deeper treatment

**Section:** Description / Prevention
**Type:** Technical Extension
**Priority:** High
**Disposition:** Issue + Discussion/Research + PR

**Problem:**
Current text jumps from RSA/ECC wrapping -> future quantum attack -> decrypt
archive. Real architecture can be:

    Master/Root Key -> KEK -> DEK -> Encrypted Data

or:

    KMS/HSM -> KEK / wrapping key -> DEK -> AES ciphertext

Migration treatment can be:
- re-encryption
- re-wrapping
- new key hierarchy
- new envelope
- KMS migration
- HSM replacement/upgrade
- cryptographic-agility changes

**Proposed wording:**
> "For stored data, assess the full key hierarchy protecting the ciphertext,
> including data-encryption keys, key-encryption or wrapping keys, KMS/HSM
> dependencies, and recovery mechanisms. The required treatment may involve
> re-wrapping, re-encryption, key-hierarchy migration, or replacement of the
> underlying key-establishment mechanism."

---

### QS01-OBS-007 — "re-encryption" is too narrow

**Section:** Prevention
**Type:** Technical Clarification / Extension
**Priority:** High
**Disposition:** PR

**Proposed wording:**
> "Apply an architecture-appropriate migration treatment to high-priority stored
> data, which may include re-encryption, re-wrapping, key-hierarchy migration,
> replacement of vulnerable key-establishment mechanisms, or deployment of a
> new protection envelope."

---

### QS01-OBS-009 — Example 5 mixes independent cryptographic layers

**Section:** Common Examples
**Type:** Structural / Clarification
**Priority:** High
**Disposition:** PR

**Current example:**
> "Session encryption migrated to PQC while long-validity certs and key-wrapping
> keys protecting archived data remain classical."

**Problem:**
Three different things mixed: session encryption, PKI/signature/certificates,
archive key wrapping.

**Proposed split:**

Example 5A — Communication partial migration:
> "Communication channels have migrated to PQC or hybrid key establishment,
> while long-lived classical certificate, authentication, or signature
> dependencies remain."

Example 5B — Stored-data partial migration:
> "Communication channels have migrated to PQC or hybrid key establishment,
> while archived data remains dependent on classical key-encryption or
> key-wrapping mechanisms."

---

### QS01-OBS-010 — PQC deployment does not automatically eliminate HNDL

**Section:** Prevention
**Type:** Gap / Clarification
**Priority:** High
**Disposition:** PR

**Problem:**
"PQC deployed = safe" does not follow. Partial migration is possible.
NCSC notes that during migration, classical and PQC mechanisms may coexist,
and full quantum-secure authentication requires separate PKI migration.

**Proposed wording:**
> "Deployment of PQC in one protocol or channel does not by itself eliminate
> HNDL exposure. Residual exposure may remain where archived data, certificates,
> signatures, key-wrapping mechanisms, or dependent services still rely on
> quantum-vulnerable cryptography."

---

### QS01-OBS-011 — Hybrid PQC TLS control needs operational scope

**Section:** Prevention
**Type:** Technical Clarification
**Priority:** High
**Disposition:** PR

**Problem:**
ML-KEM itself is a KEM standard; it is not synonymous with "TLS."
NIST FIPS 203 defines ML-KEM as a KEM for establishing a shared secret
that can then be used with symmetric cryptography.

**Proposed wording:**
> "Migrate quantum-vulnerable key-establishment mechanisms in externally
> exposed channels to standards-based PQC or hybrid configurations using
> approved mechanisms such as ML-KEM, where supported. Validate
> interoperability, downgrade and fallback behaviour, certificate
> dependencies, and migration readiness across clients, servers, libraries,
> proxies, and other network infrastructure."

---

### QS01-OBS-013 — "PQC-protected encryption envelope" is ambiguous

**Section:** Prevention
**Type:** Technical Correction / Extension
**Priority:** High
**Disposition:** Issue + PR

**Current:**
> "layer a PQC-protected encryption envelope over the existing classical encryption"

**Problem:**
ML-KEM is not an encryption algorithm like AES-GCM. FIPS 203 is a KEM.
SP 800-227 gives KEM secure use/application guidance.

**Proposed wording:**
> "For high-priority archives, evaluate PQC-protected key-establishment or
> key-wrapping architectures capable of protecting the keys required to
> decrypt existing data. Select the treatment based on the existing encryption
> and key hierarchy, including KMS/HSM dependencies and the requirements for
> re-wrapping or re-encryption."

---

### QS01-OBS-014 — Key rotation is not a primary HNDL mitigation

**Section:** Prevention
**Type:** Technical Correction
**Priority:** High
**Disposition:** PR

**Current:**
> "Rotate symmetric data keys ... to reduce the volume of data exposed..."

**Problem:**
Not wrong as secondary risk reduction, but can mislead a reader into thinking
key rotation solves HNDL. It does not remove:
- quantum-vulnerable key wrapping
- quantum-vulnerable key establishment

**Proposed wording:**
> "Prioritize migration or replacement of quantum-vulnerable key-establishment
> and key-protection mechanisms. Use symmetric-key rotation as a supporting
> key-management control that can limit the amount of data protected by any
> individual key, but not as a standalone mitigation for HNDL."

---

### QS01-OBS-016 — Explicit crypto dependency discovery is missing

**Section:** Prevention
**Type:** Gap / Cross-entry
**Priority:** High
**Disposition:** PR + QS04 cross-reference

**Proposed wording:**
> "Identify and map the cryptographic dependencies protecting high-value and
> long-lived data, including key-establishment mechanisms, key-wrapping
> mechanisms, certificates, KMS/HSM dependencies, protocols, applications,
> libraries, and third-party services. Use cryptographic inventory and
> dependency information to prioritize HNDL remediation."

**Cross-reference:** QS01 identifies the HNDL risk; QS04 discovers/maps crypto
dependencies.

---

### QS01-OBS-017 — RSA/ECDH grouping in TLS scenario

**Section:** Attack Scenario 1
**Type:** Technical clarification
**Priority:** High
**Disposition:** PR

**Current:**
> "The handshake used RSA or ECDH key establishment."

**Problem:**
TLS 1.3 removed static RSA and static DH cipher suites and uses (EC)DHE
and/or PSK-based key exchange modes. TLS 1.2 historically included RSA key
exchange. RSA is valid as illustrative legacy TLS 1.2/earlier example, but
should not be written as though modern TLS universally uses RSA key exchange.

**Proposed scenario wording:**
> "An adversary passively records TLS-protected traffic crossing an untrusted
> network boundary. The connection relies on a quantum-vulnerable public-key
> key-establishment mechanism, such as legacy RSA key transport or classical
> (EC)DHE. The attacker retains the captured handshake and ciphertext. Once a
> CRQC becomes available, the attacker uses the captured cryptographic material
> to compromise the vulnerable key-establishment mechanism, derive the traffic
> keys where feasible, and decrypt previously captured traffic."

---

### QS01-OBS-019 — Forward secrecy clarification

**Section:** Attack Scenario 1
**Type:** Clarification
**Priority:** High
**Disposition:** PR

**Important point:**
Classical forward secrecy is not synonymous with post-quantum security.
A fresh ephemeral ECDHE key provides forward secrecy against later compromise
of a long-term authentication key, but the classical ECDHE mechanism itself
remains vulnerable to a sufficiently capable quantum computer.

**Proposed wording:**
> "Classical forward secrecy does not by itself eliminate HNDL risk where the
> ephemeral key-establishment mechanism remains quantum-vulnerable and the
> adversary can retain the protocol transcript."

---

### QS01-OBS-020 — Specify what the attacker exfiltrates

**Section:** Attack Scenario 2
**Type:** Technical clarification
**Priority:** High
**Disposition:** PR

**Current:**
> "attacker exfiltrates store now"

**Problem:**
If the attacker only has AES ciphertext and not the protected key material,
the future quantum attack cannot help.

**Proposed scenario:**
> "A regulated entity retains sensitive personal records for a long period and
> stores them in an AES-encrypted archive. The data-encryption key (DEK) is
> protected by a quantum-vulnerable RSA key-encryption or wrapping mechanism.
> An attacker exfiltrates the encrypted archive and the associated protected
> key material. The attacker retains both until a CRQC becomes available.
> The quantum attack compromises the corresponding RSA private key, allowing
> the protected DEK to be recovered and the archived records to be decrypted."

---

### QS01-OBS-023 — "CRQC recovers wrapping key" is technically imprecise

**Section:** Attack Scenario 2
**Type:** Technical correction
**Priority:** High
**Disposition:** PR

**Problem:**
For RSA:
- Public key = wrapping / encryption key
- Private key = corresponding secret key

The quantum attack targets the underlying RSA problem and can recover the
private key, not the public wrapping key.

**Proposed wording:**
> "A CRQC compromises the quantum-vulnerable RSA private key corresponding to
> the key-encryption or wrapping key, allowing the protected data-encryption
> key to be recovered."

---

### QS01-OBS-024 — HSM/KMS does not automatically make RSA/ECC quantum-safe

**Section:** Attack Scenario 2 / Cross-entry
**Type:** Missing dimension / Cross-entry
**Priority:** High
**Disposition:** PR + QS07 cross-reference

**Problem:**
A strong HSM can protect key material from many classical extraction threats.
But "RSA inside HSM" does not become PQC merely because it is inside an HSM.
Same for ECC.

HSM protection != post-quantum protection

**Proposed wording:**
> "Cryptographic key protection in an HSM or KMS can reduce classical
> key-extraction risk but does not by itself remove the quantum vulnerability
> of RSA, ECC, or other quantum-vulnerable public-key mechanisms. Quantum
> migration must therefore assess both cryptographic algorithm dependency and
> key-custody architecture."

---

### QS01-OBS-025 — U.S. federal policy must not be presented as general regulation

**Section:** Regulatory Mapping
**Type:** Scope / Regulatory precision
**Priority:** High
**Disposition:** PR

**Problem:**
NSM-10 / OMB M-23-02 are U.S. federal policy instruments. They cannot be
used as evidence for "organisations/regulators generally require..."

U.S. federal requirement != generic global regulatory requirement.

**Proposed change:** Add scope column.

---

### QS01-OBS-026 — CRA does not itself establish an explicit PQC mandate

**Section:** Regulatory Mapping
**Type:** Regulatory precision
**Priority:** High
**Disposition:** PR

**Problem:**
CRA Annex I is relevant to cybersecurity requirements and cryptography, but
QS01 should not say "CRA mandates PQC."

**Proposed wording:**
> "CRA requirements concerning state-of-the-art mechanisms for confidentiality
> and data minimisation can be relevant to PQC migration planning; the
> regulation should not be presented as explicitly mandating a particular PQC
> algorithm unless a separate implementing/harmonised requirement establishes
> that obligation."

---

### QS01-OBS-027 — CRA does not support "many products extend past 2030"

**Section:** Regulatory Mapping
**Type:** Evidence / wording correction
**Priority:** High
**Disposition:** PR

**Problem:**
CRA says support period is generally at least five years if the product is
intended for longer use, and the support period should consider expected use
time and other factors. The "many products extend past 2030" claim is not
direct inference from this source.

**Action:** Remove "many products extend past 2030" unless backed by another
explicit source.

**Better wording:**
> "Products with long support periods or difficult-to-update components may
> require earlier migration planning because cryptographic dependencies can
> persist beyond normal software update cycles."

---

### QS01-OBS-028 — Add DORA RTS Article 6 and Article 7

**Section:** Regulatory Mapping
**Type:** Missing reference / Regulatory mapping enhancement
**Priority:** High
**Disposition:** PR

**Problem:**
Current mapping only mentions DORA Article 9. For QS01 controls, DORA RTS
Article 6 is more directly relevant.

Article 6 requires financial entities to maintain a policy on encryption and
cryptographic controls covering:
- data at rest
- data in transit
- data in use where necessary
- internal/external network connections
- cryptographic key management and lifecycle

Article 6(4) addresses updating/changing cryptographic technology in response
to cryptanalysis developments.

Article 7 extends the lifecycle to generation, renewal, storage, backup,
archiving, retrieval, transmission, retirement, revocation, destruction.

**Action:** Add Commission Delegated Regulation (EU) 2024/1774 Article 6 and
Article 7.

---

### QS01-OBS-029 — Regulatory mapping needs taxonomy

**Section:** Regulatory Mapping
**Type:** Structural / Regulatory precision
**Priority:** High
**Disposition:** PR + GitHub Issue

**Problem:**
Current mapping mixes standards, drafts, guidance, roadmaps, federal policy,
directives, regulations, regulatory technical standards, and advisory
algorithm suites in one list. This gives the impression all have equivalent
legal weight.

**Action:** Convert to table: Source / Type / Jurisdiction-Scope / QS01 relevance.

---

## Medium

### QS01-OBS-004 — Key-establishment terminology

Terminology precision: key establishment, key agreement, key transport are
distinct. Use precisely.
**Disposition:** PR

**Note.** OBS-007 (re-encryption vs broader archive treatment) is documented
in the High section. It is not a separate Medium observation.

### QS01-OBS-008 — "Current TLS/VPN" qualification

Qualify that TLS 1.2 with RSA key transport is a legacy case, not modern default.
**Disposition:** PR

### QS01-OBS-018 — Attack assumptions

Add explicit assumption paragraph.
**Disposition:** PR

### QS01-OBS-021 — RSA-wrapped AES as illustrative architecture

Use "for example, an RSA-protected AES data-encryption key."
**Disposition:** PR

---

## Summary table

| ID | Finding | Type | Priority | Disposition |
|---|---|---|---|---|
| OBS-001 | Transit vs at-rest distinction | Structural | High | PR |
| OBS-002 | Confidentiality lifetime undefined | Missing dimension | Very High | Issue + PR |
| OBS-003 | CRQC timeline vs migration milestones | Correction | Critical | Issue + PR |
| OBS-004 | Key-establishment terminology | Technical | Medium | PR |
| OBS-005 | At-rest key hierarchy | Technical Extension | High | Issue + PR |
| OBS-007 | Re-encryption too narrow | Technical | High | PR |
| OBS-008 | TLS/VPN qualification | Technical | Medium | PR |
| OBS-009 | Example 5 mixing layers | Structural | High | PR |
| OBS-010 | PQC not full remediation | Gap | High | PR |
| OBS-011 | Hybrid TLS operational scope | Technical | High | PR |
| OBS-012 | Data classification operational | Gap | Very High | PR + FSP |
| OBS-013 | PQC envelope ambiguous | Technical | High | Issue + PR |
| OBS-014 | Key rotation not primary | Technical Correction | High | PR |
| OBS-016 | Crypto dependency discovery | Gap / Cross-entry | High | PR |
| OBS-017 | RSA/ECDH grouping | Technical | High | PR |
| OBS-018 | Attack assumptions | Clarification | Medium | PR |
| OBS-019 | Forward secrecy clarification | Clarification | High | PR |
| OBS-020 | At-rest exfiltration detail | Technical | High | PR |
| OBS-021 | RSA-wrapped AES illustrative | Scope | Medium | PR |
| OBS-022 | Retention vs confidentiality | Clarification | Very High | PR |
| OBS-023 | Recovers wrapping key -> private key | Technical Correction | High | PR |
| OBS-024 | HSM/KMS not PQ protection | Cross-entry | High | PR |
| OBS-025 | US federal policy scope | Scope | High | PR |
| OBS-026 | CRA PQC interpretation | Regulatory | High | PR |
| OBS-027 | CRA 2030 statement | Evidence | High | PR |
| OBS-028 | DORA RTS Art. 6 / 7 | Missing ref | High | PR |
| OBS-029 | Regulatory mapping taxonomy | Structural | High | PR + Issue |

---

## Finding Count Reconciliation

**Status.** 2026-10-04

Current master register status:

- Unique observation IDs: 27
- Historical claim referenced: 29 granular observations
- Numeric gaps in sequence: QS01-OBS-006, QS01-OBS-015
- Duplicate heading removed: QS01-OBS-007 (Medium section cross-reference)
  — the substantive finding is documented once, in the High section

**Reconciliation rules applied:**

1. No missing observation is inferred from an unused numeric ID. Gaps in
   the numbering sequence (OBS-006, OBS-015) are not treated as evidence
   of dropped findings.
2. No new finding is created solely to restore sequential numbering.
3. A cross-reference entry that duplicates an existing heading is not
   counted as a separate observation.

**Total.** 27 unique observations.

Any historical reference to 29 findings is retained as provenance
information and is not treated as the current finding count.