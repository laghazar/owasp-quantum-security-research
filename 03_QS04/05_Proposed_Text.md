# QS04 — Proposed Revised Text (OWASP PR candidate — FULL)

This is the complete proposed revised QS04 text. Every section is written out
verbatim. When submitting the PR, use this file directly as the source.

---

## Title (proposed)

QS04:2026 — Cryptographic Discovery and Inventory Gaps

*(Alternative: "Cryptographic Inventory and CBOM Gaps" — if the working group
prefers to retain "CBOM" in the title, but the current "Absent" framing
should change.)*

---

## Description

Organisations cannot reliably migrate cryptography they cannot identify,
understand, and map to the systems and services that depend on it.
Cryptographic discovery and inventory should therefore establish a current,
evidence-based view of the cryptographic assets and cryptographic functions
used across the estate, together with the relationships and dependencies
required to assess migration risk.

A cryptographic inventory should cover, as applicable, cryptographic
algorithms and parameters, cryptographic keys and certificates, trust
anchors, protocols, cryptographic libraries and providers, applications and
services, hardware-backed cryptographic components such as HSMs and TPMs,
firmware and embedded cryptographic dependencies, cloud and SaaS services,
and third-party or supply-chain dependencies. For each relevant record,
organisations should capture sufficient context to determine what the
cryptographic mechanism does, where it is used, what it protects, who owns
it, how it is managed, and how it can be migrated.

A machine-readable Cryptography Bill of Materials (CBOM) can provide a
structured representation of cryptographic assets and relationships, but a
CBOM is not itself a discovery process, risk assessment, dependency map, or
migration programme. Inventory completeness depends on the quality and
coverage of the discovery mechanisms used to populate and validate it.

Cryptographic discovery should therefore combine multiple evidence sources.
Depending on the environment, these may include network and TLS scanning,
certificate inventory and Certificate Transparency data for publicly logged
certificates, source-code and binary analysis, dependency and SBOM data,
runtime and configuration inspection, PKI and KMS/HSM management interfaces,
hardware and firmware evidence, cloud-service configuration, and supplier or
service-provider attestations.

The inventory should also represent relationships between cryptographic
assets and the systems, data, services, business processes, hardware, and
external dependencies that rely on them. Dependency mapping is necessary
because two systems using the same algorithm may have very different
migration priorities depending on their business criticality, data or
signature-assurance lifetime, external exposure, number of dependent
services, hardware constraints, and supplier dependencies.

An inventory should be treated as a living control rather than a one-time
assessment. Changes to certificates, keys, applications, libraries,
protocols, infrastructure, cloud services, hardware, suppliers, and
deployment pipelines can introduce new cryptographic dependencies or retire
existing ones. Organisations should therefore define update mechanisms,
ownership, validation frequency, evidence provenance, freshness requirements,
and coverage metrics.

Incomplete or stale inventories create a particular risk of false assurance:
an organisation may conclude that migration is complete while unknown,
unmanaged, or incorrectly mapped cryptographic dependencies remain. The
objective is therefore not merely to produce a CBOM, but to maintain
sufficient cryptographic visibility and dependency knowledge to support
accurate quantum-risk assessment and controlled migration.

---

## Common Examples of Vulnerability

1. **Partial or stale cryptographic inventory.** An organisation maintains a
   list of certificates and cryptographic libraries but has no reliable
   inventory of firmware signing keys, private certificate authorities,
   hardware-backed keys, internal protocols, or third-party cryptographic
   dependencies.

2. **Algorithm inventory without usage context.** The inventory records
   RSA-2048, ECDSA P-256, and AES-256 but does not identify where the
   mechanisms are used, whether they provide key establishment, signatures,
   encryption, authentication, or integrity protection, what data or business
   services they protect, or which implementations and parameter sets are
   deployed.

3. **One-time discovery with no continuous maintenance.** An organisation
   performs a cryptographic discovery exercise once, but subsequent
   application releases, certificate renewals, infrastructure changes,
   library upgrades, and supplier changes are not reconciled with the
   inventory.

4. **Blind spots in hardware and embedded systems.** Cryptographic keys or
   trust anchors are stored in HSMs, TPMs, secure elements, firmware, or
   hardware components and are not fully discoverable through software-only
   scanning.

5. **Third-party and SaaS cryptographic dependencies omitted.** Inventory
   covers owned infrastructure but excludes SaaS, managed services, cloud
   platforms, certificate authorities, payment providers, or other suppliers
   that terminate TLS, issue certificates, sign software, or otherwise
   perform cryptographic functions on behalf of the organisation.

6. **Crypto inventory without dependency mapping.** An organisation knows
   which algorithms are deployed but cannot determine which business
   services, data classes, applications, devices, or suppliers depend on a
   specific cryptographic asset.

