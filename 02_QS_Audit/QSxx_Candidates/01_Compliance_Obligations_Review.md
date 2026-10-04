# QSxx Candidate - Compliance Obligations - Candidate Review

## 1. Scope & Method

Reviewed:

- Description
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenario
- Reference Links

This is a rapid candidate review, not a full deep-dive. Purpose is scope
and overlap assessment against active entries, not a comprehensive
finding register.

---

## 2. Candidate Summary

### Problem definition

Regulatory, legislative, and standards requirements mandate migration
to quantum-resistant cryptography. Organisations must meet such
requirements regardless of whether a CRQC that can break classical
crypto schemes actually exists.

### Intended scope

Compliance-driven migration obligations. Distinct from threat-driven
migration in that the driver is legal/contractual requirement, not
observed adversary behaviour.

### Primary actor

Regulated organisation subject to mandatory or contractual PQC
migration requirements.

### Main security consequence

Contractual or regulatory breach due to deferred migration. Also:
third-party contract breach (customer's clients force their
counterparties to comply).

### Distinctive quantum-specific element

Minimal. The compliance-obligation framing is not quantum-specific.
Any regulatory transition (GDPR, PCI DSS 4.0, DORA RTS) has the same
structural form: a mandated change that must be met regardless of the
underlying threat materialising.

---

## 3. Overlap Analysis

### Potential overlap with active entries

- Every active entry (QS01, QS03-QS10) already includes a Standards and
  Regulatory Mapping section
- Every entry already cites NSM-10, NIST IR 8547, NCSC timelines, EU
  roadmap, or similar compliance anchors as motivation
- The concept of "compliance drives migration" is already embedded in
  the framing of every entry

### Potentially covered by which active entry

- No single active entry owns this, but every entry touches on it
- If a landscape-wide "regulatory framework" section is created (as
  the Standards and Regulatory Mapping TODO resolution suggests), the
  Compliance Obligations candidate may be subsumed into it

---

## 4. Evidence Anchor

### Cited sources

- NSM-10 (verified - US federal policy; scope = US federal entities)
- NIST IR 8547 (verified - Initial Public Draft as of 2024-11-12)

### Verification status

- NSM-10 scope: US federal entities only, not general industry
- NIST IR 8547 status: Initial Public Draft, not final standard
- Both are already cited in QS01 and QS04

### Missing evidence

- No EU regulatory anchor (NIS2, DORA, CRA not cited)
- No sector-specific regulatory anchor (financial services,
  healthcare, telecom)
- No evidence about how often contractual/insurance compliance
  actually drives PQC migration

---

## 5. Open Questions

### Q1

Is "compliance obligation" a distinct risk, or a driver for other
risks (technical migration, inventory, agility)?

### Q2

Does the entry add anything beyond the regulatory mapping already
present in every active entry?

### Q3

If adopted, would this entry duplicate or subsume the Standards and
Regulatory Mapping sections of QS01-QS10?

### Q4

The candidate is noticeably shorter than other active entries (2
scenarios vs 4-7 in the other platform-surface entries). Is this a
signal that the entry needs development, or that the concept is
inherently thin?

---

## 6. Candidate Recommendation

**DO NOT ADOPT AS STANDALONE ENTRY in current form.**

Rationale:

- The compliance-obligation framing is not quantum-specific
- Every active entry already covers regulatory motivation
- The candidate content is thin (1 scenario, 2 prevention items)
- Risk of duplication with future landscape-wide regulatory framework

Alternative options:

- **Merge into landscape-wide regulatory framework.** If a
  "Regulatory Mapping" or "Standards and Regulatory Context" section is
  developed landscape-wide (which the eight confirmed Standards and
  Regulatory Mapping TODOs suggest), this candidate could anchor it.
- **Defer pending Sprint decision.** The OWASP Sprint process may decide
  whether a regulatory-framework entry belongs in the top 10.
- **Reject.** If the landscape-wide framework is deemed sufficient, the
  candidate can be retired.

Do not recommend a deep dive on this candidate.

---

**Reviewed:** 2026-10-04
**Candidate status:** Pre-Sprint 0 submission
**Candidate surface:** Migration (if adopted; but potentially
cross-cutting)
**Recommendation:** Do not adopt as standalone; consider merge with
landscape-wide regulatory framework