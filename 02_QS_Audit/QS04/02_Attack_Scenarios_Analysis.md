# QS04 — Attack Scenarios Analysis (FULL)

## Merged scenario set

- 2 existing OWASP scenarios (extended with dependency-graph realism)
- 2 new scenarios (migration completeness, vendor-declared vs validated)
- ChatGPT refinements + original-pass improvements merged, no reduction

---

## Scenario 1 — Forgotten cryptographic trust dependency

### Current (OWASP draft)
"An organisation begins PQC migration but has no CBOM. A forgotten
intermediate CA and a set of firmware-embedded signing keys are never
catalogued, so they are never migrated. After a CRQC exists, an attacker
targets exactly these un-inventoried classical anchors, which remain trusted
across the estate."

### Core logic assessment
Correct. Retain with dependency-graph framing extension.

### Findings addressed
- OBS-001 (absent too binary)
- OBS-023 (dependency mapping core)
- OBS-031 (forgotten asset scenario improvement)
- OBS-034 (false assurance)

### Proposed revised scenario 1 (FULL)

An organisation begins a PQC migration programme using an incomplete
cryptographic inventory. A private intermediate CA and several
firmware-embedded signing dependencies are not recorded. The migration
programme therefore does not update those components or their trust
relationships.

Common sources of un-inventoried cryptographic assets include: inherited
cryptographic infrastructure from mergers and acquisitions, legacy CAs in
decommissioned or partially-decommissioned environments, shadow-IT signing
infrastructure created by business units, partner cross-signing arrangements
not registered in the central inventory, and firmware embedded in device
generations no longer actively managed.

The organisation later declares migration complete, but the undocumented
classical cryptographic dependencies remain trusted across a subset of
systems. A future quantum-capable adversary can target those residual trust
anchors or signing mechanisms.

The primary failure is not merely the existence of a classical algorithm. It
is the lack of sufficient cryptographic discovery and dependency mapping to
identify and migrate a trusted cryptographic dependency. The attack chain is:

    No inventory
          |
    Intermediate CA omitted
          |
    Firmware signing dependency omitted
          |
    Migration programme marks estate "complete"
          |
    Residual classical trust remains
          |
    Future quantum attacker
          |
    CA / signing trust compromise

### Root cause
Incomplete inventory + incomplete dependency mapping + false migration
completeness.

---

## Scenario 2 — Unmanaged SaaS cryptographic dependency

### Current (OWASP draft)
"A SaaS dependency terminates TLS with a quantum-vulnerable configuration the
organisation never recorded because inventory covered only owned-and-operated
systems. The unmanaged dependency becomes the harvest point for an HNDL
adversary, invisible to the migration programme."

### Core logic assessment
Correct. Retain with QS04-boundary extension.

### Findings addressed
- OBS-016 (third-party / SaaS discovery)
- OBS-017 (vendor-declared vs observed vs verified)
- OBS-032 (SaaS scenario boundary)
- OBS-050 (cloud KMS visibility)

### Proposed revised scenario 2 (FULL)

An organisation inventories owned and operated infrastructure but does not
inventory cryptographic functions performed by a critical SaaS provider. The
provider terminates TLS and maintains certificate and key-management
infrastructure on behalf of the organisation.

Because the dependency is absent from the cryptographic inventory, the
organisation does not assess its algorithm configuration, migration roadmap,
or PQC interoperability requirements. The dependency becomes a blind spot in
the organisation's migration programme.

SaaS and cloud dependencies present a specific inventory gap: the customer is
often unaware of the cryptographic configuration used at the provider's edge.
A SaaS provider may terminate TLS with quantum-vulnerable algorithms, use
classical signatures for API authentication, or store customer data with
classical key-encryption — none of which are visible in the customer's own
inventory. The provider's cryptographic disclosure practices determine what
the customer can inventory.

The resulting risk may include residual quantum-vulnerable communications,
certificate dependencies, or HNDL exposure that were never identified or
prioritised. The primary QS04 failure is the visibility gap, not the
downstream HNDL outcome.

