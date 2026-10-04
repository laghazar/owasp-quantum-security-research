# QS01 Revision Proposal

## Summary

Consolidated revision of QS01 based on QS01 Review findings.
Addresses precision, scope, taxonomy, architecture, and regulatory wording.

## Changes

- **Description** — full rewrite (see `QS01_Diff_All_Sections.md`)
- **Common Examples** — full rewrite (partial migration split into 5A/5B)
- **Prevention** — restructured into 5 control families
- **Attack Scenarios** — rewritten (TLS version-aware, exfiltration specified,
  HSM/KMS clarified)
- **References** — NIST SP 800-227 added; DORA RTS Art. 6 and Art. 7 added
- **Standards & Regulatory Mapping** — converted to structured taxonomy table
- **Cross-references** — QS04, QS05, QS06, QS07 boundaries clarified

## Issues addressed

- #1 CRQC timeline vs migration milestones
- #2 Confidentiality lifetime definition
- #3 At-rest key hierarchy treatment
- #4 Standards / regulatory mapping taxonomy

## Non-scope (deferred to Discussion / Research)

- Quantitative HNDL risk model
- Re-wrapping vs re-encryption vs key-hierarchy migration patterns
- KMS/HSM migration patterns
- Financial-services prioritization model

## Acceptance criteria

See `02_QS_Audit/QS01/00_Master_Review.md` section 8.
