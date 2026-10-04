---
Title: QS04: Clarify CBOM Representation and SPDX References
Labels: quantum-security, QS04, references, critical
Priority: Critical
Related OBS: QS04-OBS-004, 005, 027, 028, 029, 030
Status: draft
---

## Problem

The current prevention guidance recommends:

> "CBOM ... aligning with CycloneDX or SPDX cryptographic extensions."

CycloneDX has an explicit cryptographic-asset model and CBOM capabilities.
Its current specification and Cryptography Registry provide machine-readable
representations for cryptographic algorithms, keys, certificates, protocols,
and relationships.

The current SPDX specification provides profiles and extension mechanisms,
but the statement that SPDX provides a standardised equivalent "cryptographic
extension" should be verified or narrowed.

## Proposed wording

Replace the current statement with:

> "Adopt a machine-readable cryptographic inventory representation, using an
> established CBOM model such as CycloneDX where appropriate, or a clearly
> defined standards-based extension or representation for other BOM
> ecosystems."

## Additional recommendations

- Specify CycloneDX version (1.6+)
- Add CycloneDX Cryptography Registry for canonical naming
- Add CycloneDX key / certificate use case references
- Do not imply that CBOM adoption itself is mandatory under a regulation
  unless a specific authoritative requirement establishes that obligation

## Evidence

CycloneDX currently defines cryptographic assets and cryptographic properties,
while the SPDX specification documents its profile and extension mechanisms.

## Acceptance

- SPDX wording is technically defensible
- CycloneDX version specified (1.6+)
- Cryptography Registry referenced
- Key / certificate use case references added
- Vendor neutrality preserved
