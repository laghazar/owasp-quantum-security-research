# Proposal - Insecure Quantum Software Supply Chain

## 1. Proposal Statement

Adopt the "Insecure Quantum Software Supply Chain" candidate as a new
active entry in the OWASP Quantum Security Top 10, on the platform
surface, positioned immediately upstream of QS09 - Toolchain and
Compiler Compromise.

## 2. Problem Summary

Quantum applications depend on a software supply chain that extends
beyond the quantum compiler and execution toolchain. Source code,
third-party dependencies, SDKs, build systems, CI/CD pipelines, quantum
circuit artifacts, package repositories, container images, deployment
workflows, and provenance metadata can all influence the workload
ultimately submitted for quantum execution.

A compromise at any of these stages can introduce malicious or
unauthorized changes before the workload reaches a trusted quantum
compiler or platform. The resulting application or circuit may remain
syntactically valid and operational while producing manipulated
results, leaking intellectual property, or embedding malicious
behaviour.

## 3. Rationale

The candidate addresses a real threat that is not covered by any
current active entry:

- QS09 covers whether the quantum transformation and execution toolchain
  can be trusted. It does not cover whether the software and artifacts
  entering that toolchain can be trusted in the first place.
- QS04 covers cryptographic inventory and CBOM. It does not cover
  software supply chain integrity.
- No active entry covers quantum SDKs, quantum artifact integrity, or
  quantum-specific CI/CD pipelines.

A trusted compiler cannot compensate for a compromised dependency,
build process, CI/CD pipeline, or artifact delivered to it. This is a
distinct and important risk.

## 4. Boundary Statement

The candidate is self-delineated from QS09 with an explicit boundary
statement:

- QS09 addresses whether the quantum transformation and execution
  toolchain can be trusted
- This candidate addresses whether the software and artifacts entering
  that toolchain can be trusted in the first place

The distinction is upstream (this candidate) vs. toolchain (QS09).

## 5. Evidence Base

### Strong anchors

- SLSA (Supply-chain Levels for Software Artifacts) — generic framework
  for supply-chain integrity, provenance, and hardened build processes
- in-toto — framework for recording and verifying supply chain steps,
  actors, and artifacts
- Sigstore — software artifact signing, verification, transparency
- NIST SP 800-218 (Secure Software Development Framework)
- Piattini et al. (2023) — survey on security concerns in quantum
  software engineering
- Rahman, Haghparast, Mikkonen (2026) — classification of quantum
  software security challenges and mitigations
- Silva (2026) — DevSecOps case study with hybrid post-quantum
  artifact signing
- Research on security discussions in quantum software projects on
  GitHub (2025)

### Evidence status

- Generic supply-chain frameworks: verified
- Quantum-specific research: three recent peer-reviewed or
  preprint papers (2023-2026)
- No quantum-specific standard for software supply-chain integrity
- No industry-adopted quantum SDLC framework

## 6. Proposed Entry Structure

### Common Examples of Vulnerability

- Quantum SDKs or third-party dependencies consumed without version
  pinning, integrity verification, or dependency inventory
- Quantum artifacts (OpenQASM, QIR, other intermediate representations)
  moving between environments without cryptographic integrity
  verification
- CI/CD pipelines allowing unauthorized modification of source,
  dependencies, build instructions, or generated quantum artifacts
- Quantum software artifacts distributed without verifiable provenance
  linking them to source, dependencies, build systems, and build
  parameters
- Package repositories or artifact registries permitting substitution,
  dependency confusion, rollback, or compromised-identity publication
- Deployment workflows not verifying that the artifact submitted for
  quantum execution corresponds to the reviewed and approved source
  version
- SBOMs or equivalent dependency inventories absent, incomplete, or
  not linked to deployed artifacts

### How to Prevent

- Maintain inventories of software components and dependencies used
  in quantum applications, using SBOMs or equivalent manifests
- Pin and verify dependencies and SDK versions; restrict dependency
  acquisition to trusted sources
- Generate verifiable build provenance and retain attestations
  linking artifacts to source, dependencies, build systems, and build
  parameters
- Cryptographically sign software and quantum artifacts; verify
  signatures and provenance before deployment or execution
- Harden CI/CD and build environments (isolated build infrastructure,
  least privilege, protected branches, controlled build identities,
  auditable workflows)
- Apply SLSA and in-toto to quantum software development pipelines
  where applicable
- Use reproducible or independently verifiable builds where feasible
- Enforce policy gates rejecting unsigned, unverified, or
  provenance-deficient artifacts before production quantum environments
- Protect package repositories and artifact registries against
  unauthorized publication, replacement, and rollback

### Attack Scenarios

- Third-party dependency compromise: attacker subtly modifies circuit
  parameters before the application invokes the quantum SDK. The
  circuit remains valid and passes through a trusted transpiler and
  compiler, but the computation is altered. Controls focused only on
  compiler integrity do not detect this.
- CI/CD pipeline access: attacker modifies a generated OpenQASM or QIR
  artifact during the build process after source review. Artifact is
  deployed without signature or provenance verification.
- Dependency confusion: attacker publishes a malicious SDK package.
  The dependency alters quantum circuit generation while preserving
  expected application behavior, persisting across builds.

## 7. Cross-Entry Relationships

| Related entry | Relationship |
|---|---|
| QS09 Toolchain and Compiler Compromise | Upstream vs toolchain; candidate is the supply chain feeding into QS09 |
| QS04 Cryptographic Discovery and Inventory | SBOM vs CBOM distinction; candidate requires both |
| QS07 Hardware Roots of Trust | Hardware sourcing adjacent but distinct (software vs hardware) |
| QS08, QS10 | Platform surface peers |

## 8. Open Questions for OWASP Sprint

### Q1

Is the quantum-specific delta sufficient to justify a standalone entry,
or is this "classical supply chain applied to quantum applications"?

### Q2

Should this be a platform-surface entry (like QS09) or a cross-cutting
entry (since supply chain applies to migration surface too)?

### Q3

How does this interact with the QS04 CBOM/SBOM distinction? Does a
quantum application need both a CBOM and an SBOM, plus a quantum-artifact
provenance model?

### Q4

What is the appropriate cross-reference pattern between this entry and
QS09 (bidirectional)?

## 9. Recommendation

**STRONG ADOPT.**

Rationale:

- Self-delineated from QS09 with explicit boundary statement
- Strong research anchors (three 2025-2026 papers)
- Addresses real threat not covered by existing entries
- Platform surface, complements QS09

Suggested refinements if adopted:

- Clarify platform vs cross-cutting placement
- Strengthen quantum-specific delta (why this differs from classical
  software supply chain applied to any critical application)
- Address SBOM vs CBOM vs quantum-artifact-provenance relationship
  with QS04
- Add bidirectional cross-reference with QS09

---

**Proposal status:** Ready for OWASP Sprint review
**Proposed by:** <Larisa Ghazaryan>
**Date:** 2026-10-04
**Submission:** Internal research draft (not yet submitted)