# QS04 — Master Review (Unified)

**Entry:** QS04 — Absent Cryptographic Inventory and CBOM
**Review date:** 2026-10-04
**OWASP project:** quantum-security-project/quantum-top-10
**Status:** Review Complete (evidence validation pending) — unified finding register finalized
**Methodology:** Merged analysis from two independent review passes

---

## 1. Review Objective

Review QS04 for:

- Terminology precision (discovery vs inventory vs CBOM vs SBOM)
- Inventory scope definition
- Coverage model (asset classes, usage context, dependency relationships)
- CBOM schema accuracy (CycloneDX, SPDX)
- Cryptographic asset lifecycle treatment (generation ? custody ? rotation ? revocation ? destruction)
- Evidence and provenance model
- Third-party / SaaS / cloud KMS inventory
- Firmware / silicon / embedded key treatment
- Discovery tooling taxonomy and limitations
- Change management and continuous inventory
- Coverage and freshness metrics
- False assurance risk
- Reference accuracy (CycloneDX CBOM, CycloneDX Registry, CISA/NSA/NIST fact sheet, NCSC scope, EU roadmap scope)
- Regulatory mapping precision (NIS2, DORA, CRA)
- Cross-entry boundaries with QS01, QS03, QS05, QS06, QS07

---

## 2. Core Assessment

QS04 is the **foundational entry** in the OWASP Top 10. Without cryptographic
discovery and inventory, QS01, QS03, QS05, QS06, and QS07 all remain
theoretical. The entry correctly identifies this:

> "Organisations cannot migrate cryptography they have not catalogued."

However, the current draft has **three structural problems**:

### Problem 1: Binary framing

The title says "Absent Cryptographic Inventory and CBOM." Reality is more
nuanced. Organizations rarely have "zero inventory" — they have:

    partial     -> some asset classes covered, others missing
    stale       -> aged out within months
    fragmented  -> distributed across teams, no authoritative source
    non-authoritative -> inconsistent naming, conflicting records
    unconnected -> no dependency mapping

The real risk is **visibility gap**, not categorical absence.

### Problem 2: Terminology conflation

The entry uses "cryptographic inventory," "CBOM," and "discovery"
interchangeably. They are distinct:

- **Discovery** = the process (finding cryptography)
- **Inventory** = the record (documenting what was found)
- **CBOM** = the format (structured, machine-readable representation)
- **SBOM** = adjacent but distinct (software components, not crypto assets)

### Problem 3: Unsupported empirical claim

> "The absence of a structured cryptographic bill of materials (CBOM) is the
> single most common blocker to PQC migration in 2026."

This is a strong empirical claim without survey or research evidence. Must be
softened or evidenced.

### Additional issues

- SPDX cryptographic-extension claim unsupported
- Dependency mapping treated as context rather than core
- Evidence / provenance / freshness not modeled
- False assurance risk not addressed
- Third-party and cloud KMS visibility model missing
- Firmware / silicon embedded key language too absolute
- Inventory protection not addressed
- Migration status tracking missing
- CBOM vs SBOM boundary not explicit

---

## 3. Priority Findings Summary

- **Critical:** 4 (QS04-OBS-002, 023, 025, 004)
- **Very High:** 18
- **High:** 22
- **Medium:** 8
- **Total granular observations:** 52 (46 unified + 6 unique additions)

See `01_Master_Finding_Register.md` for the complete register.

---

## 4. The revised QS04 model

### Discovery ? Inventory ? CBOM ? Dependency Graph ? Risk ? Migration

    Cryptographic Discovery
       |
       | (action)
       v
    Cryptographic Inventory
       |
       | (artifact)
       v
    CBOM
       |
       | (machine-readable format)
       v
    Dependency Graph
       |
       | (relationships)
       v
    Risk Analysis
       |
       v
    Migration Planning
       |
       v
    Continuous Validation

### Inventory scope (three layers)

**Layer 1 — Cryptographic Asset**

    Algorithm
    Key
    Certificate
    Protocol
    Crypto library
    HSM/TPM object
    Trust anchor
    Signing key
    Secret

**Layer 2 — Cryptographic Usage**

    Where is it used?
    For what purpose?
    How?
    With which protocol?
    Which application?
    Which data?
    Which environment?

