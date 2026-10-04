# SLSA and RFC 9334 RATS Mapping

## 1. Purpose

This document maps the QS09 integrity chain
(`00_Integrity_Chain_Model.md`) and the provider evidence
classification (`01_Provider_Evidence_Classification.md`) to two
existing generic frameworks:

- **SLSA** (Supply-chain Levels for Software Artifacts): supply-chain
  integrity and provenance model
- **RFC 9334 RATS** (Remote ATtestation procedureS Architecture):
  attestation architecture distinguishing assertions from appraised
  evidence

Neither framework is quantum-specific. Both provide models that can
inform quantum-platform controls. This document operationalizes the
mapping so that procurement and integration teams can reason about
evidence requirements using established vocabulary.

## 2. Why Map to Existing Frameworks

Three reasons:

### Reason 1 - Established vocabulary

SLSA and RATS have well-defined terms (provenance, attestation,
appraisal policy, Relying Party) that reduce ambiguity. Using them
avoids inventing quantum-specific terms that have no external anchor.

### Reason 2 - Auditable evidence

Financial entities and supervisors already assess SLSA provenance
levels for software supply chain and RATS-based attestation for
platform security. Quantum platform evidence requirements can be
expressed in the same terms.

### Reason 3 - Contractual framing

DORA Article 30 contractual arrangements benefit from referencing
established frameworks. "Provider commits to SLSA Level 3 provenance
for the transpiled artifact" is enforceable; "provider provides
sufficient evidence" is not.

## 3. SLSA Model Overview

SLSA defines four levels of increasing supply-chain integrity:

| Level | Property | Established by |
|---|---|---|
| SLSA 1 | Provenance exists | Documentation of how artifact was built |
| SLSA 2 | Provenance is signed | Signed provenance from build service |
| SLSA 3 | Provenance is non-forgeable | Hardened build platform; provenance cannot be altered after build |
| SLSA 4 | Provenance is reproducible | Two-party review; hermetic and reproducible builds |

SLSA provenance describes where, when, and how an artifact was
produced. It is consumed by verifiers to make trust decisions.

## 4. SLSA Level Mapping for Quantum Toolchain Artifacts

The following table maps the four QS09 integrity chain artifacts to
applicable SLSA levels.

| Artifact | SLSA-relevant? | Target level | Rationale |
|---|---|---|---|
| A - Submitted circuit | No (tenant-authored) | N/A | Circuit is the tenant's own input; SLSA applies to build/transform artifacts |
| B - Transformed artifact | Yes | SLSA 3 (target) | B is produced from A by the toolchain; non-forgeable provenance establishes that the toolchain produced B from A |
| C - Dispatch artifact | Partial | SLSA 3 for the artifact component; RATS for the platform context | The artifact component can carry SLSA provenance; platform context (backend, calibration) is a RATS concern |
| D - Result record | No (SLSA) | N/A | Result records are runtime outputs, not build artifacts. RATS applies |

### SLSA applicability to Artifact B

B is the strongest candidate for SLSA mapping because it is produced
by a transformation from A by the toolchain. SLSA provenance for B
would establish:

- The toolchain components (compiler, transpiler, scheduler) and
  their versions
- The resolved dependencies
- The transformation parameters
- The build environment identity

At SLSA 3, the provenance is signed by a hardened build platform and
cannot be altered after the build. This shifts the A -> B binding from
provider assertion (Category 1-2 in
`01_Provider_Evidence_Classification.md`) to verifiable evidence
(Category 3-4).

### SLSA applicability to Artifact C

The artifact component of C is what is dispatched for execution. If
C's artifact equals B (no further transformation), the SLSA provenance
for B applies. If C's artifact differs from B (e.g., additional
platform-specific transformation), SLSA provenance for the additional
transformation should also be produced.

The platform context (backend, topology, calibration state) is not an
SLSA concern. It is addressed by RATS (section 5).

## 5. RFC 9334 RATS Model Overview

RFC 9334 defines the Remote Attestation Procedures architecture with
the following roles:

| Role | Function |
|---|---|
| **Attester** | Produces Evidence about a target environment |
| **Verifier** | Appraises Evidence against an Appraisal Policy |
| **Relying Party** | Consumes Attestation Results to make decisions |

The architecture distinguishes:

- **Evidence**: raw data produced by the Attester
- **Attestation Result**: the Verifier's appraisal output
- **Appraisal Policy**: the rules the Verifier applies

RFC 9334 is generic. It applies to any scenario where a remote party
needs evidence about a target environment.

## 6. RATS Role Mapping for QS09

The following table maps the QS09 integrity chain participants to RATS
roles.

| QS09 participant | RATS role | Notes |
|---|---|---|
| Tenant | Relying Party | Consumes Attestation Results to decide whether to trust the result |
| Provider (assertion only) | Not covered | Provider assertions are outside RATS scope |
| Provider + independent verifier | Attester + Verifier | Provider produces Evidence; independent verifier appraises |
| Provider hardware (TPM, secure element) | Attester | Hardware produces Evidence signed by a manufacturer root |
| Independent third-party appraiser | Verifier | Appraises Evidence against tenant-configured policy |

