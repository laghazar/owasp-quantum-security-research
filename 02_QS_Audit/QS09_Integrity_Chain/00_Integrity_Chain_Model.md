# QS09 Integrity Chain Model

## 1. Purpose

This document formalizes the submitted-to-dispatch-to-result integrity
chain introduced in the QS09 rapid audit (QS09-OBS-002). It provides
the model that underpins the candidate contribution identified in
`02_QS_Audit/Deep_Dive_Prioritization.md` (Tier 1).

The integrity chain is not a deployed quantum-platform standard. It is
an internal framework for reasoning about the specific failure mode
QS09 identifies: a stable user-facing job identifier alone does not
establish that the submitted circuit and parameters remain
integrity-linked to the artifact actually dispatched and the result
record actually returned.

## 2. Problem Statement

In current quantum cloud platforms, the tenant submits a job and later
receives a result. Between those two events, the following
transformations occur:

    Tenant submits circuit + parameters
       ->
    Toolchain (compiler, transpiler, scheduler) transforms the input
       ->
    Platform dispatches a specific artifact to a specific backend
       ->
    Backend executes and produces a result
       ->
    Platform returns a result record to the tenant

The tenant's evidence of what occurred is typically limited to:

- The user-facing job identifier
- The result distribution

A stable job identifier alone does not bind:

- The submitted circuit and parameters
- The security-relevant transformed artifact
- The toolchain configuration that produced it
- The dispatch context (backend, topology, calibration state)
- The returned result record

Any of these can be substituted, omitted, or mismatched without the
tenant detecting it. The QS09 rapid audit (QS09-OBS-002) identified
this as a distinct contribution candidate.

## 3. Four-Artifact Model

The integrity chain spans four artifacts:

### Artifact A - Submitted circuit and parameters

What the tenant actually submitted: the circuit, its parameters, and
any hardcoded constants. A is the tenant's authoritative input.

### Artifact B - Security-relevant transformed artifact

The output of the toolchain (transpiler, optimiser, scheduler) that is
security-relevant to the outcome. B is what the toolchain produced
from A. Its identity depends on:

- The exact toolchain components (compiler, transpiler, scheduler)
- Their versions and configurations
- The resolved dependencies
- Any platform-specific transformation parameters

### Artifact C - Dispatch artifact and platform context

What was actually dispatched to a specific backend. C includes:

- The exact artifact (which may equal B or differ from it)
- The selected backend
- The topology
- The calibration state at execution time
- The execution-context identifiers

### Artifact D - Returned result record

What the tenant received. D includes:

- The result distribution or output
- The provider-reported metadata
- The job identifier
- Any execution evidence the provider chooses to supply

## 4. Required Bindings

For the integrity chain to be meaningful, the following bindings must
be established and verifiable:

| Binding | Establishes | Owner |
|---|---|---|
| A -> B | Transformation lineage: which toolchain produced B from A | Toolchain |
| B -> C | Dispatch identity: which artifact and context were used for execution | Platform |
| C -> D | Result provenance: which execution produced D | Platform |
| A -> D | End-to-end binding: submitted job is linked to returned result | Joint |

The end-to-end binding (A -> D) can be established transitively through
B and C, but only if each intermediate binding is itself verifiable.

## 5. Binding Mechanisms

For each binding, appropriate integrity mechanisms should be selected
based on the artifact type and threat model.

| Mechanism | Applicable to | Notes |
|---|---|---|
| Content digest | A, B, C, D when artifacts can be disclosed | SHA-256 or similar; commits to exact content |
| Authenticated reference | B, C, D when artifacts cannot be disclosed | Signed identifier resolving to the artifact |
| Verifiable commitment | A, B when raw artifacts must remain confidential | Cryptographic commitment scheme |
| Toolchain provenance | B | SLSA-style provenance record (see SLSA mapping) |
| Platform attestation | C, D | RFC 9334 RATS-style attestation |
| Signed result record | D | Provider-signed, distinguishing assertion from proof |

The choice depends on:

- Whether the artifact can be disclosed to the tenant or third-party
  verifier
- The threat model (which party is untrusted)
- The applicable trust boundary

## 6. Failure Modes

The integrity chain can fail in the following ways. Each is a distinct
attack or operational failure.

| Failure mode | Description | Binding affected |
|---|---|---|
| Substitution | B' is dispatched instead of B (attacker replaces artifact) | B -> C |
| Omission | A -> D binding is absent (no end-to-end linkage) | A -> D |
| Mismatch | B does not actually correspond to A (wrong transformation) | A -> B |
| Stale dispatch | An outdated B is dispatched (rollback) | B -> C |
| Unauthorized dispatch | Dispatch artifact is not from an authorized toolchain | B -> C |
| Context substitution | Backend/topology/calibration differ from policy | C -> D |
| Result tampering | D does not correspond to the actual execution of C | C -> D |
| Silent downgrade | Transformation silently uses weaker parameters | A -> B |

