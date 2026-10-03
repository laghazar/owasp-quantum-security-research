---
Title: QS03: Update Signature Standards and Protocol References
Labels: quantum-security, QS03, references, high
Priority: High
Related OBS: QS03-OBS-025, 026, 027, 028, 029, 032, 033, 034, 035, 036, 037, 038, 039
Status: draft
---

## Problem

QS03 should reflect the current post-quantum signature standards and protocol
work rather than relying mainly on generic references.

## Proposed additions

### Primary standards
- NIST FIPS 204 — ML-DSA (Final, August 2024; errata note)
- NIST FIPS 205 — SLH-DSA (Final, August 2024)
- NIST FIPS 186-5 — classical signature baseline
- NIST SP 800-208 — LMS/XMSS stateful hash-based signatures (Final, October 2020)

### IETF standards
- RFC 9881 — ML-DSA in X.509 (October 2025)
- RFC 9882 — ML-DSA in CMS (October 2025)
- RFC 9909 — SLH-DSA in X.509 (December 2025)
- RFC 9964 — ML-DSA for JOSE and COSE (May 2026)

### Platform specifications
- TCG TPM 2.0 v185 — PQC support (ML-KEM, ML-DSA, Attestation Keys)
- TCG PTP 1.07 — ML-DSA in PC Client TPM profile
- UEFI Secure Boot — firmware / code-signing trust
- UEFI PQC work (2026)
- CA/Browser Forum Ballot SC-081 — TLS certificate lifetime reduction

### EU regulatory
- NIS2 Article 21(2)(h)
- DORA Articles 28-44 (esp. Article 30)
- CRA Annex I

## Specific corrections

- OBS-025 — Add modern IETF references
- OBS-026 — Note FIPS 204 errata status
- OBS-027 — SP 800-208 final status
- OBS-028 — Add TPM 2026 PQC support
- OBS-029 — Add UEFI PQC direction
- OBS-032 — CA/B Forum staged timeline precision
- OBS-033 — CNSA 2.0 scope precision
- OBS-034 — NSA FAQ document number verification
- OBS-035 — NCSC ML-DSA-65 claim verification
- OBS-036 — CNSA 2.0 timeline precision
- OBS-037 — CRA qualification
- OBS-038 — DORA Art. 30 emphasis
- OBS-039 — Mapping TODO resolution

## Each reference should be classified

Source | Type | Scope | Relevance

## Acceptance

- All modern IETF RFCs added
- Platform specifications added
- Regulatory references scoped
- Taxonomy table applied
- Unverifiable references removed or rephrased
