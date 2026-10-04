# QSxx Candidate - Misdirected Quantum Countermeasures - Candidate Review

## 1. Scope & Method

Reviewed:

- Evidence statement
- Description
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenarios
- Reference Links
- Standards and Regulatory Mapping

This is a rapid candidate review, not a full deep-dive.

---

## 2. Candidate Summary

### Problem definition

An organisation can spend budget and calendar on a "quantum-branded"
purchase that replaces none of its quantum-vulnerable algorithms,
record the programme as progressing, and arrive at a regulatory
deadline with the same RSA and elliptic-curve estate it started with.

Four substitutions:

1. QKD deployed in place of PQC (national authorities - NCSC, NSA -
   have published explicit positions against this)
2. QRNG confused with PQC migration (entropy quality is not the
   quantum threat)
3. Proprietary or non-standardised "post-quantum" algorithms (no
   public cryptanalytic record)
4. Unvalidated vendor claims ("quantum-safe" on a datasheet)

### Intended scope

The candidate explicitly positions itself as the only entry in the
list describing an organisation that believes it has migrated. Every
other entry describes an organisation that has not yet migrated.

### Primary actor

- Organisation that believes it has migrated but has not
- Vendor selling misdirected products
- Procurement function without a way to detect misdirection

### Main security consequence

A migration programme that reports completion against work that
changed no algorithm is a reporting failure as much as a technical
one. The error surfaces at the deadline.

### Distinctive quantum-specific element

Strong. The failure mode is specific to the quantum transition:

- The quantum-branded market
- The QKD substitution problem
- The confusion between QRNG, PQC, and quantum-safe branding
- The mismatch between spend and algorithm retirement

---

## 3. Overlap Analysis

### Potential overlap with active entries

- QS04 (inventory as the control that detects misdirected spend)
- QS05 (procurement requirements for agility)
- The candidate explicitly references both QS04 and QS05 in its
  Standards and Regulatory Mapping section

### Potentially covered by which active entry

- QS04 provides the inventory control that can detect misdirected
  spend
- QS05 provides the procurement framework that could prevent it
- Neither entry currently owns the misdirection problem itself

---

## 4. Evidence Anchor

### Cited sources

- UK NCSC Quantum security technologies white paper (verified -
  QKD position)
- NSA Quantum Key Distribution and Quantum Cryptography position
  (verified - NSA does not support QKD for NSS)
- NIST FIPS 203, 204, 205 (verified - final standards)
- NIST CMVP (verified)
- NIST PQC Standardization project (verified)

### Verification status

- Both national-authority QKD positions verified
- NSA URL returns 403 to automated requests but resolves in browser
  (already noted in QS03 and QS07 citations)
- Strong primary-source evidence base

### Missing evidence

- No industry survey on how often the substitution occurs in practice
- The candidate acknowledges this: "no claim about how often it
  occurs in practice"

---

## 5. Open Questions

### Q1

Is the "believes it has migrated" framing strong enough to justify a
standalone entry, or is it a consequence of QS04 / QS05 failures?

### Q2

Should the QKD-specific content be developed further, given that NCSC
and NSA have explicit positions? QKD is a distinct and topical
subject.

### Q3

How does the "measure migration in quantum-vulnerable algorithms
retired" recommendation interact with the cMTTR metric discussed in
QS05 and NIST CSWP 39upd1?

### Q4

If adopted, is this a migration-surface entry or a cross-cutting
governance entry?

---

## 6. Candidate Recommendation

**STRONG ADOPT CANDIDATE.**

Rationale:

- Novel conceptual position (the only entry describing an organisation
  that believes it has migrated)
- Strong primary-source anchors (NCSC, NSA positions are explicit)
- The QKD substitution problem is topical and directly addressed by
  national authorities
- Financial-services relevance is strong (procurement governance in
  a regulated context)

Suggested refinements if adopted:

- Clarify placement (migration surface vs cross-cutting)
- Consider whether the QKD-specific content warrants an expanded
  section
- Cross-reference QS04 (inventory detection) and QS05 (procurement
  prevention) explicitly in both directions
- Consider the interaction with QS05 cMTTR metric (algorithm-retired
  as measurement unit vs time-to-rotate)

Do not recommend a full deep dive on this candidate at the rapid-audit
stage. The candidate is well-developed.

---

**Reviewed:** 2026-10-04
**Candidate status:** Pre-Sprint 0 submission
**Candidate surface:** Migration / cross-cutting
**Recommendation:** Strong adopt candidate