# Proposal - Misdirected Quantum Countermeasures

## 1. Proposal Statement

Adopt the "Misdirected Quantum Countermeasures" candidate as a new
active entry. Positioned as either migration surface or cross-cutting
governance entry (placement decision for OWASP Sprint).

## 2. Problem Summary

Every other entry in the OWASP Quantum Security Top 10 describes an
organisation that has not yet migrated. This one describes an
organisation that believes it has. The quantum transition has produced
a market of products marketed as "quantum-safe", "quantum-proof", or
"quantum-resistant", and the terms carry no defined meaning. An
organisation can spend budget and calendar on a quantum-branded
purchase that replaces none of its quantum-vulnerable algorithms,
record the programme as progressing, and arrive at a regulatory
deadline with the same RSA and elliptic-curve estate it started with.

Four substitutions account for most of this:

1. QKD deployed in place of PQC
2. QRNG confused with PQC migration
3. Proprietary or non-standardised "post-quantum" algorithms
4. Unvalidated vendor claims

## 3. Rationale

Proposed distinct conceptual position. The candidate is the only entry describing
an organisation that believes it has migrated. This is a distinct
failure mode that no active entry covers:

- QS04 (inventory) can detect misdirected spend, but does not own the
  misdirection problem
- QS05 (procurement) can prevent misdirected spend through procurement
  requirements, but does not own the failure mode
- No entry describes the substitution problem itself

Strong primary-source anchors. Both UK NCSC and US NSA have published
explicit positions against QKD substitution for PQC. This is
documented at the highest level of national technical authority.

Topical QKD substitution problem. As QKD marketing increases, the
substitution risk becomes more acute.

Financial-services relevance. Procurement governance in a regulated
context is directly relevant. A misdirected programme that reaches
the DORA or EU roadmap deadline without having migrated is a
supervisory concern.

## 4. Boundary Statement

The candidate references QS04 (inventory as control for detection)
and QS05 (procurement requirements for prevention). The candidate does
not duplicate these entries; it describes a failure mode that QS04
and QS05 controls would detect or prevent.

Boundary: QS04 and QS05 own the control surfaces; this candidate owns
the failure mode.

## 5. Evidence Base

### Strong anchors

- UK NCSC - Quantum security technologies white paper. States NCSC
  will not support QKD for government or military applications; QKD
  does not provide authentication; PQC is the best mitigation.
- NSA - Quantum Key Distribution and Quantum Cryptography. States NSA
  does not support QKD for National Security Systems and does not
  anticipate certifying QKD products.
- NIST FIPS 203, 204, 205 - The standardized algorithms a
  "quantum-safe" claim should resolve to.
- NIST CMVP - Independent validation records against which vendor
  claims can be checked.
- NIST PQC Standardization project - The public cryptanalytic process
  that non-standardised algorithms have not undergone.

### Evidence status

- Both national-authority QKD positions verified
- NSA URL returns 403 to automated requests but resolves in browser
- Strong primary-source evidence base
- No industry survey on how often the substitution occurs (candidate
  acknowledges this)

## 6. Proposed Entry Structure

### Common Examples of Vulnerability

- QKD links procured or deployed as substitute for PQC migration
  rather than complement, particularly within scope of published NCSC
  or NSA positions
- QKD deployments whose endpoint authentication rests on classical
  signatures
- QRNG treated as mitigation for quantum threat to public-key
  cryptography
- "Quantum-safe" / "quantum-proof" / "quantum-resistant" products
  accepted without identifying which standardized algorithm is
  implemented
- Proprietary or non-standardised algorithms marketed as post-quantum
- Migration programmes reporting progress in spend or projects
  delivered rather than quantum-vulnerable algorithms retired

### How to Prevent

- Require vendors to name specific standardized algorithm and
  parameter set (ML-KEM FIPS 203, ML-DSA FIPS 204, SLH-DSA FIPS 205)
- Require validation evidence (CMVP or CAVP certificate number)
- Assess QKD proposals against published NCSC and NSA positions before
  procurement
- Separate entropy from algorithm substitution in planning
- Measure migration in quantum-vulnerable algorithms retired and
  systems re-anchored
- Route quantum-branded procurement through the cryptographic
  inventory (QS04)

### Attack Scenarios

- QKD deployment with classical endpoint authentication: adversary
  ignores QKD channel, harvests classical traffic either side, and
  after CRQC forges certificates authenticating the QKD endpoints.
- Non-standardised "quantum-resistant" product: later found weak
  against a classical attack (as several NIST submissions were during
  evaluation). Organisation left with neither post-quantum nor
  classical assurance.

## 7. Cross-Entry Relationships

| Related entry | Relationship |
|---|---|
| QS04 Cryptographic Discovery and Inventory | Inventory as the control that detects misdirected spend |
| QS05 Crypto-Agility Failures | Procurement requirements for agility |
| QS01 HNDL Exposure | Downstream effect of a misdirected programme reaching deadline |
| QS06 Migration and Hybrid | Adjacent (both concern migration planning) |

## 8. Open Questions for OWASP Sprint

### Q1

Is the "believes it has migrated" framing strong enough to justify a
standalone entry, or is it a consequence of QS04 / QS05 failures?

### Q2

Should the QKD-specific content be developed further, given that NCSC
and NSA have explicit positions? QKD is a distinct and topical
subject.

### Q3

How does the "measure migration in quantum-vulnerable algorithms
retired" recommendation interact with cMTTR (QS05)?

### Q4

If adopted, is this a migration-surface entry or a cross-cutting
governance entry?

## 9. Recommendation

**STRONG ADOPT.**

Rationale:

- Proposed distinct conceptual position (only entry describing an organisation
  that believes it has migrated)
- Strong primary-source anchors (NCSC, NSA positions are explicit)
- Topical QKD substitution problem
- Financial-services relevance (procurement governance)

Suggested refinements if adopted:

- Clarify placement (migration surface vs cross-cutting)
- Consider expanded QKD-specific section
- Cross-reference QS04 and QS05 explicitly in both directions
- Consider interaction with cMTTR metric

---

**Proposal status:** Ready for OWASP Sprint review
**Proposed by:** <Larisa Ghazaryan>
**Date:** 2026-10-04
**Submission:** Internal research draft (not yet submitted)