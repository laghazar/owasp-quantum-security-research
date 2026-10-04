# QSxx Candidate - Unverifiable Quantum Execution and Result Assurance - Candidate Review

## 1. Scope & Method

Reviewed:

- Proposal status
- Description
- Scope statement
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenarios
- Reference Links
- Standards and Regulatory Mapping

This is a rapid candidate review, not a full deep-dive.

---

## 2. Candidate Summary

### Problem definition

A quantum job submitted to a cloud QPU returns a distribution of
measurement outcomes. The tenant generally receives no evidence,
independent of the provider, about what physically executed or under
what conditions. Quantum results are probabilistic, so a tampered,
degraded, or misrouted execution can return a plausible-looking
distribution that is difficult to distinguish from ordinary NISQ
noise.

The difficulty is sharpest for the workloads with the strongest
commercial case for quantum - optimisation, simulation, materials,
finance.

### Intended scope

The candidate explicitly delineates its scope from QS08, QS09, and
QS10:

- QS08 addresses harm arising from co-tenants, including fidelity
  degradation
- QS09 addresses compromise of toolchain components
- QS10 addresses confidentiality leakage through the control plane
- This candidate addresses what evidence permits independent appraisal
  of the underlying execution and the returned result

### Primary actor

- Tenant on a cloud QPU
- Less-trusted or brokered provider
- Regulated entity requiring post-hoc computation evidence

### Main security consequence

Business, engineering, or safety decisions taken on quantum results
that were never validated against a classical reference, a
known-answer test, or a second independent provider.

### Distinctive quantum-specific element

Strong. The failure mode is specific to quantum cloud computing:

- Probabilistic results hide tampering
- Provider assertion vs independent evidence
- Brokered or resold QPU access
- Calibration state dependency

---

## 3. Overlap Analysis

### Potential overlap with active entries

- QS08 (co-tenant isolation): explicitly delineated
- QS09 (toolchain integrity): explicitly delineated
- QS10 (physical side-channels): explicitly delineated
- QS04 (result provenance inventory)
- RFC 9334 (RATS) is a shared reference with QS09

### Potentially covered by which active entry

- No single active entry covers execution assurance and result
  appraisal
- QS09's integrity chain (submitted-to-dispatch-to-result) is the
  closest, but QS09 addresses toolchain integrity, not independent
  appraisal of physical execution
- RFC 9334 (RATS) provides the generic architecture but is not
  quantum-specific

---

## 4. Evidence Anchor

### Cited sources

- Upadhyay and Ghosh (Frontiers in Computer Science, 2024) - primary
  anchor, adversarial tampering model + runtime shot-splitting
  heuristic
- Upadhyay and Ghosh (HASP 2022) - adversarial tampering of QAOA
  workloads
- Xu, Erata, Szefer (IEEE QCE 2024) - fault injection against quantum
  computers
- RFC 9334 (RATS) - generic attestation architecture
- DORA Articles 28-30 - scoped precisely

### Verification status

- Strong peer-reviewed anchor (Upadhyay and Ghosh is a
  2024 paper with experimental evaluation)
- RFC 9334 well-established
- DORA Articles 28-30 citation is precise and scoped

### Missing evidence

- No public vendor incident is claimed (the candidate is explicit
  about this)
- No formal standard for QPU execution attestation

---

## 5. Open Questions

### Q1

The candidate and QS09 both reference RFC 9334 (RATS) and both discuss
the provider-assertion vs independent-proof distinction. Is the
boundary between QS09 and this candidate strong enough, or do the two
entries overlap on this point?

### Q2

Should this entry be a fourth platform-surface layer (execution
assurance), or does it sit inside QS08's tenancy boundary?

### Q3

Where does "tampering by less-trusted providers" end and "brokered or
resold QPU access" begin? The candidate covers both but they have
different trust models.

### Q4

How does this candidate interact with the QS09 integrity chain
(submitted -> transformed -> dispatch -> result)? Both address result
assurance but from different angles.

---

## 6. Candidate Recommendation

**STRONG ADOPT CANDIDATE.**

Rationale:

- Novel problem (execution assurance and result appraisal)
- Strong primary anchor (Upadhyay and Ghosh, peer-reviewed with
  experimental evaluation)
- Explicit scope statement delineating from QS08, QS09, QS10
- Financial-services relevance is strong (regulated entities require
  post-hoc computation evidence)
- The candidate itself is exceptionally well-written with
  methodological care (proposal status, surface, maturity explicitly
  stated)

Suggested refinements if adopted:

- Clarify placement within the platform surface (fourth layer?
  inside QS08?)
- Strengthen the boundary with QS09's integrity chain (both address
  result assurance)
- Consider cross-referencing QS04 (provenance inventory)
- The candidate already includes RFC 9334 and DORA Article 28-30 with
  correct scope

Note: The candidate submission itself demonstrates a higher level of
care than some active entries. The proposal status statement
("Demonstrated under the project's proof-of-concept convention"),
scope statement, and Standards and Regulatory Mapping section are
models for how other entries could be structured.

Do not recommend a full deep dive on this candidate at the rapid-audit
stage. The candidate is well-developed.

---

**Reviewed:** 2026-10-04
**Candidate status:** Pre-Sprint 0 submission
**Candidate surface:** Platform
**Recommendation:** Strong adopt candidate