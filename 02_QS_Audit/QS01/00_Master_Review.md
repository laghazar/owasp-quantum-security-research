# QS01 — Master Review

**Entry:** QS01 — Harvest-Now-Decrypt-Later Exposure
**Reviewer:** <Larisa Ghazaryan>
**Review date:** 2026-10-04
**OWASP project:** quantum-security-project/quantum-top-10
**Entry version reviewed:** draft v0.1 (bootstrap)
**Status:** Review Complete (evidence validation pending) — findings register finalized

---

## 1. Review Objective

Review QS01 for:

- Technical accuracy of the HNDL threat model
- Clarity of in-transit vs at-rest exposure distinction
- Confidentiality-lifetime modelling
- Precision of PQC migration terminology
- Precision of cryptographic terminology (key establishment, key transport,
  key agreement, wrapping, re-wrapping, re-encryption)
- Standards and regulatory mapping accuracy
- Boundary management with QS04, QS05, QS06, QS07

---

## 2. Core Assessment

The core HNDL concept is technically sound and evidence-backed. NIST FIPS 203,
NIST SP 800-227, NIST IR 8547, UK NCSC migration timelines, the EU Coordinated
Implementation Roadmap, OMB M-23-02, and DORA RTS Article 6 all support the
general thesis that:

1. Encrypted data can be collected today and retained for future decryption
   once a cryptographically relevant quantum computer (CRQC) exists.
2. Long-lived confidential data is the primary exposure class.
3. Migration must begin before CRQC arrival because migration lead time is
   multi-year.

The primary contribution opportunity is not to add new evidence. It is to
improve precision, scope, taxonomy, architecture, and regulatory wording in
the current draft text.

### The four levels of issues found

| Level | Issue |
|---|---|
| Conceptual | In-transit and at-rest pathways are presented as "the same exposure", which overstates the relationship |
| Technical | Key establishment / key agreement / key transport, wrapping key / private key, re-encryption / re-wrapping terminology requires precision |
| Risk methodology | Confidentiality lifetime must be explicitly defined and separated from retention period |
| Governance / regulatory | Migration milestones must not be presented as CRQC arrival forecasts; standards, guidance, roadmaps, and regulations must be taxonomically distinguished |

---

## 3. Priority Findings Summary

- **Critical:** 1 (QS01-OBS-003)
- **Very High:** 3 (QS01-OBS-002, 012, 022)
- **High:** 19 (QS01-OBS-001, 005, 007, 009, 010, 011, 013, 014, 016, 017, 019, 020, 023, 024, 025, 026, 027, 028, 029)
- **Medium:** 4 (QS01-OBS-004, 008, 018, 021)
- **Total granular observations:** 27

See `01_Master_Finding_Register.md` for the complete register.

---

## 4. The revised HNDL model

> **HNDL risk exists when data that remains confidential long enough can be
> collected today while its protection depends on cryptographic mechanisms
> that a future CRQC could undermine, and the migration lead time is longer
> than the remaining risk window.**

This reframes QS01 away from "quantum computers will break encryption" toward
a mature, risk-based framing consistent with NIST's current treatment of
high-value, long-lived sensitive data under uncertain CRQC timing.

### Conceptual HNDL Risk Model

    HNDL Exposure =
        Data
      + Confidentiality Lifetime
      + Adversarial Value
      + Cryptographic Dependency
      + Exposure Surface
      + Migration Lead Time
      + Migration Constraints

### Operational HNDL chain

    Asset
      |
      v
    Data
      |
      v
    Confidentiality Lifetime
      |
      v
    Cryptographic Dependency
      |
      v
    Quantum Vulnerability
      |
      v
    Migration Lead Time
      |
      v
    HNDL Exposure
      |
      v
    Impact
      |
      v
    Regulatory / Contractual Context
      |
      v
    Treatment

---

## 5. The two HNDL attack paths

### Path A — In Transit

    TODAY
       |
    Attacker observes
       |
       v
    TLS / VPN traffic
       |
       v
    Classical key establishment
       |
       v
    Ciphertext stored
       |
       |
    FUTURE
       |
       v
    CRQC
       |
       v
    Break vulnerable PK mechanism
       |
       v
    Derive historical session keys
       |
       v
    Decrypt historical traffic

