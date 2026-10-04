# QS01 Umbrella Issue — HNDL Exposure: Technical Precision, Scope, and Regulatory Mapping

**Status:** Review Complete (Evidence validation pending)
**Type:** Umbrella Issue consolidating 4 supporting findings
**Related OBS:** QS01-OBS-002, 003, 005, 007, 012, 013, 014, 016, 017, 019, 020, 021, 022, 023, 024, 025, 026, 027, 028, 029
**Supporting files:** `09_Issues/QS01/supporting/` (4 files)

---

## Summary

QS01 (Harvest-Now-Decrypt-Later Exposure) is technically sound but requires
precision, scope, and taxonomy refinements across 5 thematic clusters.
This Issue consolidates the 4 supporting findings as a single
contribution proposal.

## Problem

QS01's core HNDL model is correct. However:

1. **Timeline framing.** The entry presents 2030-2035 as "CRQC planning
   horizon most regulators use." The cited NCSC/EU materials are PQC
   **migration milestones**, not CRQC arrival forecasts.
2. **Confidentiality lifetime.** The term is used without definition.
   Readers may interpret it as retention period. They are not the same.
3. **At-rest treatment.** The entry jumps from "RSA/ECC wrapping" to
   "future quantum attack" to "decrypt archive", without addressing
   the key hierarchy (DEK, KEK, KMS, HSM) that real enterprises deploy.
4. **Cryptographic terminology.** "RSA/ECDH" collapses two different TLS
   constructions (RSA key transport vs (EC)DHE). TLS 1.3 removed static
   RSA. Forward secrecy is not post-quantum security.
5. **Regulatory mapping taxonomy.** The Standards and Regulatory Mapping
   section mixes standards, drafts, guidance, roadmaps, memoranda,
   algorithm suites, directives, and regulations in one list.

## Proposed Changes

### Change 1 — CRQC timeline vs migration milestones (Critical)

**Current:**
> "CRQC planning horizon most regulators use (2030-2035)"

**Proposed:**
> "Data sets whose confidentiality lifetime, combined with migration
> lead time, extends beyond the organisation's assessed quantum-risk
> horizon."

Reference to `supporting/01_CRQC_Timeline_vs_Migration_Milestones.md`.

### Change 2 — Confidentiality lifetime definition (Very High)

**Proposed definition:**
> "Confidentiality lifetime is the period during which unauthorized
> disclosure of the data would remain materially harmful or
> unacceptable, and should be assessed separately from the retention
> period."

Reference to `supporting/02_Confidentiality_Lifetime_Definition.md`.

### Change 3 — At-rest key hierarchy treatment (High)

**Proposed addition:**
> "For stored data, assess the full key hierarchy protecting the
> ciphertext, including data-encryption keys, key-encryption or
> wrapping keys, KMS/HSM dependencies, and recovery mechanisms."

Reference to `supporting/03_At_Rest_Key_Hierarchy_Treatment.md`.

### Change 4 — Regulatory mapping taxonomy (High)

Convert the flat list to a structured table with columns:
Source / Type / Jurisdiction-Scope / QS01 relevance.

Reference to `supporting/04_Standards_Regulatory_Mapping_Taxonomy.md`.

## Acceptance Criteria

See `02_QS_Audit/QS01/00_Master_Review.md` section 8.

## Evidence Base

- NIST FIPS 203, SP 800-227, IR 8547 (draft)
- UK NCSC PQC timelines
- EU Coordinated PQC Roadmap
- CISA / NSA / NIST Quantum-Readiness fact sheet
- DORA RTS Articles 6 and 7
- CycloneDX CBOM v1.7

## Cross-Entry Relationships

- QS01 <-> QS04: inventory foundation (Established)
- QS01 <-> QS05: agility enablement (Established)
- QS01 <-> QS06: fallback exposure (Established)
- QS01 <-> QS07: hardware constraints (Established)


## Regulatory Context Reference

Standards and Regulatory Mapping sources for this entry are classified
per the landscape-wide taxonomy in:

    08_Standards_Regulation/Landscape_Regulatory_Context.md

Per-entry regulatory mapping table:

    08_Standards_Regulation/QS01_Regulatory_Mapping_Table.md

The taxonomy distinguishes source types (Standard, Draft, Guidance,
Policy, Roadmap, Directive, Regulation, RTS, Industry specification,
Research). The non-mandate rule applies: no cited source mandates a
specific algorithm unless its implementing requirement establishes
that obligation.

## Disposition

Proposed as a single focused PR with the 4 supporting findings as
evidence trail. Internal Review Priority labels are internal only and
not carried forward.