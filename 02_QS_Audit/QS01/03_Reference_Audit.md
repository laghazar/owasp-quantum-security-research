# QS01 — Reference Links Audit (FULL)

Audit chain: Claim -> Reference -> Evidence -> Supports claim? -> Scope -> Status -> Keep/Replace/Add

## Current QS01 references (6)

1. NIST FIPS 203
2. NIST IR 8547
3. UK NCSC PQC migration timelines
4. EU Coordinated Implementation Roadmap
5. NSM-10 + OMB M-23-02
6. EU Cyber Resilience Act, Annex I

---

## 1. NIST FIPS 203 — ML-KEM

**Claim in QS01:** "NIST FIPS 203 (ML-KEM): Key-establishment standard for post-quantum migration."

**Assessment:** KEEP — Very strong reference

Final standard, published 13 August 2024. Defines ML-KEM for shared-secret
establishment over a public channel. NIST states that the shared secret can be
used with symmetric cryptographic algorithms for secure communications.

Directly supports QS01's:
- hybrid/PQC TLS discussion
- key-establishment migration
- ML-KEM reference

**Nuance:** FIPS 203 is not a TLS standard. It defines ML-KEM; it does not
specify how to deploy PQC TLS.

**Action:** Add NIST SP 800-227 (final September 2025) — Recommendations for
Key-Encapsulation Mechanisms.

---

## 2. NIST IR 8547

**Claim in QS01:** "NIST IR 8547 (Draft) — Transition to Post-Quantum Cryptography Standards: Transition planning guidance referencing Mosca's inequality."

**Assessment:** KEEP, BUT LABEL CORRECTLY

Initial Public Draft, November 12, 2024. Transition planning document, not a
normative standard. Describes NIST's expected approach for transition from
quantum-vulnerable algorithms to PQC key-establishment/signature schemes.

**Action:** Label as "Initial Public Draft" and categorize as transition
guidance in the mapping taxonomy.

---

## 3. UK NCSC — PQC Migration Timelines

**Claim in QS01:** "Migration timelines calling out long-lived sensitive data as a priority class."

**Assessment:** KEEP — Very strong

NCSC guidance milestones:
- 2028 — discovery, assessment, initial migration plan
- 2031 — highest-priority migration
- 2035 — complete migration

NCSC explicitly states that business/personal sensitive data and critical
communications/systems are priorities. Migration is a multi-year technology
change programme.

These are migration milestones, NOT CRQC arrival predictions.

**Use:** Strong evidence for QS01-OBS-003 correction.

---

## 4. EU Coordinated Implementation Roadmap

**Claim in QS01:** "End-2030 deadline prohibiting standalone quantum-vulnerable PKC for high-risk use cases."

**Assessment:** KEEP, but re-categorize

EU roadmap milestones:
- Member States start transition by end-2026
- High-risk use cases migrate to PQC as soon as possible and no later than
  end-2030

**Categorization:** EU policy / coordinated roadmap — NOT EU regulation.

**Priority:** High.

---

## 5. NSM-10 + OMB M-23-02

**Claim in QS01:** HNDL risk, cryptographic inventory, prioritization.

**Assessment:** KEEP, with scope label

OMB M-23-02 states that U.S. federal agencies must prepare for PQC migration
and explicitly warns that encrypted data can be recorded now and later
decrypted with a future CRQC. M-23-02 requires prioritized cryptographic
inventory for federal agencies and prioritizes migration for CRQC-vulnerable
systems.

Strong support for:
- HNDL is a present planning concern
- inventory
- prioritization
- migration
- high-value / high-impact systems

**Scope limitation:** U.S. federal agencies only. Must not be generalized as
industry-wide regulation.

---

## 6. EU Cyber Resilience Act — Annex I

**Claim in QS01:** "State-of-the-art protection required through the product support period, which for many products extends past 2030."

**Assessment:** KEEP WITH QUALIFICATION

CRA Annex I requires products with digital elements to protect the
confidentiality of stored/transmitted/processed data using state-of-the-art
mechanisms for encryption at rest/in transit. It does NOT explicitly mandate
PQC. It does NOT establish a 2030+ HNDL deadline.

**Action 1:** Remove "many products extend past 2030" — no direct source.

**Action 2:** Qualify as risk-assessment-driven.

**Proposed wording:**
> "EU Cyber Resilience Act Annex I requires products with digital elements to
> protect the confidentiality of stored, transmitted or otherwise processed
> data using state-of-the-art mechanisms; its applicability to PQC should be
> assessed in light of the product's risk assessment, support period,
> applicable standards and evolving state of the art."

---

## 7. NIST SP 800-227 — Add

**Claim:** KEM implementation and secure use guidance.

**Assessment:** ADD — Very strong

Final, 18 September 2025. Directly relevant to QS01-OBS-013 and prevention
controls.

---

## Final reference audit table

| # | Source | Keep? | Evidence | Main use |
|---|---|---|---|---|
| 1 | NIST FIPS 203 | Keep | Very strong | ML-KEM / key establishment |
| 2 | NIST IR 8547 | Keep | Strong, draft | Migration planning |
| 3 | UK NCSC timelines | Keep | Very strong | Migration milestones |
| 4 | EU PQC Roadmap | Keep | Strong | EU migration milestones |
| 5 | NSM-10 + OMB M-23-02 | Keep | Very strong | HNDL + US federal |
| 6 | CRA Annex I | Keep with qualification | Indirect for PQC | State-of-the-art crypto |
| 7 | NIST SP 800-227 | ADD | Very strong | KEM use |
| 8 | DORA RTS Art. 6 | ADD | Very strong | Encryption + key lifecycle |
| 9 | DORA RTS Art. 7 | ADD | Very strong | Key lifecycle |

---

## Reference Architecture — proposed final set

### Primary technical standards
- NIST FIPS 203 — ML-KEM
- NIST SP 800-227 — Recommendations for Key-Encapsulation Mechanisms
- NIST IR 8547 — Transition to Post-Quantum Cryptography Standards
  (Initial Public Draft)

### Migration guidance / roadmaps
- UK NCSC — Timelines for Migration to PQC
- EU Coordinated Implementation Roadmap for the Transition to PQC

### U.S. government policy
- U.S. NSM-10
- OMB M-23-02
- NSA CNSA 2.0

### EU regulatory mapping
- NIS2 — Article 21(2)(h)
- DORA — Article 9
- DORA ICT Risk Management RTS — Article 6
- DORA ICT Risk Management RTS — Article 7
- Cyber Resilience Act — Annex I