### Why provider assertion is not covered by RATS

RATS assumes the Attester and Verifier are distinct entities. A
provider that both produces and appraises its own Evidence is not
following the RATS architecture. This is consistent with
`01_Provider_Evidence_Classification.md`: a provider-generated record
is an assertion, not appraised evidence.

### RATS applicability to Artifact C

The platform context of C (backend, topology, calibration state) is
the natural RATS target. The backend can act as an Attester producing
Evidence about:

- Its hardware identity (via TPM or secure element)
- Its firmware version
- Its calibration state at execution time
- The artifact it received for execution

The Evidence is signed by the backend hardware. An independent Verifier
(or the tenant as Relying Party) appraises it against policy.

### RATS applicability to Artifact D

The result record D can include:

- RATS Attestation Result (appraised by the Verifier)
- Provider signature over the result
- Binding to Artifact C's attestation

This shifts D from a provider assertion (Category 1-2) to appraised
evidence (Category 4).

## 7. Combined SLSA + RATS Model

Applying both frameworks to the QS09 integrity chain produces the
following combined model.

### Artifact A - Submitted circuit

- Tenant-authored
- No SLSA or RATS application
- Tenant records a content digest of A

### Artifact B - Transformed artifact

- SLSA provenance target
- Target level: SLSA 3
- SLSA provenance establishes A -> B binding
- Evidence category after SLSA 3: Category 3 (verifiable binding)

### Artifact C - Dispatch artifact and platform context

- Artifact component: SLSA provenance (inherited from B, or new
  provenance for additional transformations)
- Platform context: RATS attestation
- Evidence category after SLSA + RATS: Category 4 (hardware attested)

### Artifact D - Result record

- Provider-signed result record
- Binding to C via RATS Attestation Result
- Binding to A via transitive composition
- Evidence category after RATS: Category 4

### End-to-end binding (A -> D)

- Composed transitively through SLSA (A -> B) and RATS (B -> C, C -> D)
- Verified by the tenant as Relying Party
- Category 4 end-to-end

## 8. Gap Analysis: Current vs Target

The following table compares the current state of typical quantum
platforms to the target state.

| Binding | Current state | Target state | Mechanism |
|---|---|---|---|
| A -> B | Not established | Verifiable | SLSA 3 provenance for B |
| B -> C | Not established | Verifiable | SLSA provenance + platform attestation |
| C -> D | Not established | Verifiable | RATS Attestation Result |
| A -> D | Not established | Composed | Transitive verification by tenant |

No public quantum platform is known to currently produce SLSA 3
provenance for transpiled artifacts or RATS attestation for platform
context. The target state is aspirational.

## 9. Procurement Application

For financial entities procuring quantum platform services:

### Minimum requirements to specify in procurement

1. **Toolchain provenance.** SLSA level for the transpiled artifact
   (target: SLSA 3).
2. **Platform attestation.** RATS-style attestation for backend
   identity, firmware version, and calibration state at execution
   time.
3. **Result binding.** Signed result record that binds D to the
   attested execution of C.
4. **Verifier identity.** Whether the Verifier is the provider, an
   independent third party, or the tenant itself.
5. **Appraisal policy.** The policy against which Evidence is
   appraised.

### Contractual commitments

DORA Article 30 arrangements should specify:

- The SLSA level the provider commits to for the transpiled artifact
- The RATS roles the provider will support
- The evidence the provider will produce and the tenant's right to
  verify it
- The consequences of evidence failure or absence

## 10. Relationship to Other QS09 Documents

| Document | Relationship |
|---|---|
| `00_Integrity_Chain_Model.md` | Defines the four-artifact model; this document maps it to SLSA and RATS |
| `01_Provider_Evidence_Classification.md` | Defines evidence categories; this document shows how SLSA and RATS shift categories |
| `03_DORA_Article_30_Evidence_Package.md` | Uses this mapping to specify contractual evidence requirements |
| `04_Proposed_OWASP_Text.md` | Uses this mapping to propose revised QS09 entry language |

## 11. Open Questions

### Q1

Is SLSA 3 feasible for quantum toolchain transformations, given that
transpilation may be non-deterministic (topology-aware, calibration-
aware)?

### Q2

Can RATS attestation be produced at the per-job level, or only at
coarser granularity (per-session, per-slot)?

### Q3

What is the appropriate Appraisal Policy for a quantum platform
Attestation? Does it need to be quantum-specific, or can it inherit
from classical attestation policy?

### Q4

How should the tenant verify the composition A -> B -> C -> D without
requiring provider cooperation at every step?

### Q5

Should the SLSA level be required uniformly across all QS09 platform
providers, or should it be tiered by workload sensitivity?

## 12. Status

**Analysis status:** Deep-dive in progress
**Submission status:** Not submitted
**Next step:** `03_DORA_Article_30_Evidence_Package.md`

---

**Reviewed:** 2026-10-04
**Scope:** SLSA and RFC 9334 RATS mapping for the QS09 integrity chain
**Depends on:** `00_Integrity_Chain_Model.md`,
`01_Provider_Evidence_Classification.md`