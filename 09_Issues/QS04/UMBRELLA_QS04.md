# QS04 Umbrella Issue — Cryptographic Discovery and Inventory: Core Scope, Representation, and Coverage Controls

**Status:** Review Complete (Evidence validation pending)
**Type:** Umbrella Issue consolidating 4 supporting findings
**Related OBS:** QS04-OBS-001 to 052 (52 findings)
**Supporting files:** `09_Issues/QS04/supporting/` (4 files)

---

## Summary

QS04 (Cryptographic Discovery and Inventory Gaps) is the foundational
entry for the migration surface. It requires core scope definition,
CBOM representation precision, and inventory coverage controls. This
Issue consolidates the 4 supporting findings as a single contribution
proposal.

## Problem

1. **Discovery and dependency mapping.** The entry focuses on CBOM
   existence but does not distinguish discovery, inventory, CBOM,
   dependency mapping, and risk assessment. Dependency mapping should
   be promoted to core.
2. **CBOM representation.** The entry cites "CycloneDX or SPDX
   cryptographic extensions." CycloneDX CBOM is now v1.7. SPDX has no
   equivalent standalone cryptographic profile. The claim should be
   rephrased.
3. **Unsupported blocker claim.** The entry states "the single most
   common blocker to PQC migration in 2026" without survey evidence.
4. **Inventory coverage and false assurance.** Incomplete inventory
   believed to be complete is a false-assurance risk. The entry does
   not provide coverage, evidence, or freshness metrics.

## Proposed Changes

### Change 1 — Discovery, inventory, CBOM, dependency map (Critical)

**Proposed model:**

    Discovery
       ->
    Inventory
       ->
    CBOM
       ->
    Dependency Graph
       ->
    Risk Assessment

Reference to `supporting/01_Discovery_and_Dependency_Mapping.md`.

### Change 2 — CycloneDX v1.7 + SPDX precision (Critical)

**Proposed wording:**
> "Adopt a machine-readable CBOM representation, using an established
> model such as CycloneDX v1.7 (current) where appropriate, or a
> clearly defined standards-based extension for other BOM ecosystems."

Reference to `supporting/02_CBOM_Representation_and_SPDX.md`.

### Change 3 — Remove unsupported blocker claim (Critical)

**Current:**
> "The absence of a structured cryptographic bill of materials (CBOM)
> is the single most common blocker to PQC migration in 2026."

**Proposed:**
> "The absence of a structured cryptographic inventory and dependency
> map can become a major blocker to PQC migration because organisations
> cannot reliably prioritise systems they cannot identify or map."

Reference to `supporting/03_Unsupported_Blocker_Claim.md`.

### Change 4 — Inventory coverage and false assurance (Very High)

Add coverage, evidence, and freshness metrics:

    Inventory Coverage =
      Known Cryptographic Assets / Estimated Cryptographic Assets

    Dependency Coverage =
      Mapped Dependencies / Known Dependencies

    Evidence Coverage =
      Verified Records / Total Records

    Freshness =
      % Records Verified Within Defined Interval

Reference to `supporting/04_Inventory_Coverage_and_False_Assurance.md`.

## Acceptance Criteria

See `02_QS_Audit/QS04/00_Master_Review.md` section 11.

## Evidence Base

- UK NCSC PQC timelines
- CISA / NSA / NIST Quantum-Readiness fact sheet
- CycloneDX CBOM v1.7 + Cryptography Registry
- NIST IR 8547
- DORA Article 9 + RTS Art. 6/7
- SPDX (adjacent BOM ecosystem)

## Cross-Entry Relationships

- QS04 <-> QS01: inventory foundation (Established)
- QS04 <-> QS03: inventory foundation (Established)
- QS04 <-> QS05: enabler (Established)
- QS04 <-> QS06: input (Established)
- QS04 <-> QS07: hardware inventory (Established)

## Disposition

Proposed as a single focused PR. Three critical corrections + coverage
framework. Internal Review Priority labels are internal only.