7. **Incomplete inventory creates false migration completion.** A PQC
   migration programme reports the estate as migrated even though a set of
   undocumented intermediate CA keys, embedded firmware signing keys, or
   vendor-controlled cryptographic dependencies remain on classical
   algorithms.

8. **Unverified vendor claims.** A supplier reports that a product is
   "PQC-ready", but the organisation has no evidence showing the algorithms,
   protocol modes, cryptographic libraries, certificate dependencies, or
   actual negotiated configurations used by the deployed service.

9. **Dynamic and ephemeral crypto profiles not captured.** The inventory
   lists only persistent keys and certificates and does not record
   ephemeral cryptographic usage (per-session TLS keys, ephemeral
   key-establishment, short-lived tokens) that determines the actual
   algorithm and protocol profile of the system.

10. **Legacy protocols and deprecated crypto unmanaged.** SSL 3.0, TLS
    1.0/1.1, SSHv1, IPsec with weak Diffie-Hellman groups, deprecated
    cipher suites, and obsolete certificate algorithms remain in production
    because they are not covered by discovery.

---

## How to Prevent

**1. Establish a structured cryptographic inventory.**
Maintain a machine-readable, evidence-based inventory covering cryptographic
assets, their use, ownership, lifecycle, and relationships to systems,
services, data, hardware, and suppliers. Use an established CBOM
representation such as CycloneDX v1.7 where appropriate, or another clearly
defined interoperable representation.

**2. Define inventory scope explicitly.**
Include, as applicable, algorithms and parameters, keys, certificates, trust
anchors, protocols, libraries and providers, applications, services, HSMs,
TPMs, firmware, embedded cryptographic dependencies, cloud and SaaS
services, and third-party cryptographic functions.

**3. Combine discovery mechanisms.**
Use multiple complementary discovery techniques rather than relying on a
single source. These may include network and TLS scanning, certificate
inventories and public Certificate Transparency data, source-code and binary
analysis, SBOM/dependency information, runtime and configuration inspection,
PKI/KMS/HSM interfaces, hardware and firmware analysis, cloud configuration,
and supplier evidence. Document the coverage and limitations of each
technique.

**4. Map dependencies.**
Record relationships between cryptographic assets and the applications,
services, data, business processes, hardware, and suppliers that depend on
them. Use dependency information to support migration prioritization and to
identify single points of cryptographic failure.

**5. Capture evidence and confidence.**
Record how each inventory item was discovered or validated, including the
source, observation date, last verification date, and confidence or
verification state. Distinguish observed evidence from vendor-declared
information. Where vendor claims cannot be independently verified, record
them as declared-only with residual risk.

**6. Capture lifecycle and migration metadata.**
Record relevant lifecycle information such as creation, activation,
expiration, rotation, revocation, archival, destruction, custody, and
current state. Where relevant, record quantum-vulnerability status,
migration priority, target mechanism, migration status, blockers, and risk
acceptance.

**7. Maintain continuous inventory.**
Integrate inventory updates with change management, PKI and certificate
lifecycle processes, KMS/HSM operations, CI/CD pipelines, application
deployment, infrastructure provisioning, cloud configuration, procurement,
supplier onboarding, renewal, and asset decommissioning.

**8. Measure coverage and freshness.**
Define measurable indicators such as inventory coverage, dependency-mapping
coverage, evidence coverage, unknown-asset rate, and record freshness. Treat
unexplained unknown or stale cryptographic dependencies as migration risk.

**9. Secure the inventory.**
Protect the cryptographic inventory and CBOM as sensitive security
information. Do not place private keys, secret values, passwords, or other
sensitive cryptographic material into the inventory. Store references,
identifiers, fingerprints, metadata, and custody information as appropriate.

**10. Validate hardware and third-party dependencies.**
Where cryptographic operations occur in HSMs, TPMs, secure elements,
firmware, silicon, SaaS, managed services, or supplier-controlled
environments, use appropriate management interfaces, technical evidence,
manufacturer documentation, testing, and contractual assurance rather than
assuming software-only discovery is complete.

**11. Normalize cryptographic nomenclature.**
Use a canonical vocabulary for cryptographic algorithms, parameters,
protocols, and assets. Record the original discovery value alongside the
normalized value for traceability. Reference registries such as the
CycloneDX Cryptography Registry where appropriate.

**12. Do not conflate CBOM, SBOM, and inventory.**
CBOM records cryptographic assets; SBOM records software components. Both
should be maintained and cross-referenced, but neither substitutes for the
other. Cryptographic inventory is the governance capability; CBOM is the
machine-readable representation.

---

## Example Attack Scenarios

