# QS04 — Reference Links Audit (FULL, unified)

Audit chain: Claim -> Reference -> Evidence -> Supports claim? -> Scope -> Status -> Keep/Replace/Add

## Current QS04 references (5) + additions (3)

| # | Source | Keep? | Assessment |
|---|---|---|---|
| 1 | UK NCSC PQC Timelines | Keep | 2028 discovery/assessment milestone. Scope: UK / broader reference. |
| 2 | EU Coordinated PQC Roadmap | Keep with qualification | End-2026 inventory/dependency-map, scoped to Member States coordination. |
| 3 | CISA, NSA, NIST Quantum-Readiness fact sheet | Keep | Aug 2023. Cryptographic inventory recommendation. Verify exact title/date. |
| 4 | CycloneDX CBOM | Keep and expand | Current model: cryptographic-asset types, relationships. Specify version 1.6+. |
| 5 | NIST IR 8547 (Draft) | Keep with label | Lifecycle management for transition planning. |
| 6 | CycloneDX Cryptography Registry | ADD | Canonical machine-readable naming for algorithms/curves. |
| 7 | CycloneDX cryptographic-key / certificate use cases | ADD | Field-level inventory modeling examples. |
| 8 | SPDX specification (conformance/profiles) | REPHRASE | Current wording implies SPDX has CBOM-equivalent extension; verify or rephrase. |

---

## Detailed assessment

### 1. UK NCSC — PQC Migration Timelines

**Claim in QS04:** "NCSC 2028 discovery-and-assessment milestone."

**Assessment:** KEEP — scope-qualified

NCSC guidance:
- 2028: full discovery and assessment + initial migration plan
- 2031: highest-priority migration
- 2035: full migration target

NCSC explicitly states discovery should cover:
- services and applications
- data
- in-transit / at-rest protection
- systems and assets
- cloud and managed service providers
- suppliers
- long-lived hardware dependencies

**Scope precision:** This is UK NCSC migration guidance, not a universal
compliance deadline.

**Proposed wording:**
> "UK NCSC migration guidance places full cryptographic discovery and
> assessment at the 2028 milestone, prior to prioritised migration from 2031
> and full migration target 2035."

---

### 2. EU Coordinated PQC Roadmap

**Claim in QS04:** "End-2026 inventory and dependency-map requirement."

**Assessment:** KEEP WITH QUALIFICATION

The European Commission's coordinated implementation roadmap is a
**Member State coordination framework**, not directly binding regulation on
every company.

**Scope precision:** Do not present as directly binding regulation.

**Proposed wording:**
> "The EU coordinated PQC roadmap identifies cryptographic asset management,
> dependency mapping, and transition planning as key readiness activities for
> Member States, with a start-transition milestone by end-2026."

---

### 3. CISA / NSA / NIST — Quantum-Readiness fact sheet

**Claim in QS04:** "Cryptographic inventory recommendation."

**Assessment:** KEEP — verify title and date

Verify:
- Exact title
- Correct date (August 2023 per current draft)
- Correct authorship (CISA + NSA + NIST)
- Reference URL

The fact sheet explicitly recommends organizations: develop a roadmap,
conduct inventories, perform risk assessments, engage vendors. Cryptographic
discovery should include systems/assets that create or validate digital
signatures — including software and firmware updates.

**Action:** Verify from official source. If title/date is imprecise, correct
in the reference list.

---

### 4. CycloneDX CBOM

**Claim in QS04:** "Cryptography Bill of Materials schema."

**Assessment:** KEEP AND EXPAND

Current CycloneDX CBOM model explicitly includes:
- cryptographic-asset type
- algorithm
- protocol
- certificate
- key
- token
- secret
- relationships

**Version precision:** Specify CycloneDX 1.6 or later. CBOM support was
formally added in CycloneDX 1.6 (2024).

**Proposed wording:**
> "Adopt a standardized CBOM schema such as CycloneDX 1.6+ CBOM. Field-level
> interoperability with other schemas (e.g., SPDX) is incomplete; standardize
> on one schema and note the mapping when exchanging data with third parties."

---

### 5. NIST IR 8547 (Draft)

**Claim in QS04:** "Lifecycle management for transition planning."

**Assessment:** KEEP WITH LABEL

Initial Public Draft, 12 November 2024. Transition planning document.

**Proposed wording:**
> "NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
> Cryptography Standards. Transition planning guidance, not a normative
> standard."

---

### 6. CycloneDX Cryptography Registry — ADD

**Reason:** The Registry provides canonical machine-readable definitions for
algorithms, curves, and cryptographic primitives. It solves the naming
inconsistency problem (RSA vs RSA-2048 vs RSA2048 vs RSASSA-PKCS1-v1_5).

**Relevance:** Supports QS04-OBS-027 (normalization / canonical naming) and
QS04-OBS-028.

---

### 7. CycloneDX use case documentation — ADD

**Reason:** CycloneDX publishes dedicated inventory-management use cases for
cryptographic keys and cryptographic certificates. These provide
field-level modeling examples:
- algorithm, primitive, parameter set, crypto functions
- execution environment, implementation platform
- quantum security level
- state, size, format
- creationDate, activationDate, expirationDate
- securedBy, relatedCryptographicAssets

**Relevance:** Supports QS04-OBS-029 (use current CBOM fields).

---

### 8. SPDX specification — REPHRASE

**Current QS04 wording:**
> "aligning with CycloneDX or SPDX cryptographic extensions"

**Problem:** Current SPDX specification has profiles and extension mechanisms,
but the current draft statement implies an SPDX cryptographic profile
equivalent to CycloneDX CBOM without verifiable support.

**Proposed wording:**
> "Adopt a machine-readable cryptographic inventory representation, using an
> established CBOM model such as CycloneDX where appropriate, or a clearly
> defined standards-based extension or representation for other BOM
> ecosystems."

This preserves vendor neutrality and avoids misattribution to SPDX.

---

## Findings

**OBS-004 — SPDX claim unsupported.** Rephrase or remove SPDX CBOM-equivalence
wording.

**OBS-005 — Use current CycloneDX model.** Specify CBOM asset types and
relationships.

**OBS-007 — Version precision.** Specify CycloneDX 1.6+.

**OBS-009 — CISA/NSA/NIST fact sheet verification.** Verify title and date
before submission.

**OBS-043 — NCSC scope.** 2028 milestone is UK NCSC guidance, not universal
deadline.

**OBS-044 — EU roadmap scope.** Coordination framework, not binding
regulation on every company.

---

## Reference Architecture — proposed final set

### Primary references
- UK NCSC — Timelines for migration to post-quantum cryptography
- CISA / NSA / NIST — Quantum-Readiness: Migration to Post-Quantum
  Cryptography fact sheet
- NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
  Cryptography Standards
- EU Coordinated Implementation Roadmap for the Transition to PQC

### CBOM / inventory references
- CycloneDX CBOM specification (1.6+)
- CycloneDX Cryptography Registry
- CycloneDX cryptographic key inventory use case
- CycloneDX cryptographic certificate inventory use case

### Adjacent BOM references
- SPDX specification (profiles and extension mechanisms)
- SBOM / SBOM-adjacent guidance (to be cross-referenced, not conflated)

### EU regulatory references
- NIS2 Article 21(2)(h) — cryptography and encryption policies
- DORA Article 9 — ICT risk management
- DORA RTS Art. 6 — encryption and cryptographic controls
- DORA RTS Art. 7 — cryptographic key lifecycle
- CRA Annex I — products with digital elements security requirements