### Path B — At Rest

    TODAY
       |
       v
    Encrypted archive
       |
    +--+--+
    |     |
    v     v
    Ciphertext   Wrapped DEK
    |     |
    +--+--+
       |
    Attacker exfiltrates
       |
       v
    Stores
       |
    FUTURE
       |
       v
    CRQC
       |
       v
    Recover vulnerable private key
       |
       v
    Unwrap DEK
       |
       v
    Decrypt archive

---

## 6. Cross-entry boundaries (QS01 ↔ QS04 ↔ QS05 ↔ QS06 ↔ QS07)

| Topic | QS01 | QS04 | QS05 | QS06 | QS07 |
|---|---|---|---|---|---|
| HNDL risk | Primary | Supporting | Supporting | Supporting | Supporting |
| Crypto inventory | Uses inventory | Primary | Uses inventory | Uses inventory | Uses inventory |
| Crypto agility | Migration need | Discovery input | Primary | Implementation concern | Hardware constraint |
| Hybrid PQC | HNDL mitigation | Inventory | Agility | Primary | Hardware |
| HSM/TPM/root of trust | Risk dependency | Inventory | Agility | Deployment | Primary |
| At-rest archives | Primary | Discovery | Migration | Crypto migration | Key hardware |
| Third-party dependencies | HNDL exposure | Primary inventory | Migration | Hybrid implementation | Hardware/vendor |

### Dependency model

    QS04 -> discover dependencies
    QS01 -> assess HNDL exposure
    QS05 -> enable replacement
    QS06 -> execute migration securely
    QS07 -> address hardware-root constraints

### Framing questions

- **QS01:** What HNDL exposure do you have and why is it urgent?
- **QS04:** Where is your cryptography and what does it depend on?
- **QS05:** Can you change that cryptography without rebuilding the system?
- **QS06:** Are you executing PQC/hybrid migration securely and correctly?
- **QS07:** What are you doing about hardware roots that cannot be easily updated?

---

## 7. Contribution Disposition

### Direct PR
- Terminology corrections
- CRQC/migration timeline correction
- Confidentiality lifetime definition
- Examples rewrite
- Prevention restructuring
- Attack scenarios update
- Reference updates
- Regulatory taxonomy
- QS04/QS07 cross-references

### GitHub Issues (4)
- QS01-OBS-003: CRQC timeline vs migration milestones
- QS01-OBS-002 + 012 + 022: Confidentiality lifetime definition
- QS01-OBS-005 + 007 + 013 + 020 + 021 + 023 + 024: At-rest key hierarchy
- QS01-OBS-025 to 029: Standards / regulatory mapping taxonomy

### Discussion / Research
- Quantitative HNDL risk model
- Re-wrapping vs re-encryption vs key-hierarchy migration patterns
- KMS/HSM migration patterns under PQC
- Financial-services prioritization model

---

## 8. Acceptance Criteria

The QS01 revision is complete when:

- [ ] No migration milestone is described as a CRQC arrival forecast
- [ ] Confidentiality lifetime is explicitly defined
- [ ] Retention and confidentiality lifetime are separated
- [ ] In-transit and at-rest HNDL pathways are distinguished
- [ ] RSA, DH and ECDH terminology is technically precise
- [ ] TLS 1.3 is not described as using RSA key exchange
- [ ] At-rest treatment accounts for key hierarchy
- [ ] "PQC-protected encryption envelope" is clarified
- [ ] Key rotation is not presented as a standalone HNDL mitigation
- [ ] Partial migration / residual classical dependencies are explicit
- [ ] QS04/QS05/QS06/QS07 boundaries are clear
- [ ] NIST SP 800-227 is included
- [ ] DORA RTS Article 6 and Article 7 are included
- [ ] Regulatory scope is explicitly identified
- [ ] Unsupported CRA statements are removed
- [ ] Financial Services material is separated into a sector profile