**Layer 3 — Dependency / Relationship**

    What depends on it?
    Who owns it?
    Which supplier?
    Which business service?
    Which hardware?
    Which certificate chain?
    Which migration blocker?

**CBOM is primarily a representation layer. Inventory is a governance and
discovery capability. These are not the same.**

### The dependency inversion

    QS04 (cryptographic visibility)
      |
      v
    QS01 (HNDL exposure)     +     QS03 (signature/trust exposure)
      |
      v
    QS05 (crypto agility)
      |
      v
    QS06 (secure migration execution)
      |
      v
    QS07 (hardware root constraints)

**Without QS04, the other entries are operational only in theory.**

---

## 5. Inventory lifecycle model

    Discovered
       |
       v
    Active
       |
       v
    Deprecated
       |
       v
    Retired
       |
       v
    Destroyed
       |
       v
    Unknown / Not Assessed

### Continuous inventory mechanisms

    Continuous inventory
       +
    Event-driven updates
       +
    Scheduled discovery
       +
    Reconciliation
       +
    Staleness detection

Examples:

    Certificate created          -> inventory updated
    New service deployed         -> crypto discovery triggered
    New library version          -> crypto dependency rescanned
    HSM key rotated              -> inventory reconciled
    Vendor changed TLS config    -> third-party inventory refreshed
    Application retired          -> crypto dependency retired

---

## 6. Minimum dataset (cryptographic asset record)

Each inventory item should ideally capture:

    Asset ID
    Asset Type
    Algorithm
    Primitive
    Parameters (key length, curve, mode, hash, parameter set)
    Crypto Function (encryption / key establishment / signature / authentication / HMAC)
    Usage Context
    Protocol
    Implementation (OpenSSL / BoringSSL / Java provider / etc.)
    Implementation Version
    Environment (application / service / endpoint / device / container / cloud)
    Key / Certificate ID
    Key State (active / deprecated / retired / compromised)
    Key Custody (self-managed / HSM / KMS / third-party)
    Lifecycle (generation / activation / expiration / rotation / revocation / archival / destruction)
    Owner (business / system / crypto service / key custodian / security)
    Business Service
    Data Protected
    Trust Relationship (which CA, which chain)
    Dependencies (what depends on this)
    Supplier
    Hardware Dependency (TPM / HSM / secure element / firmware / silicon)
    Discovery Source
    Last Observed
    Last Verified
    Confidence
    Quantum Vulnerability
    Migration Status
    Target Mechanism
    Migration Priority
    Migration Blocker
    Risk Acceptance

---

## 7. Coverage and freshness metrics

| Metric | Formula |
|---|---|
| Inventory Coverage | Known crypto assets / Estimated crypto assets |
| Dependency Coverage | Mapped dependencies / Known dependencies |
| Evidence Coverage | Verified records / Total records |
| Freshness | % records verified within defined interval |
| Unknown Crypto Rate | Unknown records / Total records |
| Third-Party Visibility | Assessed third-party crypto / Known third-party crypto |
| Migration Traceability | Assets with migration status / Quantum-vulnerable assets |

Unknown or stale cryptographic dependencies should be treated as **residual
migration risk**, not silently excluded.

---

## 8. Third-party / SaaS / Cloud KMS model

    SaaS / Managed Service / Cloud Provider / API Gateway / CDN / HSMaaS
       |
       v
    Declared            <- contractual requirement, security questionnaire,
       |                   vendor documentation
       v
    Observed            <- API/config evidence, published posture,
       |                   attestation
       v
    Verified            <- independent technical evidence,
                           SOC report, penetration test

### Three-state evidence model

- **Vendor-Declared** — what the vendor claims
- **Observed** — what we can see via APIs / configuration / network
- **Verified** — independently validated

A CBOM that records only "Vendor says PQC-ready" is not evidence.

---

## 9. Cross-entry boundaries (QS04 ? QS01 ? QS03 ? QS05 ? QS06 ? QS07)

