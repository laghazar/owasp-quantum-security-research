---
Title: QS03: Expand Coverage of Long-Lived Signed Artifacts
Labels: quantum-security, QS03, gap, very-high
Priority: Very High
Related OBS: QS03-OBS-013, 014, 015, 016, 017
Status: draft
---

## Problem

Long-lived signed artifacts require more attention than the current generic
treatment provides.

Examples include:

- firmware
- software releases
- legal and contractual documents
- regulatory evidence
- signed configuration
- archived CMS/XML objects
- long-lived certificates
- identity assertions
- trusted records
- audit log signing

The relevant question is not only how long the artifact is retained, but how
long a relying party must continue to trust its signature.

## Proposed improvement

Add an explicit long-lived artifact category and define signature assurance
lifetime separately from retention.

Describe the migration problem as:

    Artifact lifetime
    + Required signature assurance lifetime
    + Classical cryptographic lifetime
    + Migration lead time

Where long-term assurance is required, discuss re-signing, archival
validation, trusted time evidence, or other appropriate preservation
mechanisms.

## Related entries

- QS01 — confidentiality lifetime / HNDL
- QS04 — inventory of signed artifacts and cryptographic dependencies
- QS06 — migration implementation

## Acceptance

- Long-lived artifact category explicit
- Signature assurance lifetime defined
- Re-signing / archival validation discussed
- CMS (RFC 9882) and X.509 (RFC 9881) referenced
