# QS09 - Proposed Revised Text

## 1. Purpose

This document presents a proposed revision of the QS09 - Toolchain and
Compiler Compromise entry, based on the deep-dive findings in this
folder:

- `00_Integrity_Chain_Model.md` - four-artifact integrity chain
- `01_Provider_Evidence_Classification.md` - assertion vs proof
- `02_SLSA_and_RATS_Mapping.md` - generic framework mapping
- `03_DORA_Article_30_Evidence_Package.md` - financial-services
  evidence package

The proposed revision adds the submitted-to-dispatch-to-result
integrity chain as an explicit concern of the entry, formalizes the
provider-assertion vs independent-proof distinction, and adds
regulation-aligned evidence guidance.

This is a candidate revision. It is not submitted to OWASP. It is a
proposal for internal review, and its adoption would be subject to
OWASP Sprint evaluation.

## 2. Current QS09 Entry (Reference)

The current QS09 entry addresses three documented attack classes:

1. Circuit theft via compromised compilers (Suresh et al., HASP 2021)
2. QTrojan via configuration file manipulation (Chu et al., 2023)
3. Pulse-level interface abuse (Xu and Szefer, IEEE S&P 2025)

It also notes an integrity continuity concern:

> "A stable user-facing job identifier alone does not establish that
> the submitted circuit and parameters remain integrity-linked to the
> security-relevant transformed artifact dispatched for execution,
> the platform-reported backend and execution context, and the
> returned result record."

The proposed revision formalizes this concern as a fourth distinct
attack surface with its own controls and evidence requirements.

## 3. Proposed Revised Description

### Proposed Description

A submitted quantum job is not just a circuit. It is a chain of
artifacts that flows from the tenant's submission through the
toolchain, the platform dispatcher, and the backend before returning a
result record. Each stage in the chain is a potential point of
compromise, and the chain is meaningful only if the tenant can verify
that the artifacts at each stage are integrity-linked.

Three documented attack classes target specific stages:

- **Compiler compromise** targets the transformation stage. Circuit
  theft via a compromised transpiler exfiltrates both the algorithm
  and its hardcoded inputs (Suresh et al., HASP 2021).
- **Configuration manipulation** targets the calibration and
  configuration stage. QTrojan disables data encoding inside a
  circuit through modified hardware configuration files disguised as
  routine pulse calibrations (Chu et al., 2023).
- **Pulse-level interface abuse** targets the gate-to-pulse boundary.
  Custom gate definitions can produce pulse behaviour that differs
  from their gate-level specification, without any compromised
  toolchain component (Xu and Szefer, IEEE S&P 2025).

A fourth concern spans all stages. The submitted circuit, the
transformed artifact, the dispatched artifact and platform context,
and the returned result record must be integrity-linked if the tenant
is to know what actually executed. A stable user-facing job
identifier alone does not establish this linkage. This is not a
deployment gap specific to any single toolchain component. It is a
structural property of the chain: without integrity-linked
provenance, a substituted or mismatched artifact at any stage is
indistinguishable from a correct execution.

Integrity in this context means both correctness of transformation
and verifiability of the end-to-end chain by the tenant or a
designated verifier. A provider-generated record is a provider
assertion unless it can be independently appraised. The distinction
matters for regulated use, where contractual evidence expectations
extend beyond provider claims.

### Change rationale

The current entry describes the three attack classes well. The
proposed revision:

- Formalizes the integrity chain as a fourth concern with its own
  controls (from `00_Integrity_Chain_Model.md`)
- Introduces the provider-assertion vs independent-proof distinction
  as a first-class property (from
  `01_Provider_Evidence_Classification.md`)
- Adds a generic-framework anchor (SLSA, RFC 9334 RATS) so that
  evidence requirements can be expressed in established vocabulary
  (from `02_SLSA_and_RATS_Mapping.md`)
- Aligns the terminology with DORA Article 30 for regulated use
  (from `03_DORA_Article_30_Evidence_Package.md`)

## 4. Proposed Common Examples of Vulnerability

The current examples remain valid. Proposed additions:

- Toolchains that produce a transpiled artifact without
  integrity-linked provenance to the submitted circuit and parameters
- Platforms that report job completion without evidence binding the
  submitted job to the dispatched artifact and the returned result
- Providers whose execution records are unsigned assertions rather
  than appraisable evidence
- Deployments where the toolchain, platform, and result are treated
  as independent trust boundaries rather than as a chain