### Scenario #1 — Forgotten cryptographic trust dependency

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
identify and migrate a trusted cryptographic dependency.

### Scenario #2 — Unmanaged SaaS cryptographic dependency

An organisation inventories owned and operated infrastructure but does not
inventory cryptographic functions performed by a critical SaaS provider. The
provider terminates TLS and maintains certificate and key-management
infrastructure on behalf of the organisation.

Because the dependency is absent from the cryptographic inventory, the
organisation does not assess its algorithm configuration, migration roadmap,
or PQC interoperability requirements. The dependency becomes a blind spot in
the organisation's migration programme.

The resulting risk may include residual quantum-vulnerable communications,
certificate dependencies, or HNDL exposure that were never identified or
prioritised.

### Scenario #3 — False migration completion caused by incomplete coverage

An organisation builds a CBOM from source-code and dependency scanning and
reports that 95% of its estate has been assessed. However, hardware-backed
cryptographic components and several third-party services are outside the
discovery scope.

The migration programme treats the CBOM as complete and closes the remaining
work. Later, an embedded signing key and a supplier-controlled certificate
dependency are discovered to remain on classical cryptography.

The failure results from treating a partial CBOM as evidence of complete
cryptographic visibility.

### Scenario #4 — Vendor-declared PQC readiness is not validated

A critical supplier reports that its platform is "quantum-safe". The
organisation records the declaration in its supplier register but does not
capture the exact algorithms, protocol modes, certificates, implementation
versions, fallback behaviour, or migration dependencies.

A later technical assessment shows that the service still depends on a
classical public-key mechanism for a security-critical function.

The inventory failed to distinguish vendor-declared capability from
independently observed or validated cryptographic state.

---

## Reference Links

### Government migration guidance

- **UK NCSC — Timelines for migration to post-quantum cryptography.** 2028
  discovery and assessment milestone; 2031 highest-priority migration; 2035
  full migration target. Guidance for UK organisations and broader
  international reference.
- **CISA / NSA / NIST — Quantum-Readiness: Migration to Post-Quantum
  Cryptography fact sheet.** Cryptographic inventory recommendation.
- **EU Coordinated Implementation Roadmap for the Transition to PQC.**
  Member State coordination framework with start-transition and high-risk
  use-case milestones.

### Standards and specifications

- **NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
  Cryptography Standards.** Transition planning guidance.
- **CycloneDX CBOM specification (1.6+).** Cryptography Bill of Materials
  schema for cryptographic assets and relationships.
- **CycloneDX Cryptography Registry.** Canonical machine-readable definitions
  for algorithms, curves, and cryptographic primitives.
- **CycloneDX cryptographic key / certificate inventory use cases.**
  Field-level modeling examples.
- **SPDX specification.** Adjacent BOM ecosystem with profile and extension
  mechanisms.

### EU regulatory references

- **NIS2 Article 21(2)(h)** — policies and procedures regarding cryptography
  and, where appropriate, encryption.
- **DORA Article 9** — ICT risk management.
- **DORA RTS Article 6** — encryption and cryptographic controls policy.
- **DORA RTS Article 7** — cryptographic key lifecycle.
- **DORA Articles 28-44 (esp. Article 30)** — ICT third-party risk management.
- **CRA Annex I** — products with digital elements security requirements.

---

## Standards and Regulatory Mapping

| Source | Type | Jurisdiction / Scope | QS04 relevance |
|---|---|---|---|
| UK NCSC PQC Timelines | Government guidance | UK / broader reference | Discovery and assessment |
| CISA / NSA / NIST fact sheet | Government guidance | U.S. / broader reference | Cryptographic inventory recommendation |
| EU Coordinated PQC Roadmap | Policy roadmap | EU Member States | Asset management and dependency mapping |
| NIST IR 8547 | Initial Public Draft | U.S. / broader reference | Migration planning |
| CycloneDX CBOM | Industry / open specification | Global | Machine-readable cryptographic inventory |
| CycloneDX Cryptography Registry | Open specification / registry | Global | Canonical cryptographic naming |
| SPDX specification | Open specification | Global | Adjacent BOM ecosystem |
| NIS2 Article 21(2)(h) | Directive | EU covered entities | Cryptography / encryption risk management |
| DORA Article 9 | Regulation | EU financial entities | ICT risk management |
| DORA RTS Article 6 | Regulatory Technical Standard | EU financial entities | Encryption / cryptographic controls |
| DORA RTS Article 7 | Regulatory Technical Standard | EU financial entities | Cryptographic key lifecycle |
| DORA Article 30 | Regulation | EU financial entities | Third-party contractual arrangements |
| CRA Annex I | Regulation | EU products with digital elements | Product security / cryptographic requirements |
