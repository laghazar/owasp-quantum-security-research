# QS04 — Full Diff (before / after, all sections)

Full "after" text: 02_QS_Audit/QS04/05_Proposed_Text.md

---

## Title

### Before
QS04:2026 — Absent Cryptographic Inventory and CBOM

### After
QS04:2026 — Cryptographic Discovery and Inventory Gaps

### Changes
- "Absent" replaced with "Gaps" (nuanced: partial / stale / fragmented /
  non-authoritative / unconnected)
- "Cryptographic Discovery" added (process, not just artifact)

---

## Description

### Before
- "Organisations cannot migrate cryptography they have not catalogued."
- Focus on CBOM existence
- "single most common blocker" empirical claim
- No discovery/inventory/CBOM distinction
- No dependency mapping core
- No evidence / provenance
- No false assurance

### After
See 05_Proposed_Text.md -> Description (7 paragraphs).

### Changes
- Discovery / inventory / CBOM / SBOM distinguished
- Three-layer scope introduced (asset / usage / dependency)
- Multiple discovery sources model
- Dependency mapping promoted to core
- Living inventory model with evidence / freshness / coverage
- False assurance risk explicit
- Migration completeness as control metric

---

## Common Examples

### Before
5 examples (unstructured record, missing classes, one-time, no custody,
firmware/silicon).

### After
10 examples.

### Changes
- Partial or stale inventory
- Algorithm inventory without usage context
- One-time discovery
- Hardware and embedded blind spots
- Third-party and SaaS omitted
- No dependency mapping
- False migration completion
- Unverified vendor claims
- Dynamic / ephemeral profile not captured
- Legacy protocols unmanaged

---

## How to Prevent

### Before
5 items: CBOM adoption, discovery tooling, named owners, living document,
key generation/custody/rotation/revocation.

### After
12 control families:
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
12. CBOM / SBOM distinction

### Changes
- Lifecycle-based rather than CBOM-focused
- Discovery tooling taxonomy with limitations
- Evidence / confidence / freshness modeled
- Dependency mapping explicit
- False assurance addressed
- Third-party and cloud KMS coverage
- Inventory protection
- Nomenclature normalization (CycloneDX Registry)
- CBOM / SBOM boundary

---

## Example Attack Scenarios

### Before
2 scenarios (forgotten CA + firmware, SaaS TLS).

### After
4 scenarios:
1. Forgotten cryptographic trust dependency (extended with dependency graph)
2. Unmanaged SaaS dependency (extended with provider visibility model)
3. False migration completion caused by incomplete coverage (new)
4. Vendor-declared PQC readiness not validated (new)

### Changes
- Forgotten-asset realism (M&A, shadow IT, partner cross-signing)
- Dependency-graph failure mode explicit
- SaaS boundary kept within QS04
- Migration completeness scenario
- Vendor-declared vs observed vs verified model

---

## Reference Links

### Before
5 references, mixed types, SPDX claim unverified.

### After
4 categories:
- Government migration guidance (NCSC, CISA/NSA/NIST, EU Roadmap)
- Standards and specifications (NIST IR 8547, CycloneDX CBOM 1.6+,
  CycloneDX Registry, CycloneDX use cases, SPDX)
- EU regulatory references (NIS2, DORA Art. 9, DORA RTS Art. 6/7,
  DORA Art. 30, CRA Annex I)

### Changes
- CycloneDX Registry added
- CycloneDX key / certificate use cases added
- CycloneDX version specified (1.6+)
- SPDX rephrased (not CBOM-equivalent)
- NCSC scope-qualified (UK guidance)
- EU roadmap scope-qualified (Member State coordination)

---

## Standards and Regulatory Mapping

### Before
TODO comment; mixed types; unverified citations.

### After
Taxonomy table with columns: Source / Type / Scope / Relevance.

### Changes
- Converted to structured taxonomy table
- TODO resolved
- NIS2 not presented as CBOM mandate
- DORA Art. 9 / RTS Art. 6 / RTS Art. 7 / Art. 30 scoped
- CRA Annex I qualified (not CBOM mandate)
- NCSC scope qualified
- EU roadmap scope qualified
