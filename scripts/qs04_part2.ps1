$base = "02_QS_Audit\QS04"
New-Item -ItemType Directory -Force -Path "$base","09_Issues\QS04","10_PRs\QS04" | Out-Null

# ============================================================
# 00_Master_Review.md — FULL (unified)
# ============================================================
Set-Content "$base\00_Master_Review.md" @'
# QS04 — Master Review (Unified)

**Entry:** QS04 — Absent Cryptographic Inventory and CBOM
**Review date:** 2026-10-04
**OWASP project:** quantum-security-project/quantum-top-10
**Status:** Complete — unified finding register finalized
**Methodology:** Merged analysis from two independent review passes

---

## 1. Review Objective

Review QS04 for:

- Terminology precision (discovery vs inventory vs CBOM vs SBOM)
- Inventory scope definition
- Coverage model (asset classes, usage context, dependency relationships)
- CBOM schema accuracy (CycloneDX, SPDX)
- Cryptographic asset lifecycle treatment (generation → custody → rotation → revocation → destruction)
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

### Discovery → Inventory → CBOM → Dependency Graph → Risk → Migration

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

## 9. Cross-entry boundaries (QS04 ↔ QS01 ↔ QS03 ↔ QS05 ↔ QS06 ↔ QS07)

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
- CBOM ≠ discovery / inventory / dependency map
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
'@

# ============================================================
# 01_Master_Finding_Register.md — UNIFIED (52 findings)
# ============================================================
Set-Content "$base\01_Master_Finding_Register.md" @'
# QS04 — Unified Master Finding Register

52 findings (46 unified + 6 unique additions). Not submitted to OWASP directly.
Consolidated into 4 Issues + 1 PR.

---

## 🔴 CRITICAL

### QS04-OBS-001 — "Absent" is too binary

**Type:** Structural
**Disposition:** PR

Real organizations have partial, stale, fragmented, non-authoritative,
unconnected inventories — not zero. Risk is a **visibility gap**.

**Proposed:**
> "Cryptographic Discovery and Inventory Failures" or "Cryptographic
> Inventory and CBOM Gaps"

---

### QS04-OBS-002 — Inventory scope must be operationally defined

**Type:** Gap
**Disposition:** PR + Issue

"Every place cryptography is used" is an aspiration, not an audit scope.
Define three layers: asset / usage / dependency. Enumerate: algorithms,
parameters, cryptographic material, protocols, implementations, deployment
context.

---

### QS04-OBS-003 — CBOM is not discovery / inventory / dependency map

**Type:** Conceptual
**Disposition:** PR + Issue

    Discovery  !=  Inventory  !=  CBOM  !=  Dependency map  !=  Risk assessment

A CBOM can represent inventory data. It cannot discover, risk-assess, or map
dependencies by itself.

**Proposed:**
> "CBOM is a representation model. Discovery is a process. Inventory is a
> governance capability. Dependency mapping is an analytical layer. These
> must not be conflated."

---

### QS04-OBS-004 — SPDX cryptographic-extension claim is unsupported

**Type:** Correction
**Disposition:** Issue + PR

Current:
> "aligning with CycloneDX or SPDX cryptographic extensions"

CycloneDX has an explicit cryptographic-asset model and CBOM capabilities.
SPDX has profiles and extension mechanisms, but no standardized standalone
cryptographic profile equivalent to CycloneDX CBOM.

**Proposed:**
> "Adopt a machine-readable cryptographic inventory representation, using an
> established CBOM model such as CycloneDX where appropriate, or a clearly
> defined standards-based extension or representation for other BOM
> ecosystems."

---

### QS04-OBS-023 — Dependency mapping should be core, not context

**Type:** Structural
**Disposition:** PR + Issue

Crypto Asset -> Component -> Application -> Service -> Business Process -> Data
and
Crypto Asset -> Supplier -> External Service

Dependency graph is necessary for prioritization.

