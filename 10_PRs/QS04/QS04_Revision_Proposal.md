# QS04 Revision Proposal

## Summary

Consolidated revision of QS04 based on the unified review findings.
Repositions the entry from "Absent Cryptographic Inventory and CBOM" to
"Cryptographic Discovery and Inventory Gaps," and addresses terminology,
dependency mapping, evidence model, and reference precision.

## Changes

- **Title** — "Cryptographic Discovery and Inventory Gaps" (from "Absent
  Cryptographic Inventory and CBOM")
- **Description** — full rewrite:
  - Discovery / inventory / CBOM / SBOM distinguished
  - Three-layer scope (asset / usage / dependency)
  - Dependency mapping promoted to core
  - Evidence / provenance / freshness
  - False assurance risk
- **Common Examples** — 10 categorized examples (partial/stale, missing usage
  context, one-time discovery, hardware blind spots, third-party omitted,
  no dependency mapping, false migration completion, unverified vendor
  claims, dynamic/ephemeral, legacy protocols)
- **Prevention** — 12 lifecycle-based control families:
  1. Structured inventory
  2. Explicit scope
  3. Combined discovery mechanisms
  4. Dependency mapping
  5. Evidence and confidence
  6. Lifecycle and migration metadata
  7. Continuous inventory
  8. Coverage and freshness metrics
  9. Inventory protection
  10. Hardware and third-party validation
  11. Nomenclature normalization
  12. CBOM/SBOM distinction
- **Attack Scenarios** — 4 scenarios (2 extended + 2 new)
- **References** — CycloneDX Registry, CycloneDX use cases added; SPDX
  rephrased; NCSC / EU roadmap scope-qualified
- **Standards & Regulatory Mapping** — taxonomy table adopted; TODO resolved
- **Cross-references** — QS01, QS03, QS05, QS06, QS07

## Issues addressed

- #1 Cryptographic discovery and dependency mapping as core
- #2 CBOM representation / SPDX correction
- #3 Unsupported "single most common blocker" claim
- #4 Inventory coverage, evidence, false-assurance controls

## Non-scope (Discussion / Research)

- Inventory freshness metrics operationalization
- CBOM schema interoperability
- Cloud KMS visibility models
- Dynamic / ephemeral asset treatment
- Cryptographic Asset Risk Register integration with GRC

## Acceptance criteria

See `02_QS_Audit/QS04/00_Master_Review.md` section 11.
