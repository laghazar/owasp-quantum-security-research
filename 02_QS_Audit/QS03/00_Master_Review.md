# QS03 — Master Review (Unified)

**Entry:** QS03 — Vulnerable Signatures and Code-Signing
**Review date:** 2026-10-04
**OWASP project:** quantum-security-project/quantum-top-10
**Status:** Review Complete (evidence validation pending) — unified finding register finalized
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
| Conceptual | Signature break ? instant invalidation of historical signatures; trust-chain migration model rather than leaf-key replacement |
| Technical | DSA verification-only status; RSA vs ECDSA vs EdDSA underlying problems; TPM 2026 PQC support; stateful HBS state management |
| Risk methodology | Signature assurance lifetime must be defined and separated from retention |
| Governance / regulatory | Standards/Regulatory Mapping has unresolved TODO; CNSA 2.0 scope precision; NCSC ML-DSA-65 verification; CRA qualification |
| Reference landscape | Modern IETF RFCs (9881, 9882, 9909, 9964), TCG TPM 2.0 v185, UEFI PQC work must be added |

---

## 3. Priority Findings Summary

- **Critical:** 2 (QS03-OBS-001, QS03-OBS-039)
- **Very High:** 11
- **High:** 25
- **Medium:** 2
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

## 7. Cross-entry boundaries (QS03 ? QS01 ? QS04 ? QS05 ? QS06 ? QS07)

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