**Proposed:**
> "Dependency mapping is not optional context. It is the primary basis for
> migration prioritization. Two systems using the same algorithm can have
> different priorities based on business criticality, data sensitivity,
> supplier dependency, and migration blocker."

---

### QS04-OBS-025 — "Single most common blocker" is unsupported

**Type:** Correction
**Disposition:** Issue + PR

Current:
> "The absence of a structured cryptographic bill of materials (CBOM) is the
> single most common blocker to PQC migration in 2026."

No survey evidence supports this ranking.

**Proposed:**
> "The absence of a structured cryptographic inventory and dependency map
> can become a major blocker to PQC migration because organisations cannot
> reliably prioritise systems they cannot identify or map."

---

## 🟠 VERY HIGH

### QS04-OBS-005 — Use current CycloneDX cryptographic model

CycloneDX CBOM has explicit cryptographic-asset types: algorithm, protocol,
certificate, key, token, secret, and relationships.

---

### QS04-OBS-006 — Algorithm + key length is insufficient

"ECDSA / 256" does not say which curve, which implementation, which version,
which purpose. Need primitive, parameter set, crypto function, execution
environment, implementation platform, quantum security level.

---

### QS04-OBS-007 — "Key length" -> "algorithm parameters"

Include key length, curve, parameter set, mode, hash, signature scheme, KEM
parameter set, protocol version.

---

### QS04-OBS-008 — Separate asset from usage

Algorithm asset ≠ application usage. CBOM must model "used-by" and
"protects" relationships.

---

### QS04-OBS-009 — Add evidence / provenance

Every record needs: discovery source, discovery timestamp, last verified,
confidence.

---

### QS04-OBS-010 — Living inventory needs operational mechanisms

Continuous inventory + event-driven updates + scheduled discovery +
reconciliation + staleness detection.

---

### QS04-OBS-011 — Inventory freshness metric

% verified within N days, unknown crypto dependency rate, inventory coverage.

---

### QS04-OBS-012 — Discovery tooling limitations

TLS scanner = external posture only. CT logs = public certs only. Code
scanning = source-level only. SBOM dependency = presence, not invocation.
Each has different visibility.

---

### QS04-OBS-013 — CT logs are only one source

Private/internal certificates are not in CT.

---

### QS04-OBS-014 — HSM / TPM discovery constraints

Vendor API, administrative access, object metadata, policy limitations.
Not visible via generic scanners.

---

### QS04-OBS-015 — Embedded-key language too absolute

"cannot be enumerated" -> "may not be fully discoverable through
software-only scanning and may require hardware manifests, manufacturer
evidence, firmware analysis, platform interfaces, or supply-chain
documentation."

---

### QS04-OBS-016 — Third-party / SaaS discovery

Separate method: contractual requirement, security questionnaire, vendor
documentation, attestation, SOC report, API/config evidence.

---

### QS04-OBS-017 — Vendor-declared vs observed vs verified

Three-state model. Vendor documentation ≠ observed truth.

---

### QS04-OBS-018 — Granular ownership model

Business Owner + System Owner + Crypto Service Owner + Key Custodian +
Security Owner + Supplier Owner.

---

### QS04-OBS-019 — Expand key lifecycle

creation, activation, expiration, rotation, backup, recovery, revocation,
suspension, archival, destruction, compromise status.

---

### QS04-OBS-020 — Inventory migration status tracking

Quantum vulnerability, migration priority, migration status, target
algorithm, target date, dependency, blocker, risk acceptance.

---

### QS04-OBS-021 — Explicit unknown state

Allow "Unknown", "Not assessed", "Not observable", "Vendor-controlled",
"Not applicable". Unknown itself is a risk indicator.

---

### QS04-OBS-022 — Feed QS01 / QS03 risk models

QS04 must include fields that QS01 and QS03 need.

---

### QS04-OBS-024 — Dependency graph > simple asset list

