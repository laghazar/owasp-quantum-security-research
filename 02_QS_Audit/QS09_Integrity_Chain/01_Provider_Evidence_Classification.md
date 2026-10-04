# Provider Evidence Classification

## 1. Purpose

This document formalizes the provider-assertion vs independent-proof
distinction introduced in the QS09 rapid audit (QS09-OBS-003) and
developed in `00_Integrity_Chain_Model.md` section 8.

The distinction matters because a financial entity using a quantum
platform service must be able to distinguish between:

- A provider's claim that something occurred
- Independently verifiable evidence that it occurred

This document provides a classification framework for claims in the
integrity chain, defines evidence levels, and identifies what shifts a
claim from assertion to verifiable proof.

## 2. The Problem with Provider-Generated Records

A provider-generated execution record is produced by the same entity
that operates the toolchain, dispatches the artifact, and reports the
result. Without independent verification, the record is a claim by the
provider rather than evidence of what actually happened.

This is not a statement about provider trustworthiness. It is a
statement about the structure of the evidence. A provider assertion is
necessary but not sufficient for regulatory and supervisory contexts
where a financial entity must be able to show that a claim is
verifiable, not merely asserted.

The QS09 entry states this explicitly:

> "Treat a provider-generated record as a provider assertion; do not
> represent it as independent proof of physical QPU execution,
> computational correctness, or result fidelity."

## 3. Claim Classification

Claims in the integrity chain fall into the following categories.

### Category 1 - Unverifiable assertion

A claim that cannot be independently checked by the tenant or a third
party using evidence the provider cannot unilaterally fabricate.

Example:

> "The job executed on backend X with calibration state Y."

If the tenant has only the provider's metadata, the claim is
unverifiable.

### Category 2 - Assertion with verifiable signature

A claim signed by a provider key that the tenant can verify. The
signature establishes that the claim was made by the provider. It does
not establish that the claim is true.

Example:

> "The job executed on backend X." [signed by provider key]

The signature is verifiable; the claim content remains asserted.

### Category 3 - Assertion with verifiable binding

A claim that is bound to a specific artifact or context via a
verifiable mechanism (content digest, authenticated reference,
cryptographic commitment). The binding establishes that the claim
refers to a specific artifact; the truth of the claim about the
artifact remains asserted unless further evidence is provided.

Example:

> "Artifact [digest: abc123] executed on backend X." [signed by
> provider key]

The tenant can verify the artifact identity; the execution claim
remains asserted.

### Category 4 - Attested claim from a second trust boundary

A claim attested by a hardware or platform component within a trust
boundary the tenant can independently appraise (RFC 9334 Attester /
Verifier / Relying Party model).

Example:

> "Artifact [digest: abc123] executed on backend X." [attested by
> backend TPM, verifiable against a known manufacturer root]

The backend attestation shifts the claim from provider-controlled to
hardware-verified, subject to the trust placed in the backend
manufacturer.

### Category 5 - Independently verifiable claim

A claim that can be independently verified by the tenant or a
third-party verifier without relying on any provider-controlled
component.

Examples:

- A provider publishes a zero-knowledge proof of correct execution
  against a publicly verifiable circuit
- Two independent providers return matching distributions and both
  are contractually committed to correctness (weaker)

Category 5 is rare in current quantum platforms. It is the target
state for high-assurance integrity chains.

## 4. Evidence Level Matrix

The following matrix summarizes the evidence level for each claim
category and its applicability to typical integrity chain claims.

| Claim | Category 1 | Category 2 | Category 3 | Category 4 | Category 5 |
|---|---|---|---|---|---|
| Job executed | Unverifiable | Signed | Bound + signed | Hardware attested | — |
| Artifact identity | Unverifiable | Signed | Digest verified | Hardware attested + digest | — |
| Backend used | Unverifiable | Signed | Bound to artifact | Hardware attested | — |
| Calibration state | Unverifiable | Signed | Bound to artifact | Hardware attested | — |
| Result correspondence | Unverifiable | Signed | Bound to artifact + context | Hardware attested + result signed | Independently verifiable |
| Physical QPU execution | Unverifiable | Signed | Bound | Hardware attested | Rare |

## 5. What Shifts Assertion to Proof

A claim shifts from assertion to verifiable proof when the tenant gains
the ability to independently check the claim using evidence the
provider cannot unilaterally fabricate.

### Shift mechanism 1 - Cryptographic binding

The claim is bound to a specific artifact or context through a
verifiable mechanism (content digest, authenticated reference,
cryptographic commitment). The binding is necessary but not
sufficient.

### Shift mechanism 2 - Verifiable signature

The claim is signed by a key that the tenant can verify and that is
provisioned through a trust chain the tenant can independently
appraise (pinned public key, X.509 chain to a known root, TPM
endorsement key).

### Shift mechanism 3 - Hardware attestation

The claim is attested by hardware within a trust boundary the tenant
can appraise (RATS-style Attester / Verifier / Relying Party).

### Shift mechanism 4 - Multi-party verification

The claim is verified by comparing evidence from multiple independent
parties (shot splitting, cross-provider distribution comparison). The
strength depends on the independence of the parties.

### Shift mechanism 5 - Cryptographic proof

