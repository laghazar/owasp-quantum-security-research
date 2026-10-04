# Current OWASP Main Gap Analysis

## 1. Purpose

This document compares the repository's contribution candidates against
the current OWASP Quantum Security Project `main` branch content. Its
purpose is to identify non-duplicative contributions and to avoid
submitting material that is already present.

This is an internal research artifact. It does not modify OWASP content.

## 2. Method

For each candidate entry, the analysis compares:

- Findings from this repository's review
- Current OWASP `main` content for the same entry
- The delta between them

The delta is classified as:

- **Duplicate** - the candidate finding is already present at
  equivalent depth
- **Deepening** - the candidate finding extends an existing element
  with formalization or operationalization
- **Gap** - the candidate finding addresses something not present in
  current main

Only Deepening and Gap findings are viable for submission.

## 3. QS09 - Toolchain and Compiler Compromise

### Current OWASP main state

The current OWASP QS09 entry:

- Documents three attack classes (compiler, config, pulse)
- Notes an integrity continuity concern: a stable user-facing job
  identifier alone does not establish end-to-end integrity linkage
- Includes prevention items for integrity-protected provenance,
  dispatch-boundary verification, and authenticated result records
- Has Scenario 3 describing cache substitution with preserved
  identifier
- Cites SLSA and RFC 9334 (RATS) as references
- Cites DORA Articles 28-44
- Mentions provider assertion vs independent proof distinction

### Repository findings

The QS09 deep dive in this repository includes:

1. Formal four-artifact model (submitted, transformed, dispatched,
   result) with explicit bindings and failure modes
2. Five-category provider evidence classification (unverifiable
   assertion, signed assertion, bound assertion, hardware-attested
   claim, independently verifiable claim)
3. SLSA level mapping for quantum toolchain artifacts
4. RFC 9334 RATS role mapping
5. DORA Article 30 evidence package (7 contractual clause categories,
   16-question vendor assessment)
6. Supervisory reporting framework
7. Proposed revised text formalizing the integrity chain as a fourth
   concern

### Delta analysis

| # | Repository finding | Current OWASP main | Classification | Submission value |
|---|---|---|---|---|
| 1 | Formal four-artifact model | Concern mentioned, not formalized | Deepening | High - structural |
| 2 | Provider evidence classification | Distinction mentioned, no taxonomy | Deepening | High - methodological |
| 3 | SLSA level mapping | SLSA cited as reference | Deepening | Medium - operationalization |
| 4 | RATS role mapping | RFC 9334 cited as reference | Deepening | Medium - operationalization |
| 5 | DORA Article 30 evidence package | DORA cited, no package | Deepening | High - regulated-use |
| 6 | Vendor assessment questionnaire | Not present | Gap | High - operational |
| 7 | Supervisory reporting framework | Not present | Gap | Medium - regulated-use |
| 8 | Proposed revised text | Not applicable | Deepening | High - structural |

### Verdict

**QS09 submission viable.** The repository's contribution is
non-duplicative. It formalizes and operationalizes concepts the
current entry mentions at a high level. This is a "deepening"
contribution, not a "novel concept" contribution.

The strongest elements are:

- The formal four-artifact model (structural contribution)
- The provider evidence classification (methodological contribution)
- The DORA Article 30 evidence package (regulated-use operationalization)

### Recommended submission form

- A GitHub Issue on the OWASP quantum-security-project repository
  referencing the integrity chain model and the DORA evidence package
- Optionally a focused PR proposing revisions to the QS09 entry text
  formalizing the integrity chain as a fourth concern

## 4. QS01 - HNDL Exposure

### Status

Awaiting current OWASP `main` content comparison. The repository's
QS01 findings focus on:

- CRQC timeline vs migration milestones correction
- Confidentiality lifetime definition
- In-transit vs at-rest distinction
- At-rest key hierarchy treatment
- Regulatory mapping taxonomy

### Preliminary assessment

Several QS01 findings (timeline correction, confidentiality lifetime)
appear already present in current main based on external review
feedback. A line-by-line comparison is required before submission.

### Verdict

**Deferred.** Compare against current main before deciding.

## 5. QS03 - Vulnerable Signatures and Code-Signing

### Status

External review indicates that current OWASP QS03 already contains:

- Mosca-style signature lifetime reasoning
- Re-establishment failure concept
- Re-signing vs re-issuance distinction
- Trust-chain migration model
- Compromised anchor to new credential problem

### Repository findings

The repository's QS03 review proposes:

- Signature assurance lifetime as a distinct dimension
- Trust-chain migration model
- Re-establishment failure (three sub-modes)
- Reference modernization (RFC 9881, 9882, 9909, 9964, TCG v185, UEFI PQC)

### Preliminary assessment

Most repository QS03 findings overlap with current main. The reference
modernization finding may still be a Gap if current references lag.

### Verdict

**High duplicate risk.** Do not submit QS03 as-is. Reference
modernization may be the only viable element.

## 6. QS04 - Cryptographic Discovery and Inventory Gaps

### Status

Awaiting current OWASP `main` content comparison.

### Preliminary assessment

The repository's QS04 findings focus on:

- Discovery vs inventory vs CBOM vs SBOM distinction
- Dependency mapping promotion to core
- False assurance risk
- Coverage / evidence / freshness metrics
- CycloneDX v1.7 update
- CBOM representation and SPDX precision

CycloneDX v1.7 and SPDX precision may be non-duplicative if current
main still references v1.6.

### Verdict

**Deferred.** Compare against current main before deciding.

## 7. Priority Ranking for Submission

Based on current assessment:

| Priority | Candidate | Rationale |
|---|---|---|
| **#1** | QS09 integrity chain | Deepening (not duplicate); non-duplicative formalization; strong anchors |
| #2 | QS04 CycloneDX v1.7 and SPDX precision | Potentially non-duplicative; verify against current main |
| #3 | QS03 reference modernization | Only if current references lag; verify |
| Deferred | QS01, QS03 main findings | High duplicate risk per external review |
| Deferred | QSxx proposals | Candidate adoption decision pending |

## 8. Recommended Next Steps

1. **Immediate.** Prepare QS09 Issue and PR draft referencing the
   integrity chain model and DORA evidence package.
2. **Before submission.** Fetch current OWASP QS09 from `main` and
   confirm the delta analysis in section 3.
3. **Optional.** Fetch current OWASP QS04 to assess CycloneDX reference
   status.
4. **Deferred.** QS01, QS03 submissions until line-by-line comparison
   is complete.

## 9. Limitations

This Gap Analysis is based on:

- External review feedback describing current OWASP `main`
- The repository's own review artifacts
- The current OWASP QS09 content pasted into the research workspace

It is not based on a full line-by-line fetch of every entry from
current `main`. A complete analysis requires fetching each entry
before final submission.

## 10. Status

**Analysis status:** Preliminary - QS09 assessed, others deferred
**Submission status:** Not submitted
**Next action:** Prepare QS09 Issue draft based on this analysis

---

**Reviewed:** 2026-10-04
**Scope:** Gap analysis of contribution candidates against current
OWASP main
**Depends on:** QS09 deep dive, external review feedback, current OWASP
QS09 content