Prioritization requires relationship data.

---

### QS04-OBS-027 — Normalization / canonical naming

RSA vs RSA-2048 vs RSA2048 vs RSASSA-PKCS1-v1_5 — same asset. Normalize via
canonical vocabulary, preserve original for traceability.

---

### QS04-OBS-033 — Migration-completeness scenario

90% coverage -> migration declared complete -> 10% unknown estate with
critical dependencies.

---

### QS04-OBS-034 — False assurance risk

Incomplete inventory believed to be complete is more dangerous than no
inventory. Governance risk.

---

### QS04-OBS-035 — Coverage / confidence metrics

Inventory coverage, dependency coverage, evidence coverage, freshness.

---

### QS04-OBS-047 — CBOM vs SBOM boundary (UNIQUE)

**Type:** Structural / Clarification
**Disposition:** PR

SBOM records software components. CBOM records cryptographic assets. They are
related but distinct artifacts with different audiences, schemas, and
lifecycle. A CBOM may reference SBOM components (which library provides this
algorithm?) but serves a different function. Both should be maintained
separately and cross-referenced.

**Proposed addition:**
> "CBOM and SBOM are related but distinct. SBOM records software components
> and their origins. CBOM records cryptographic assets, algorithms, key
> lengths, and key lifecycle. Both should be maintained and cross-referenced;
> neither substitutes for the other."

---

### QS04-OBS-048 — Dynamic / ephemeral crypto assets (UNIQUE)

**Type:** Gap
**Disposition:** PR

Discovery must distinguish persistent assets (long-lived keys, certificates,
signing keys) from ephemeral assets (per-session TLS keys, ephemeral
key-establishment keys, short-lived tokens). Ephemeral assets are less
inventory-critical individually but determine the cryptographic algorithm
profile of the system.

**Proposed addition:**
> "Inventory should distinguish persistent cryptographic assets from
> ephemeral cryptographic usage. Persistent assets (keys, certificates,
> trust anchors, signing keys) drive migration planning. Ephemeral usage
> (per-session TLS keys, ephemeral DH, short-lived tokens) determines the
> algorithm and protocol profile and must be inventoried at the profile
> level, even if individual ephemeral values are not individually tracked."

---

## 🟠 HIGH

### QS04-OBS-026 — Inventory itself needs protection

CBOM may contain key identifiers, certificate identities, trust anchors,
HSM info, internal service relationships. Never place private keys, API
secrets, passwords, raw secret values.

---

### QS04-OBS-028 — Add CycloneDX Cryptography Registry

Canonical naming/classification for algorithms and curves.

---

### QS04-OBS-029 — Use current CBOM fields

Algorithm, primitive, parameter set, crypto functions, execution environment,
implementation platform, quantum security level, state, size, format,
creation/activation/expiration date, securedBy, relatedCryptographicAssets.

---

### QS04-OBS-030 — Preserve vendor neutrality

"Use CycloneDX where appropriate" — not "Everyone MUST use CycloneDX."

---

### QS04-OBS-031 — Improve forgotten-asset scenario

Show dependency-graph failure, not just "forgotten asset."

---

### QS04-OBS-032 — Keep SaaS scenario within QS04 boundary

Primary consequence in QS04 = "not inventoried, not risk assessed, not
prioritized, not migrated." HNDL is downstream.

---

### QS04-OBS-036 — Inventory is governance capability

Technical system + governance process + ownership + change management +
supplier management + risk management.

---

### QS04-OBS-037 — Expand change management integration

CMDB, PKI lifecycle, certificate issuance, KMS events, HSM changes, cloud
deployment, IaC, software release, vendor onboarding, vendor renewal,
hardware procurement, decommissioning.

---

### QS04-OBS-040 — QS05 boundary

QS04: What exists? What depends on it? What blocks migration?
QS05: How agile is the architecture?

---

### QS04-OBS-041 — QS06 boundary

