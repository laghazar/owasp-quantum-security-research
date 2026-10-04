# QS03 Umbrella Issue — Signature Trust: Re-establishment, Assurance Lifetime, and Reference Modernization

**Status:** Review Complete (Evidence validation pending)
**Type:** Umbrella Issue consolidating 4 supporting findings
**Related OBS:** QS03-OBS-001 to 040 (40 findings)
**Supporting files:** `09_Issues/QS03/supporting/` (4 files)

---

## Summary

QS03 (Vulnerable Signatures and Code-Signing) contains three candidate
conceptual enhancements and requires reference modernization. This
Issue consolidates the 4 supporting findings as a single contribution
proposal.

## Problem

1. **Signature assurance lifetime.** The period during which a relying
   party needs confidence in a signature is distinct from artifact
   retention. QS03 uses Mosca's inequality with Y undefined.
2. **Trust-chain migration.** A signature migration must be assessed
   as a trust-chain migration, not a leaf-key replacement.
3. **Re-establishment failure.** Migration can complete correctly on
   every cryptographic measure while the issuance flow accepted a
   compromised anchor. This is a novel failure mode.
4. **Reference modernization.** QS03 should reflect current IETF RFCs
   (9881, 9882, 9909, 9964), TCG TPM 2.0 v185, UEFI PQC work, and
   CA/B Forum Ballot SC-081.

## Proposed Changes

### Change 1 — Signature assurance lifetime (Very High)

Introduce the concept as a distinct risk dimension.

**Proposed definition:**
> "Signature assurance lifetime is the period during which a relying
> party needs confidence that a signature provides reliable evidence
> of the authenticity and integrity of the signed artifact or
> assertion."

Reference to `supporting/01_Signature_Assurance_Lifetime.md`.

### Change 2 — Trust-chain migration model (Very High)

**Proposed addition:**
> "A signature migration must be assessed as a trust-chain migration,
> not a leaf-key replacement."

Reference to `supporting/02_Trust_Chain_Migration.md`.

### Change 3 — Re-establishment failure (Very High)

Elevate to distinct section. Three sub-modes: trust re-establishment
failure, cryptographic migration failure, key lifecycle migration
failure.

Reference to `supporting/03_Long_Lived_Signed_Artifacts.md` (which
includes the re-establishment framework).

### Change 4 — Reference modernization (High)

Add:
- RFC 9881 (ML-DSA in X.509)
- RFC 9882 (ML-DSA in CMS)
- RFC 9909 (SLH-DSA in X.509)
- RFC 9964 (ML-DSA for JOSE/COSE)
- TCG TPM 2.0 v185
- TCG PTP 1.07
- UEFI PQC work (2026)
- CA/Browser Forum Ballot SC-081
- DORA Article 30

Reference to `supporting/04_Reference_Modernization.md`.

## Acceptance Criteria

See `02_QS_Audit/QS03/00_Master_Review.md` section 9.

## Evidence Base

- NIST FIPS 204, 205, 186-5, SP 800-208
- RFC 9881, 9882, 9909, 9964
- TCG TPM 2.0 v185, PTP 1.07
- UEFI Secure Boot + PQC work
- CA/Browser Forum Ballot SC-081
- DORA Articles 28-44
- CycloneDX v1.7

## Cross-Entry Relationships

- QS03 <-> QS01: HNDL parallel (Established)
- QS03 <-> QS04: inventory foundation (Established)
- QS03 <-> QS07: TPM/UEFI hardware anchors (Established)

## Disposition

Proposed as a single focused PR. Three candidate contributions
(signature assurance lifetime, trust-chain migration, re-establishment
failure) plus reference modernization. Internal Review Priority labels
are internal only.