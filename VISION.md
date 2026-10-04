# Vision and Roadmap

This document outlines the broader direction behind this research
workspace, beyond the current submitted contribution (QS09 Issue #54).

It is a personal research roadmap, not an OWASP commitment. It
describes what I am working toward and what I believe would strengthen
the OWASP Quantum Security Project.

## Starting Point

My original interest in this space began with research on post-quantum
cryptographic algorithms, including a proposed hybrid approach for
improving SIKE security and performance. That work led me to look more
closely at how organisations actually reason about quantum risk in
practice - and from that, to the OWASP Quantum Security Project as one
of the few practitioner-oriented public references.

## What has been produced so far

See [CONTRIBUTIONS.md](CONTRIBUTIONS.md) for the full inventory.

Current state:

- Full landscape review of all 9 active entries and 4 candidates
- Deep dives on QS01, QS03, QS04, QS09
- Rapid audits on QS05, QS06, QS07, QS08, QS10
- Methodology, QA Checklist, boundary register, regulatory context
- Financial Services Unified Profile
- Submitted QS09 Issue
  ([#54](https://github.com/OWASP/quantum-security-project/issues/54))

## The Broader Direction

Three threads are planned for the next phase.

### Thread 1 - Further OWASP entry-level contributions

Focus areas identified during the current review:

- **QS04**: CycloneDX v1.7 reference, SPDX precision, coverage metrics
- **QS03**: Reference modernization (RFC 9881, 9882, 9909, 9964,
  TCG TPM 2.0 v185, UEFI PQC, CA/B Forum SC-081)
- **QS01**: Precision corrections if current main requires
- **QSxx candidates**: Supply Chain, Misdirected Countermeasures,
  Unverifiable Execution (if the community supports adoption)

These are sequenced by priority and community feedback.

### Thread 2 - Sector-specific extensions of the OWASP Top 10

The OWASP Quantum Security Top 10 is intentionally generic. It does
not map the risks to specific regulated sectors where different
regulatory, operational, and adversarial realities apply.

A sector-specific extension would translate each entry into actionable
guidance for a specific industry. The current repository already
contains one such extension:

- **Financial Services Unified Profile** - aligned with DORA,
  NIS2, and CRA, with sector asset classes, threat models,
  procurement guidance, and supervisory evidence requirements.

Additional sectors considered for future work:

- **Aerospace and defence** - long aircraft lifecycles, export
  controls, firmware signing, supplier ecosystem.
- **Government and public sector** - citizen data retention, national
  PKI, procurement rules, sovereignty requirements.
- **Healthcare** - long-lived medical records, medical device
  firmware, HIPAA/GDPR alignment.
- **Critical infrastructure** - ICS/OT, long device lifecycles,
  regulatory obligations (NIS2, sector-specific).

**Proposal to OWASP**: if the project would find it useful, the
sector-specific extension model could become a formal companion
document to the Top 10, with one profile per sector. The financial
services profile is a working example.

### Thread 3 - Connecting to post-quantum cryptographic research

The current review focuses on operational and migration risks, not on
algorithm-level research. A future direction is to bridge the
operational layer with the algorithm layer, especially where
algorithm agility and parameter-set evolution intersect with
migration planning.

Specific interest areas:

- SIKE and its lessons for agility (SIKE was a candidate that failed
  during standardisation, which has direct implications for
  parameter-set agility in QS05).
- Hybrid constructions and the correct combination of primitives
  (QS06).
- Migration from pre-standard Kyber/Dilithium to ML-KEM/ML-DSA
  (QS06).

This thread is early-stage and would be developed in coordination with
the operational threads.

## What is Not in Scope (for now)

- Algorithm-level novelty claims without prior-art review.
- Vendor-specific product evaluation.
- Regulatory interpretation beyond what the cited sources establish.
- Any claim of OWASP affiliation beyond the submitted Issue.

## Engagement with OWASP

The current contribution model:

1. Open Issue on the project repository
2. Community discussion
3. Focused Pull Request if the direction is supported
4. Iteration based on maintainer and community feedback

The broader vision (sector-specific extensions, algorithm-layer
bridges) is offered as a proposal, not as a commitment. It would only
proceed if the project sees value in it.

## Contact and Repository

- Repository: https://github.com/laghazar/owasp-quantum-security-research
- OWASP Issue: https://github.com/OWASP/quantum-security-project/issues/54
- OWASP project: https://github.com/OWASP/quantum-security-project
- OWASP email: contribute@quantum-owasp.org

## Status

**Last updated:** 2026-10-04
**Next milestone:** QS09 Issue feedback and potential focused PR