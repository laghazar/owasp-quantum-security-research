# Proposal - Unverifiable Quantum Execution and Result Assurance

## 1. Proposal Statement

Adopt the "Unverifiable Quantum Execution and Result Assurance"
candidate as a new active entry on the platform surface. The entry
addresses execution assurance and result appraisal when the tenant-
side toolchain and co-tenant isolation boundaries are otherwise
intact.

## 2. Problem Summary

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

## 3. Rationale

Novel problem. No active entry covers execution assurance or result
appraisal. The candidate explicitly delineates its scope from QS08,
QS09, and QS10:

- QS08 addresses harm from co-tenants
- QS09 addresses compromise of toolchain components
- QS10 addresses confidentiality leakage through the control plane
- This candidate addresses what evidence permits independent appraisal
  of underlying execution and returned result

Strong primary anchor. Upadhyay and Ghosh (Frontiers in Computer
Science 2024) models and experimentally evaluates adversarial
tampering by less-trusted quantum hardware vendors, and proposes a
runtime detection heuristic (shot-splitting).

Financial-services relevance. Regulated entities require post-hoc
computation evidence (DORA Articles 28-30 supervisory context). The
candidate aligns directly with this need.

Exceptional candidate quality. The candidate submission itself
demonstrates methodological care: proposal status, surface, maturity
explicitly stated; scope statement; Standards and Regulatory Mapping
section with correct DORA Articles 28-30 scope.

## 4. Boundary Statement

The candidate is self-delineated from QS08, QS09, and QS10:

- QS08: co-tenant isolation; harm from co-tenants
- QS09: toolchain integrity; compromise of transformation pipeline
- QS10: confidentiality; physical side-channel leakage
- This candidate: execution assurance; independent appraisal of
  underlying execution and returned result

Controls for integrity-verifiable linkage across the submission-to-
dispatch-to-result lineage establish traceability within an applicable
trust boundary. This entry addresses what evidence permits independent
appraisal of the underlying execution and the returned result.

## 5. Evidence Base

### Strong anchors

- Upadhyay and Ghosh (Frontiers in Computer Science, 2024) - primary
  anchor; models and experimentally evaluates adversarial tampering
  by less-trusted quantum hardware vendors; proposes run-adaptive
  shot-splitting heuristic (arXiv:2305.01826)
- Upadhyay and Ghosh (HASP 2022) - models and simulates adversarial
  tampering of input parameters and measurement outcomes on QAOA
  workloads (arXiv:2209.11872)
- Xu, Erata, Szefer (IEEE QCE 2024) - fault injection against quantum
  computers including insider attacks
- IETF RFC 9334 (RATS) - generic attestation architecture
- EU DORA Articles 28-30 - scoped precisely; risk-based contracting
  and audit rights

### Evidence status

- Strong peer-reviewed anchor (Upadhyay and Ghosh 2024 with
  experimental evaluation)
- RFC 9334 well-established
- DORA Articles 28-30 citation is precise and scoped
- No public vendor incident claimed (candidate is explicit)

## 6. Proposed Entry Structure

### Common Examples of Vulnerability

- Business, engineering, or safety decisions taken on quantum results
  never validated against a classical reference, known-answer test, or
  second independent provider
- Providers supplying no attestation of which physical device,
  calibration state, or queue path executed a submitted job
- Brokered or resold QPU access where the tenant contracts with an
  intermediary
- Workloads for which independent validation is not economically
  practical at relevant scale
- Absence of provider-side job-integrity log that the tenant can
  obtain and retain
- Service claims accepted without verification (device grade, shot
  count, queue priority)
- Results retained without recording provider, device, calibration
  snapshot, and toolchain version
- Provider-generated execution records treated as independent proof
  of physical execution

### How to Prevent

- Embed known-answer or trap circuits alongside real jobs
- For high-value workloads, split shots across two or more providers
- Validate against classical simulation, reduced-size instance, or
  cheap solution-quality check
- Require providers to publish and contractually commit to execution
  evidence (device identity, calibration state, auditable job log)
- Record provider, device, calibration snapshot, and toolchain
  version alongside every retained result
- Identify producer of execution record and trust boundary within
  which its claims are appraised
- Include result-assurance and attestation requirements in
  procurement and third-party risk assessment
- Define evidence requirements in advance for regulated-process
  integration

### Attack Scenarios

- Suboptimal-result tampering on a less-trusted provider; tenant on a
  single provider has no comparison point
- Brokered access with one biased vendor in the pool; broker provides
  no per-job device attestation, incident cannot be scoped
- Regulated entity asked to evidence computation during supervisory
  review; no execution record exists beyond provider completion status

## 7. Cross-Entry Relationships

| Related entry | Relationship |
|---|---|
| QS08 QPU Tenant Isolation | Isolation vs execution assurance; candidate delineated |
| QS09 Toolchain and Compiler Compromise | Integrity chain vs execution assurance; candidate delineated |
| QS10 Side-Channel and Control-Plane | Confidentiality vs execution assurance; candidate delineated |
| QS04 Cryptographic Discovery and Inventory | Provenance inventory cross-reference |

Shared anchor with QS09: RFC 9334 (RATS). Both QS09 and this candidate
use the provider-assertion vs independent-proof distinction.

## 8. Open Questions for OWASP Sprint

### Q1

Should this entry be a fourth platform-surface layer (execution
assurance) or does it sit inside QS08's tenancy boundary?

### Q2

Where does "tampering by less-trusted providers" end and "brokered or
resold QPU access" begin? The candidate covers both but they have
different trust models.

### Q3

How does this candidate interact with the QS09 integrity chain
(submitted -> transformed -> dispatch -> result)? Both address result
assurance but from different angles.

### Q4

How should the boundary with QS09's RFC 9334 usage be expressed?

## 9. Recommendation

**STRONG ADOPT.**

Rationale:

- Novel problem (execution assurance and result appraisal)
- Strong primary anchor (Upadhyay and Ghosh 2024, experimental)
- Explicit scope delineation from QS08, QS09, QS10
- Financial-services relevance (regulated entities require post-hoc
  computation evidence)
- Candidate submission itself demonstrates exceptional methodological
  care

Suggested refinements if adopted:

- Clarify placement within platform surface (fourth layer? inside
  QS08?)
- Strengthen boundary with QS09's integrity chain
- Cross-reference QS04 (provenance inventory)
- Retain RFC 9334 and DORA Article 28-30 citations as currently
  scoped

Note: The candidate submission demonstrates higher methodological
rigour than some active entries. The proposal status statement,
scope statement, and Standards and Regulatory Mapping section could
serve as models for other entries.

---

**Proposal status:** Ready for OWASP Sprint review
**Proposed by:** <Larisa Ghazaryan>
**Date:** 2026-10-04
**Submission:** Internal research draft (not yet submitted)