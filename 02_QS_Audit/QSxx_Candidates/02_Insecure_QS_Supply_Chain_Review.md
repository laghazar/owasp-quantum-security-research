# QSxx Candidate - Insecure Quantum Software Supply Chain - Candidate Review

## 1. Scope & Method

Reviewed:

- Description
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenarios
- Reference Links

This is a rapid candidate review, not a full deep-dive.

---

## 2. Candidate Summary

### Problem definition

Quantum applications depend on a software supply chain that extends
beyond the quantum compiler and execution toolchain. Source code,
third-party dependencies, SDKs, build systems, CI/CD pipelines, quantum
circuit artifacts, package repositories, container images, deployment
workflows, and provenance metadata can all influence the workload
ultimately submitted for quantum execution. A compromise at any of
these stages can introduce malicious or unauthorized changes before
the workload reaches a trusted quantum compiler or platform.

### Intended scope

The candidate explicitly delineates itself from QS09 - Toolchain and
Compiler Compromise:

- QS09 addresses whether the quantum transformation and execution
  toolchain can be trusted
- This candidate addresses whether the software and artifacts
  entering that toolchain can be trusted in the first place
- A trusted compiler cannot compensate for a compromised dependency,
  build process, CI/CD pipeline, or artifact delivered to it

### Primary actor

- Attacker compromising a dependency, SDK, or CI/CD pipeline
- Malicious package maintainer
- Insider with build-environment access

### Main security consequence

Manipulated computation, leaked IP, or embedded malicious behaviour
in the workload that reaches a trusted quantum compiler. The
compromise persists across builds and evades compiler-integrity
controls.

### Distinctive quantum-specific element

Partial. The supply-chain threat model is largely classical (SBOM,
SLSA, in-toto, Sigstore). The quantum-specific elements are:

- Quantum artifact types (OpenQASM, QIR, intermediate
  representations)
- The specific point at which quantum-specific artifacts enter the
  toolchain
- The intersection with quantum SDKs and their dependencies

---

## 3. Overlap Analysis

### Potential overlap with active entries

- QS09 (explicitly delineated): QS09 covers toolchain integrity; this
  covers inputs to that toolchain. The candidate's own Reference Links
  include QS09 with the boundary statement. This is a well-articulated
  boundary.
- QS04: SBOM relevance. QS04 mentions SBOM in its prevention section
  (dependency scanning). The candidate extends to quantum-specific
  dependency inventories.
- QS07: hardware sourcing - adjacent but distinct (hardware vs
  software).

### Potentially covered by which active entry

- QS09 covers part of it (toolchain integrity)
- QS04 covers part of it (SBOM dependency scanning)
- Neither covers the full classical-software-supply-chain applied to
  quantum applications

---

## 4. Evidence Anchor

### Cited sources

- SLSA (framework - generic)
- in-toto (framework - generic)
- Sigstore (infrastructure - generic)
- NIST SP 800-218 (Secure Software Development Framework - generic)
- Piattini et al. (research - quantum software engineering security)
- Rahman, Haghparast, Mikkonen (research - quantum software security
  classification)
- Silva (research - quantum-resilient supply chain with hybrid
  post-quantum signing)
- OWASP QS09 (self-reference for boundary)

### Verification status

- Generic frameworks verified
- Quantum-specific research papers exist but are relatively few
- The candidate cites three recent research papers (2025-2026), which
  suggests the field is developing

### Missing evidence

- No quantum-specific standard for supply-chain integrity
- No industry-adopted quantum SDLC framework
- No evidence about how often quantum software supply-chain
  compromises have actually occurred

---

## 5. Open Questions

### Q1

Is the quantum-specific delta sufficient to justify a standalone entry,
or is this a "classical supply chain applies to quantum applications"
observation?

### Q2

The candidate explicitly delineates from QS09. Is this boundary strong
enough to survive reader scrutiny, or will the two entries be
conflated in practice?

### Q3

Should this be a platform-surface entry (like QS09) or a
cross-cutting entry (since supply chain applies to migration surface
too)?

### Q4

How does this interact with the QS04 CBOM/SBOM distinction? Does a
quantum application need both a CBOM and an SBOM, plus a
quantum-artifact provenance model?

---

## 6. Candidate Recommendation

**STRONG ADOPT CANDIDATE.**

Rationale:

- Self-delineated from QS09 with an explicit boundary statement
- Strong research anchors (three 2025-2026 papers)
- Addresses a real threat not covered by existing entries
- Platform surface, complements QS09

Suggested refinements if adopted:

- Clarify the platform vs cross-cutting surface placement
- Strengthen the quantum-specific delta (why is this different from
  classical software supply chain applied to any critical application?)
- Address the SBOM vs CBOM vs quantum-artifact-provenance relationship
  with QS04
- Consider whether QS09 and this entry should cross-reference each
  other explicitly in both directions

Do not recommend a full deep dive on this candidate at the rapid-audit
stage. The candidate is well-developed; a landscape-wide review will
determine whether it should be adopted.

---

**Reviewed:** 2026-10-04
**Candidate status:** Pre-Sprint 0 submission
**Candidate surface:** Platform (self-described)
**Recommendation:** Strong adopt candidate