The claim is accompanied by a zero-knowledge proof or similar
cryptographic proof of correctness against a publicly verifiable
statement. Rare in current practice.

## 6. Trust Boundaries in the Integrity Chain

Each artifact in the integrity chain (A, B, C, D from
`00_Integrity_Chain_Model.md`) sits within a trust boundary. Evidence
strength depends on where the boundary is drawn.

| Artifact | Typical trust boundary | Boundary owner |
|---|---|---|
| A - Submitted circuit | Tenant | Tenant |
| B - Transformed artifact | Toolchain | Provider (or tenant if toolchain is on-premises) |
| C - Dispatch artifact and context | Platform | Provider |
| D - Result record | Platform | Provider |

A claim about an artifact is strongest when the claim's trust boundary
is closest to the artifact's origin. A claim about A made by the
tenant is fully verifiable by the tenant. A claim about C made by the
provider is within the provider's trust boundary.

The tenant can extend its verification reach by:

- Selecting a toolchain whose transformation is reproducible (B is
  checkable from A)
- Selecting a platform whose dispatch evidence is bound to B via a
  mechanism the tenant can verify
- Selecting a provider that produces signed result records with
  hardware attestation where available

## 7. Application to QS09 Claims

The following table classifies typical QS09 claims at the current
platform state and at a target state.

| Claim | Current typical category | Target category |
|---|---|---|
| Job received | Category 1 | Category 2 |
| Circuit submitted = circuit transformed | Category 1 | Category 3 |
| Artifact dispatched is from authorized toolchain | Category 1 | Category 4 |
| Backend matches policy | Category 1 | Category 4 |
| Calibration state matches declared state | Category 1 | Category 4 |
| Result corresponds to dispatched artifact | Category 1 | Category 3 |
| Provider cannot substitute artifact | Category 1 | Category 3 |
| Provider cannot tamper result | Category 1 | Category 4 |
| Physical QPU execution | Category 1 | Category 4 (hardware attestation) |

## 8. Regulatory Implication: DORA Article 30

DORA Article 30 requires financial entities to have contractual
arrangements with ICT third-party service providers that include
appropriate provisions on performance, audit, and evidence.

For a quantum platform provider, the following are relevant:

- Contractual commitment to produce evidence at a specified category
  (not just Category 1)
- Audit rights that permit independent verification
- Exit strategies that account for the integrity chain
- Data location and processing disclosures

A financial entity cannot satisfy DORA Article 30 by accepting
Category 1 claims. The contractual expectation is that the provider
commits to a defined evidence level and enables verification.

This is developed further in `03_DORA_Article_30_Evidence_Package.md`.

## 9. Relationship to RFC 9334 RATS

RFC 9334 defines the Remote Attestation Procedures architecture:

- Attester produces Evidence about a target environment
- Verifier appraises Evidence against an Appraisal Policy
- Relying Party consumes Attestation Results

QS09's provider-assertion vs independent-proof distinction maps
directly onto this architecture:

| QS09 | RATS role |
|---|---|
| Tenant | Relying Party |
| Provider (assertion) | Not covered |
| Provider + independent verifier | Attester + Verifier |
| Provider hardware (TPM, etc.) | Attester |
| Appraisal policy | Configured by Relying Party |

RATS is not quantum-specific but provides the architecture for
distinguishing assertion from appraised evidence. The mapping is
developed further in `02_SLSA_and_RATS_Mapping.md`.

## 10. Financial Services Application

For financial entities using quantum platform services, the following
guidance applies:

### Evidence requirement in procurement

The procurement process should specify a minimum evidence category
for each claim. Category 1 claims should not be accepted for
regulated workloads.

### Evidence requirement in contracts

DORA Article 30 contractual arrangements should specify:

- The evidence categories the provider commits to produce
- The verification mechanisms the tenant can exercise
- The audit and disclosure rights that support verification

### Evidence requirement in supervisory reporting

Where quantum-derived output feeds a regulated process, the financial
entity should be able to evidence:

- The evidence category of the provider's execution record
- The verification that was performed
- The residual risk where verification is limited

This aligns with the DORA Article 30 emphasis on contractual evidence
expectations rather than provider claims.

## 11. Open Questions

### Q1

What is the minimum evidence category that a financial entity should
accept for a quantum platform service that supports a regulated
process?

### Q2

How should the evidence category be expressed in a contractual
commitment (e.g., "the provider commits to Category 3 evidence for
artifact identity and Category 2 evidence for backend claim")?

### Q3

How does the evidence category interact with cost and performance?
Higher evidence categories may require more platform infrastructure
and may reduce available backend choices.

### Q4

How should evidence categories be represented in the integrity chain
model's verification boundaries (section 7 of
`00_Integrity_Chain_Model.md`)?

### Q5

What is the counterpart of the RATS Attestation Result for a quantum
result record? Should the tenant be a Verifier of the result, or only
a Relying Party consuming Attestation Results from a third party?

## 12. Status

**Analysis status:** Deep-dive in progress
**Submission status:** Not submitted
**Next step:** `02_SLSA_and_RATS_Mapping.md`

---

**Reviewed:** 2026-10-04
**Scope:** Provider evidence classification for the QS09 integrity
chain
**Depends on:** QS09 rapid audit, `00_Integrity_Chain_Model.md`