Provide current algorithm, target algorithm, protocol, implementation,
fallback, verifier, vendor, hardware, dependency.

---

### QS04-OBS-042 — QS07 hardware fields

Hardware-backed yes/no, TPM/HSM/secure element, firmware version, PQC
capability, update path, end-of-support.

---

### QS04-OBS-043 — NCSC scope precision

NCSC 2028 is a UK NCSC migration milestone, not a universal deadline.

---

### QS04-OBS-044 — EU roadmap scope precision

EU roadmap is coordinated implementation roadmap for Member States, not
directly binding regulation on every company.

---

### QS04-OBS-045 — CISA/NSA/NIST reference strength

Factsheet says: develop roadmap, conduct inventories, perform risk
assessments, engage vendors.

---

### QS04-OBS-046 — Regulatory mapping precision

NIS2 does not mandate CBOM. DORA does not mandate CBOM. Frame as
implementation mechanism for cryptographic risk management.

---

### QS04-OBS-049 — CBOM in software supply chain (UNIQUE)

**Type:** Extension
**Disposition:** PR

**Proposed addition:**
> "Where software, firmware, or services are acquired externally, vendor
> CBOMs should be treated as procurement inputs, on par with SBOMs. Where
> vendor CBOMs are not available, the customer organisation retains the
> responsibility for discovery, but may need to rely on
> contractual assurance, technical testing, or supplier attestation."

---

### QS04-OBS-050 — Cloud KMS visibility model (UNIQUE)

**Type:** Extension
**Disposition:** PR

**Proposed addition:**
> "Cloud-managed key services (AWS KMS, Azure Key Vault, Google Cloud KMS,
> and equivalents) present a specific visibility challenge: the provider
> controls the HSM, the key material, and rotation policies. Inventory
> should record: key identifier, key purpose, algorithm, provider-managed
> or customer-managed, region, rotation policy, access policy, and any
> provider-declared cryptographic lifecycle. Provider's algorithm
> capabilities and migration roadmap must be recorded separately from the
> customer's own cryptographic dependencies."

---

### QS04-OBS-051 — Legacy protocol discovery (UNIQUE)

**Type:** Extension
**Disposition:** PR

**Proposed addition:**
> "Discovery should include legacy protocols and configurations that use
> deprecated cryptography: SSL 3.0, TLS 1.0/1.1, SSHv1, IPsec with weak
> Diffie-Hellman groups, deprecated cipher suites, and obsolete certificate
> algorithms. Legacy protocol presence is often a sign of unmanaged
> cryptographic dependencies."

---

### QS04-OBS-052 — CRA regulatory mapping (UNIQUE)

**Type:** Regulatory precision
**Disposition:** PR

**Proposed addition:**
> "The EU Cyber Resilience Act applies to products with digital elements
> and includes requirements for security of cryptographic mechanisms.
> Cryptographic inventory and dependency mapping provide implementation
> mechanisms for identifying cryptographic dependencies in products placed
> on the EU market, but the CRA does not explicitly mandate a CBOM."

---

## 🟡 MEDIUM

### QS04-OBS-038 — Replacement lifecycle

Application A retired, B replaces it — inventory must reflect both.

---

### QS04-OBS-039 — Decommissioning

Discovered / Active / Deprecated / Retired / Destroyed / Unknown. Verify
that retired crypto is truly revoked.

---

## Summary table

