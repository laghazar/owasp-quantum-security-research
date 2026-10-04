# QS09 Issue - Integrity Chain Model for Quantum Job Execution

**Submission status:** Ready for OWASP Issue
**Type:** Focused contribution proposal (deepening)
**Related OBS:** QS09-OBS-002, QS09-OBS-003, QS09-OBS-005, QS09-OBS-006

---

## Summary

This is a proposal to formalize and operationalize the
submitted-to-dispatch-to-result integrity chain as an explicit concern
of the QS09 - Toolchain and Compiler Compromise entry.

The current QS09 entry already acknowledges the integrity continuity
concern and provides prevention items for provenance, dispatch
verification, and authenticated records. This proposal does not
introduce a new concept. It provides:

- A formal four-artifact model for the integrity chain
- A provider evidence classification that separates assertion from
  independently verifiable evidence
- Generic framework mapping (SLSA, RFC 9334 RATS)
- A DORA Article 30-aligned evidence package for regulated use

## Problem

The current QS09 entry states:

> "A stable user-facing job identifier alone does not establish that
> the submitted circuit and parameters remain integrity-linked to the
> security-relevant transformed artifact dispatched for execution, the
> platform-reported backend and execution context, and the returned
> result record."

This is accurate but does not formalize:

- What the artifacts are
- What bindings between them are required
- What failure modes exist at each binding
- What evidence categories are required to verify each binding
- How regulated entities should express the requirement contractually

The absence of formalization means readers cannot easily translate the
concern into actionable controls. This proposal provides that
formalization.

## Proposed Contribution

### 1. Four-artifact model

The integrity chain spans four artifacts:

| Artifact | Description |
|---|---|
| A | Submitted circuit and parameters |
| B | Security-relevant transformed artifact (toolchain output) |
| C | Dispatch artifact and platform context (backend, topology, calibration state) |
| D | Returned result record |

Required bindings:

| Binding | Establishes |
|---|---|
| A -> B | Transformation lineage |
| B -> C | Dispatch identity |
| C -> D | Result provenance |
| A -> D | End-to-end integrity (composed transitively) |

### 2. Provider evidence classification

Five categories separate assertion from independently verifiable
evidence:

1. **Unverifiable assertion** - provider metadata only
2. **Signed assertion** - provider signature verifiable, claim
   asserted
3. **Bound assertion** - claim bound to a specific artifact via
   content digest or authenticated reference
4. **Hardware-attested claim** - claim attested by hardware within a
   trust boundary the tenant can appraise
5. **Independently verifiable claim** - claim verifiable without
   relying on any provider-controlled component

Current quantum platforms produce Category 1-2 evidence for most
claims. Category 3-4 is the target for regulated use.

### 3. Framework mapping

Toolchain provenance requirements can be expressed using SLSA
(Supply-chain Levels for Software Artifacts), with an assurance
target selected according to the artifact's threat model.

Platform attestation requirements can be expressed using RFC 9334
RATS roles (Attester, Verifier, Relying Party), which structurally
distinguish provider assertions from appraised evidence.

Neither framework is quantum-specific. Both provide established
vocabulary that reduces ambiguity in contractual and audit contexts.

### 4. DORA Article 30 alignment

For financial entities consuming quantum platform services, the
integrity chain maps to DORA Article 30 contractual evidence
expectations:

- Evidence commitments at specified categories
- Audit and verification rights
- Framework-aligned evidence requirements (SLSA, RATS)
- Retention and supervisory reporting requirements

## Evidence Base

- QS09 current entry description (integrity continuity concern)
- SLSA provenance model (generic)
- RFC 9334 RATS Architecture (generic)
- DORA Regulation (EU) 2022/2554, Article 30
- Suresh et al. HASP 2021 (circuit theft)
- Chu et al. IEEE ICASSP 2023 (QTrojan)
- Xu and Szefer IEEE S&P 2025 (pulse-level interface)

## Proposed Change

A revision to the QS09 entry that:

1. Formalizes the four-artifact integrity chain as an explicit
   concern (in addition to the three existing attack classes)
2. Introduces the provider-assertion vs independent-proof
   distinction as a first-class property
3. Adds framework anchors (SLSA, RFC 9334) as references
4. Adds a DORA Article 30 note for regulated use

The full proposed revision is available at:
`02_QS_Audit/QS09_Integrity_Chain/04_Proposed_OWASP_Text.md`

## Non-Mandate Note

This proposal does not claim that any cited source mandates the
integrity chain controls. SLSA and RFC 9334 are generic frameworks,
not quantum-specific requirements. DORA Article 30 establishes
third-party contractual expectations; it does not prescribe the
specific evidence package proposed here.

## Scope Boundary

This contribution is specific to integrity assurance of the
submitted-to-dispatch-to-result chain. It does not:

- Replace QS08 tenant isolation concerns (co-tenant harm)
- Replace QS10 physical side-channel concerns (controller telemetry)
- Address generic software supply-chain security
  (a separate candidate entry proposal)

## Cross-Entry Relationships

- QS08 (QPU isolation) - adjacent platform layer
- QS10 (Side channels) - adjacent platform layer
- QS04 (Inventory) - provenance inventory adjacency
- QS06 (Migration) - migration execution adjacency

## Submission Form

This Issue is the discussion entry point. If the OWASP community
supports the direction, a focused PR will follow with the proposed
text revision for the QS09 entry.

## Status

**Analysis status:** Submission Ready
**Submission status:** Ready for OWASP Issue submission
**Prepared:** 2026-10-04