- Procurement processes that accept "the job completed" as sufficient
  evidence of correct execution
- Result records that cannot be independently linked to the
  submission, transformation, or dispatch context

## 5. Proposed How to Prevent

The current prevention guidance remains valid. Proposed additions:

### Integrity chain

- Define the submitted-to-dispatch-to-result integrity chain as a
  first-class property of the platform
- Require integrity-linked provenance between each pair of adjacent
  artifacts (submitted to transformed, transformed to dispatched,
  dispatched to result)
- Use content digests, authenticated references, or cryptographic
  commitments appropriate to the artifact type and threat model

### Provider evidence

- Distinguish provider assertions from independently appraisable
  evidence
- Require providers to disclose their evidence categories and the
  verification mechanisms available to the tenant
- Treat a provider-generated execution record as a provider assertion
  unless it is signed and bound in a manner the tenant can verify

### Framework alignment

- Express toolchain provenance requirements using established
  frameworks such as SLSA (target level: 3 for transpiled artifacts)
- Express platform attestation requirements using RFC 9334 RATS
  (Attester, Verifier, Relying Party roles)
- Configure an appraisal policy that the tenant can independently
  apply

### Regulated use

- For regulated use, specify the minimum evidence category required
  per binding (transformation, dispatch, result)
- Include evidence commitments in DORA Article 30 contractual
  arrangements where applicable
- Retain evidence in a form suitable for supervisory reporting
- Document residual risk where verification is limited

## 6. Proposed Reference Links

The current references remain. Proposed additions:

- SLSA - Supply-chain Levels for Software Artifacts (provenance model)
- RFC 9334 - Remote ATtestation procedureS (RATS) Architecture
- DORA Regulation (EU) 2022/2554, Articles 28-30 (third-party risk
  and contractual arrangements)

## 7. Proposed Example Attack Scenarios

The current scenarios remain. Proposed addition:

### Scenario - Artifact substitution with preserved job identifier

An attacker with write access to a transformation cache or artifact
store substitutes a different transpiled artifact while preserving
the original user-facing job identifier. The platform dispatches the
substituted artifact and later reports the job as completed. The
returned result record is associated only with the identifier and not
with the submitted circuit and parameters, the security-relevant
transformation lineage, or the artifact and platform context
identified at dispatch.

The tenant cannot determine from the returned record whether the
intended or the substituted artifact was dispatched. No component of
the toolchain was compromised. The failure is the absence of an
integrity-linked chain between submission and result.

This scenario is drawn from `00_Integrity_Chain_Model.md` section 6
(substitution failure mode) and illustrates the integrity chain
concern that the proposed Description formalizes.

## 8. Non-Mandate Note

This proposed revision does not claim that any cited source mandates
the integrity chain controls. The controls are proposed as appropriate
engineering practice for the concerns QS09 addresses. SLSA and RFC
9334 provide generic frameworks; they are not quantum-specific. DORA
Article 30 establishes third-party contractual expectations for
regulated entities; it does not prescribe a specific evidence package.

See `08_Standards_Regulation/Landscape_Regulatory_Context.md` for the
taxonomy and non-mandate rule applied across the landscape.

## 9. Cross-Entry Relationships

- QS08 (QPU isolation) - adjacent platform layer (execution)
- QS10 (Side channels) - adjacent platform layer (infrastructure)
- QS04 (Inventory) - provenance inventory adjacency
- QS06 (Migration) - adjacent migration execution concern

A unified platform-surface provider evidence model spanning QS08,
QS09, and QS10 is identified as a Tier 2 cross-entry contribution in
`02_QS_Audit/Deep_Dive_Prioritization.md`.

## 10. Submission Status

**Analysis status:** Deep-dive in progress
**Submission status:** Not submitted
**Proposed action:** If adopted after internal review, present as an
Issue on the OWASP quantum-security-project repository with this
document and the underlying deep-dive files as evidence.

**Note on QS09-umbrella issue:**
`09_Issues/QS09/` does not currently exist. If the QS09 deep dive is
finalized, an umbrella Issue would be created following the same
structure as QS01, QS03, and QS04 umbrella Issues.

---

**Reviewed:** 2026-10-04
**Scope:** Proposed revision of QS09 entry based on integrity chain
deep dive
**Depends on:** `00_Integrity_Chain_Model.md`,
`01_Provider_Evidence_Classification.md`,
`02_SLSA_and_RATS_Mapping.md`,
`03_DORA_Article_30_Evidence_Package.md`