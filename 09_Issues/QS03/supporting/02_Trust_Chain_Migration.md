---
Title: QS03: Model Trust-Chain Migration Instead of Leaf Signature Replacement
Labels: quantum-security, QS03, structural, very-high
Priority: Very High
Related OBS: QS03-OBS-002, 008, 009, 015, 021, 022, 023, 028, 029
Status: draft
---

## Problem

QS03 currently focuses heavily on vulnerable signature algorithms, but a
practical migration must address the complete trust chain.

Examples include:

    Root / Trust Anchor
        |
    CA / Issuer
        |
    Certificate
        |
    Signing Key
        |
    Signed Artifact
        |
    Verifier
        |
    Trust Policy

For code signing and firmware this may instead involve:

    Platform Trust Root
        |
    Firmware / Publisher Trust
        |
    Signing Key
        |
    Firmware / Update
        |
    Secure Boot / Update Verifier

Migrating only the leaf signing key does not guarantee quantum-safe trust.

## Proposed improvement

Explicitly define QS03 as a signature and trust-chain security risk, including:

- certificate authorities
- trust anchors
- signing keys
- certificate/key formats
- verification libraries
- trust stores
- token validators
- software and firmware update systems
- hardware-backed trust
- rollback/fallback mechanisms

Also clarify that migration can fail when a post-quantum signature is
generated but legacy verifiers cannot validate it, or when quantum-vulnerable
classical signatures remain accepted as fallback.

## Expected outcome

QS03 becomes materially more actionable for defenders and avoids treating
PQC signature migration as a single-key replacement exercise.

## Acceptance

- Trust-chain model explicit in Description
- Verifier migration covered
- Fallback/downgrade covered
- HSM/TPM/hardware-root covered
- Cross-reference to QS07