| Topic | QS04 | QS01 | QS03 | QS05 | QS06 | QS07 |
|---|---|---|---|---|---|---|
| Discovery | **Primary** | Uses | Uses | Uses | Uses | Uses |
| Inventory | **Primary** | Uses | Uses | Uses | Uses | Uses |
| CBOM | **Primary** | Consumes | Consumes | Consumes | Consumes | Consumes |
| Dependency mapping | **Primary** | Uses | Uses | Uses | Uses | Uses |
| Confidentiality risk | Supports | **Primary** | — | — | — | — |
| Signature risk | Supports | — | **Primary** | — | — | — |
| Crypto agility | Input | — | — | **Primary** | Uses | Uses |
| Migration execution | Input | Uses | Uses | Input | **Primary** | Uses |
| Hardware roots | Input | — | Uses | — | — | **Primary** |
| Third-party crypto | **Primary** | Uses | Uses | Uses | Uses | Uses |
| Key lifecycle | **Primary** | — | — | — | Uses | Uses |
| Migration status tracking | **Primary** | — | — | — | Uses | — |

### Framing questions

- **QS04:** What cryptography do you have, where is it, what depends on it, and how is it maintained?
- **QS01:** What confidentiality HNDL exposure does your inventory reveal?
- **QS03:** What signature/trust exposure does your inventory reveal?
- **QS05:** Can you replace that cryptography?
- **QS06:** Are you migrating securely?
- **QS07:** What hardware-root constraints apply?

---

## 10. Contribution Disposition

### Direct PR
- Terminology precision (discovery / inventory / CBOM / SBOM)
- Inventory scope definition (3-layer model)
- CBOM ? discovery / inventory / dependency map
- SPDX correction
- "Single most common blocker" unsupported claim
- Algorithm parameters (not just key length)
- Asset vs usage separation
- Evidence / provenance / freshness
- Dependency mapping promotion to core
- Third-party / SaaS / cloud KMS model
- Firmware / silicon embedded key approach
- Migration status tracking
- Coverage and freshness metrics
- False assurance risk
- Inventory protection
- Change management expansion
- Cross-entry boundaries
- Regulatory mapping taxonomy
- Attack scenario improvements

### GitHub Issues (4)
- #1 Cryptographic Discovery and Dependency Mapping as core
- #2 CBOM representation / SPDX correction
- #3 Unsupported "single most common blocker" claim
- #4 Inventory coverage, evidence, false-assurance controls

### Discussion / Research
- Inventory freshness metrics operationalization
- CBOM schema interoperability
- Cloud KMS visibility models
- Dynamic / ephemeral asset treatment
- Cryptographic Asset Risk Register integration with GRC

---

## 11. Acceptance Criteria

The QS04 revision is complete when:

- [ ] "Absent" risk defined to include incomplete, stale, fragmented, non-authoritative inventories
- [ ] Cryptographic discovery distinguished from inventory representation
- [ ] CBOM not presented as equivalent to discovery or risk assessment
- [ ] CBOM vs SBOM boundary explicit
- [ ] Inventory scope explicitly defined (3 layers)
- [ ] Algorithms AND relevant parameters captured
- [ ] Cryptographic asset separated from cryptographic usage
- [ ] Dependency relationships captured
- [ ] Evidence source / provenance captured
- [ ] Last observed / last verified / confidence captured
- [ ] Unknown / not-assessed states allowed
- [ ] Inventory freshness measurable
- [ ] HSM / TPM discovery limitations acknowledged
- [ ] Embedded / hardware crypto wording not absolute
- [ ] Third-party / SaaS / cloud KMS dependencies explicitly covered
- [ ] Vendor-declared vs observed vs verified distinguished
- [ ] Key lifecycle represented
- [ ] Migration status represented
- [ ] Inventory completeness measurable
- [ ] False assurance explicitly addressed
- [ ] CBOM / inventory itself protected
- [ ] Secrets / private keys excluded from CBOM
- [ ] Canonical cryptographic naming addressed (CycloneDX Registry)
- [ ] CycloneDX CBOM reference current (1.6+)
- [ ] SPDX wording technically defensible
- [ ] NCSC 2028 milestone correctly scoped
- [ ] EU roadmap correctly scoped (not universal mandate)
- [ ] NIS2 / DORA / CRA not presented as CBOM mandates
- [ ] Dynamic / ephemeral assets addressed
- [ ] Legacy protocol discovery addressed
- [ ] QS01 / QS03 / QS05 / QS06 / QS07 boundaries explicit
