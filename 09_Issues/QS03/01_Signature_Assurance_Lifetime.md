---
Title: QS03: Clarify Quantum Signature Forgery Risk and Signature Assurance Lifetime
Labels: quantum-security, QS03, conceptual, critical
Priority: Critical
Related OBS: QS03-OBS-001, 013, 014, 040
Status: draft
---

## Problem

QS03 correctly identifies classical public-key signatures as a quantum
migration concern, but the current framing risks conflating several distinct
concepts:

- cryptographic break of a signature scheme
- ability to forge new signatures
- validity of historical signature evidence
- compromise of certificate and trust chains
- migration of signers and verifiers

A future quantum capability should not be described as automatically making
every previously generated signature byte string invalid. The more precise
security concern is that the cryptographic assumption underlying the signature
may no longer provide sufficient assurance against forgery, undermining
authenticity, integrity, or trust decisions that depend on it.

## Proposed improvement

Introduce the concept of a **signature assurance lifetime**:

> Signature assurance lifetime is the period during which a relying party
> needs confidence that a signature provides reliable evidence of the
> authenticity and integrity of the signed artifact or assertion.

This should be assessed separately from artifact retention or operational
lifetime.

The entry should then explain that long-lived signed artifacts may require
migration, re-signing, archival validation, trusted time evidence, or other
mechanisms before the underlying classical signature mechanism loses adequate
security assurance.

## Why this matters

This creates a signature-specific risk model that is conceptually distinct
from QS01's confidentiality lifetime and avoids incorrectly treating signature
security as a confidentiality problem.

## Related entries

- QS04 — signature and trust dependency discovery
- QS05 — crypto agility
- QS06 — secure PQC migration

## Acceptance

- Signature assurance lifetime defined
- Distinguished from retention and confidentiality lifetime
- Long-lived artifacts section uses the concept
- QS03/QS01 boundary explicit