Each failure mode is detectable only if the corresponding binding is
verified at the appropriate boundary.

## 7. Verification Boundaries

The integrity chain is verified at the following boundaries:

### Boundary 1 - Submission (tenant side)

The tenant records:

- Submitted circuit and parameters (A)
- Content digest of A
- Any toolchain version constraints

### Boundary 2 - Transformation (toolchain side)

The toolchain produces:

- Transformed artifact (B)
- Content digest of B
- Provenance record linking A to B with toolchain identity

### Boundary 3 - Dispatch (platform side)

The platform records:

- Exact artifact dispatched (C's artifact component)
- Backend, topology, calibration state
- Binding of C's artifact to B (or justification for difference)

### Boundary 4 - Result return (platform side)

The platform produces:

- Result record (D)
- Binding of D to the execution of C
- Provider signature over the record

### Boundary 5 - Tenant verification

The tenant verifies:

- A -> B binding through toolchain provenance
- B -> C binding through dispatch evidence
- C -> D binding through result-record evidence
- A -> D end-to-end through transitive composition

Verification is possible only if each boundary produces the necessary
evidence. Currently, most quantum platforms do not produce this
evidence beyond the job identifier.

## 8. Distinction: Provider Assertion vs Independent Proof

A provider-generated record is an assertion by the provider. It is not
independent proof unless it can be verified against evidence the
provider cannot unilaterally fabricate.

Examples:

| Claim | Provider assertion | Independent proof |
|---|---|---|
| "Job X executed" | Provider says so | Provider signs a record with a key that a third party can verify and that is bound to the specific artifact |
| "Backend Y was used" | Provider metadata | Attestation signed by the backend hardware (RATS-style) |
| "Result R corresponds to C" | Provider return | Result record signed by an execution context that the tenant can independently appraise |
| "Toolchain T produced B" | Provider provenance | Provenance record with verifiable build reproducibility and signed toolchain identity |

The distinction matters because DORA Article 30 requires contractual
evidence expectations, not just provider claims. A financial entity
must be able to show that a claim was verifiable, not merely asserted.

The provider-assertion classification is developed further in
`01_Provider_Evidence_Classification.md`.

## 9. Relationship to QS09 Findings

This model formalizes:

- QS09-OBS-002 (Submitted-to-dispatch-to-result integrity chain)
- QS09-OBS-003 (Provider assertion vs independent proof distinction)
- QS09-OBS-005 (SLSA and RFC 9334 not operationalized)

QS09-OBS-006 (DORA Articles 28-44, Article 30 emphasis) is addressed
in `03_DORA_Article_30_Evidence_Package.md`.

## 10. Relationship to Other Entries

| Entry | Relationship |
|---|---|
| QS08 (QPU isolation) | Adjacent platform layer; QS08 provides isolation evidence, QS09 provides integrity evidence |
| QS10 (Side channels) | Adjacent platform layer; QS10 provides physical-layer disclosure |
| QS04 (Inventory) | CBOM/SBOM distinction; QS09 adds quantum-artifact provenance |
| QS03 (Signatures) | Adjacent; hybrid signature deployment is a QS03 concern |
| QS06 (Migration) | Adjacent; migration execution safety is QS06 |

A unified platform-surface provider evidence model spanning QS08,
QS09, QS10 is a candidate cross-entry contribution (Tier 2 in
Deep_Dive_Prioritization.md).

## 11. Open Questions

### Q1

Is the four-artifact model the right granularity, or should
transformation lineage be decomposed further (compiler, optimiser,
scheduler)?

### Q2

Should the model require verification at every boundary, or only at
the submission-to-result boundary?

### Q3

What is the minimum evidence set that a provider can feasibly produce,
and what is the minimum the tenant can feasibly verify?

### Q4

How does the model interact with reproducibility (reproducible builds
of B from A)? If B is reproducible, does that strengthen the binding?

### Q5

How does the model handle non-deterministic toolchain transformations
(e.g., topology-aware transpilation)?

## 12. Status

**Analysis status:** Deep-dive in progress
**Submission status:** Not submitted
**Next step:** `01_Provider_Evidence_Classification.md`

---

**Reviewed:** 2026-10-04
**Scope:** QS09 integrity chain formalization
**Depends on:** QS09 rapid audit, Deep_Dive_Prioritization.md