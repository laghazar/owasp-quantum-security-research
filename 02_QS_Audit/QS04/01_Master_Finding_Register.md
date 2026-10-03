# QS04 — Unified Master Finding Register

52 findings (46 unified + 6 unique additions). Not submitted to OWASP directly.
Consolidated into 4 Issues + 1 PR.

---

## ?? CRITICAL

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

## ?? VERY HIGH

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

Algorithm asset ? application usage. CBOM must model "used-by" and
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

Three-state model. Vendor documentation ? observed truth.

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

## ?? HIGH

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

## ?? MEDIUM

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
