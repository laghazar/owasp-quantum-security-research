# QS03 Revision Proposal

## Summary

Consolidated revision of QS03 based on the unified QS03 Review findings.
Emphasizes the entry's three candidate contributions (re-establishment failure,
re-signing vs re-issuance, signature assurance lifetime) and addresses
precision, scope, and reference landscape issues.

## Changes

- **Description** — full rewrite:
  - Shor's algorithm precision
  - Cryptographic assumptions (factorization vs discrete log)
  - Trust-chain model rather than leaf-key replacement
  - Signature assurance lifetime defined
  - Retroactive vs prospective exposure
  - Re-establishment failure mode (3 sub-modes)
- **Common Examples** — 8 categorized examples (software/firmware signing,
  PKI trust chains, long-lived artifacts, token/message signatures,
  hardware-anchored trust, verifier-side gaps, fallback, third-party)
- **Prevention** — 8 lifecycle-based control families
- **Attack Scenarios** — 7 scenarios (5 existing extended + 2 new + 2 supplementary additions)
- **References** — FIPS 186-5, RFC 9881, 9882, 9909, 9964, TCG v185, PTP 1.07,
  UEFI Secure Boot, UEFI PQC work, CA/B SC-081, DORA Art. 30 added
- **Standards & Regulatory Mapping** — taxonomy table adopted; TODO resolved
- **Cross-references** — QS01, QS04, QS05, QS06, QS07

## Issues addressed

- #1 Signature forgery risk + signature assurance lifetime
- #2 Trust-chain migration model
- #3 Long-lived signed artifacts
- #4 Standards and protocol references update

## Non-scope (Discussion / Research)

- Quantitative signature-trust exposure model
- Re-establishment failure detection tooling
- Verifier population migration patterns
- TPM/UEFI PQC field-upgrade constraints

## Acceptance criteria

See `02_QS_Audit/QS03/00_Master_Review.md` section 9.