| ID | Finding | Priority | Disposition |
|---|---|---|---|
| OBS-001 | "Absent" too binary | High | PR |
| OBS-002 | Define inventory scope | Very High | PR + Issue |
| OBS-003 | CBOM != discovery/inventory | Critical | PR + Issue |
| OBS-004 | SPDX claim unsupported | Critical | Issue + PR |
| OBS-005 | Use current CycloneDX model | High | PR |
| OBS-006 | Algorithm/key length insufficient | Very High | PR |
| OBS-007 | Capture parameters | Very High | PR |
| OBS-008 | Separate asset from usage | Very High | PR |
| OBS-009 | Add evidence/provenance | Very High | PR |
| OBS-010 | Living inventory mechanics | High | PR |
| OBS-011 | Freshness metric | High | PR |
| OBS-012 | Discovery tool limitations | High | PR |
| OBS-013 | CT logs one source | Medium-High | PR |
| OBS-014 | HSM/TPM constraints | High | PR |
| OBS-015 | Embedded-key wording | High | PR |
| OBS-016 | Third-party/SaaS discovery | Very High | PR |
| OBS-017 | Declared vs observed | High | PR |
| OBS-018 | Granular ownership | High | PR |
| OBS-019 | Expand key lifecycle | High | PR |
| OBS-020 | Migration status | Very High | PR |
| OBS-021 | Unknown state | High | PR |
| OBS-022 | Feed QS01/QS03 | High | PR |
| OBS-023 | Dependency mapping core | Critical | PR + Issue |
| OBS-024 | Dependency graph > asset list | Very High | PR |
| OBS-025 | "Single blocker" unsupported | Critical | Issue + PR |
| OBS-026 | Inventory protection | High | PR |
| OBS-027 | Normalization | Very High | PR |
| OBS-028 | CycloneDX Registry | High | PR |
| OBS-029 | CBOM fields | High | PR |
| OBS-030 | Vendor neutrality | Medium | PR |
| OBS-031 | Forgotten-asset scenario | High | PR |
| OBS-032 | SaaS scenario boundary | High | PR |
| OBS-033 | Migration-completeness scenario | Very High | PR |
| OBS-034 | False assurance | Very High | PR |
| OBS-035 | Coverage/confidence metrics | Very High | PR |
| OBS-036 | Inventory = governance | High | PR |
| OBS-037 | Change management expansion | High | PR |
| OBS-038 | Replacement lifecycle | Medium-High | PR |
| OBS-039 | Decommissioning | Medium-High | PR |
| OBS-040 | QS05 boundary | High | PR |
| OBS-041 | QS06 boundary | High | PR |
| OBS-042 | QS07 hardware fields | High | PR |
| OBS-043 | NCSC scope | High | PR |
| OBS-044 | EU roadmap scope | High | PR |
| OBS-045 | CISA/NSA/NIST strength | High | PR |
| OBS-046 | Regulatory mapping | High | PR |
| OBS-047 | CBOM vs SBOM boundary (UNIQUE) | Very High | PR |
| OBS-048 | Dynamic/ephemeral crypto (UNIQUE) | Very High | PR |
| OBS-049 | CBOM in supply chain (UNIQUE) | High | PR |
| OBS-050 | Cloud KMS visibility (UNIQUE) | High | PR |
| OBS-051 | Legacy protocol discovery (UNIQUE) | High | PR |
| OBS-052 | CRA regulatory mapping (UNIQUE) | High | PR |
'@

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " QS04 Part 1/3 written. Verification:" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

$expected = @(
    "02_QS_Audit\QS04\00_Master_Review.md",
    "02_QS_Audit\QS04\01_Master_Finding_Register.md"
)
$missing = 0
foreach ($f in $expected) {
    if (Test-Path $f) {
        Write-Host ("OK   {0,-70} {1,6} bytes" -f $f, (Get-Item $f).Length) -ForegroundColor Green
    } else {
        Write-Host ("MISS {0}" -f $f) -ForegroundColor Red
        $missing++
    }
}
Write-Host ""
if ($missing -eq 0) {
    Write-Host "QS04 Part 1 complete. 2 files. Ready for Part 2." -ForegroundColor Green
    Write-Host "Unified register: 52 findings (46 merged + 6 unique)." -ForegroundColor Green
} else {
    Write-Host "$missing file(s) missing." -ForegroundColor Red
}
Write-Host ""