---

## Scenario 3 — Migration completeness failure

### Findings addressed
- OBS-033 (migration completeness scenario)
- OBS-034 (false assurance)
- OBS-035 (coverage metrics)

### Proposed scenario 3 (FULL)

An organisation builds a CBOM from source-code and dependency scanning and
reports that 95% of its estate has been assessed. However, hardware-backed
cryptographic components and several third-party services are outside the
discovery scope.

The migration programme treats the CBOM as complete and closes the remaining
work. Later, an embedded signing key and a supplier-controlled certificate
dependency are discovered to remain on classical cryptography.

The failure results from treating a partial CBOM as evidence of complete
cryptographic visibility. The relevant risk model is:

    Inventory coverage = 95%
             |
    Migration declared complete
             |
    Unknown 5% includes critical signing/HSM/SaaS dependencies
             |
    Residual quantum vulnerability remains

The key insight is that **inventory completeness is itself a control metric**.
A CBOM with 95% coverage should not be treated as equivalent to a CBOM with
100% verified coverage when the missing 5% contains critical trust anchors.

---

## Scenario 4 — Vendor-declared PQC readiness is not validated

### Findings addressed
- OBS-017 (declared vs observed vs verified)
- OBS-049 (CBOM in supply chain)

### Proposed scenario 4 (FULL)

A critical supplier reports that its platform is "quantum-safe". The
organisation records the declaration in its supplier register but does not
capture the exact algorithms, protocol modes, certificates, implementation
versions, fallback behaviour, or migration dependencies.

A later technical assessment shows that the service still depends on a
classical public-key mechanism for a security-critical function.

The inventory failed to distinguish vendor-declared capability from
independently observed or validated cryptographic state. The correct model
requires three evidence states:

    Vendor-Declared    <- contractual, questionnaire, documentation
    Observed           <- API/config evidence, network observation
    Verified           <- independent technical evidence, testing, SOC

A CBOM that records only "Vendor says PQC-ready" is not evidence of PQC
readiness. Vendor CBOMs should be treated as procurement inputs, on par with
SBOMs, and cross-checked against observed state where feasible.

---

## Assessment tables

### Scenario 1 — Forgotten trust dependency
| Element | Assessment |
|---|---|
| Core concept | Correct |
| Forgotten-asset realism | Extended |
| Dependency-graph failure | Highlighted |
| False assurance | Explicit |
| Overall | Keep with extensions |

### Scenario 2 — SaaS dependency
| Element | Assessment |
|---|---|
| Core concept | Correct |
| Provider visibility model | Extended |
| QS04-boundary | Explicit |
| Overall | Keep with extension |

### Scenario 3 — Migration completeness
| Element | Assessment |
|---|---|
| Core concept | New scenario |
| Coverage metric | Central |
| False assurance | Explicit |
| Overall | Add to entry |

### Scenario 4 — Vendor-declared vs validated
| Element | Assessment |
|---|---|
| Core concept | New scenario |
| Evidence-state model | Central |
| Supply chain | Referenced |
| Overall | Add to entry |

---

## Attack Scenarios — findings register

| ID | Finding | Type | Priority |
|---|---|---|---|
| OBS-001 | "Absent" too binary | Structural | High |
| OBS-016 | Third-party / SaaS discovery | Gap | Very High |
| OBS-017 | Declared vs observed vs verified | Extension | High |
| OBS-023 | Dependency mapping core | Structural | Critical |
| OBS-031 | Forgotten-asset scenario improvement | Scenario | High |
| OBS-032 | SaaS scenario boundary | Structural | High |
| OBS-033 | Migration-completeness scenario | New example | Very High |
| OBS-034 | False assurance risk | Gap | Very High |
| OBS-035 | Coverage / confidence metrics | Extension | Very High |
| OBS-049 | CBOM in supply chain | Extension | High |
| OBS-050 | Cloud KMS visibility | Extension | High |
