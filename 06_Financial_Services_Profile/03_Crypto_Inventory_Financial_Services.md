# Cryptographic Inventory — Financial Services Profile

Sector-specific extension of QS04. Maintained separately so that the main
QS04 entry remains vendor-neutral and sector-neutral.

---

## 1. Purpose

Financial institutions combine:
- Complex, deeply layered cryptographic estates
- Regulatory-driven cryptographic visibility obligations (DORA, NIS2)
- Heavy third-party dependency (payment networks, SWIFT, cloud, SaaS)
- Large HSM/TPM fleets with vendor-specific management interfaces
- Long-lived legacy systems with slow change cycles
- Cross-border operations with multiple jurisdictional requirements

Cryptographic discovery and inventory is a **prerequisite** for financial
institutions to meet both quantum-readiness and existing regulatory
obligations. Without it, migration planning, incident response, and
supervisory reporting all become unreliable.

---

## 2. Cryptographic asset classes in financial services

| Asset class | Typical discovery challenge | Typical priority |
|---|---|---|
| Payment HSM keys | Vendor-specific APIs, key hierarchy opacity | Critical |
| Root CA keys (internal PKI) | Distributed CA hierarchies, cross-signing | Critical |
| Intermediate CA keys | Often inherited from M&A, not central | Critical |
| Customer-facing TLS certificates | Public CT + internal PKI | High |
| API mTLS certificates | Distributed across API gateways and vendors | High |
| Code-signing keys (banking apps) | Multiple app stores, multiple platforms | Critical |
| Firmware signing keys (ATM/POS) | Hardware-fused, vendor-managed | Critical |
| SWIFT-related keys | SWIFT-specific key management | Critical |
| Transaction signing keys | Per-system, per-region, per-product | Critical |
| JWT/SAML issuer keys | Distributed identity providers | High |
| KMS-managed keys (cloud) | Provider-abstracted | High |
| Database TDE keys | Application and DB-level | High |
| Backup encryption keys | Backup infrastructure, offsite | High |
| Archive encryption keys | Long-term retention | Critical |
| Session keys (ephemeral) | Not individually inventoried | Profile-only |
| Password hashes | Application-level | Medium |
| HMAC keys | Distributed APIs | Medium |

---

## 3. Inventory scope model for financial services

### Layer 1 — Assets
- Algorithms, primitives, parameters
- Keys, certificates, trust anchors
- Protocols, libraries, providers
- HSM/TPM objects, firmware, silicon
- Cloud KMS keys

### Layer 2 — Usage
- Payment authorization
- Transaction signing
- Customer authentication
- Bank-to-bank messaging (SWIFT, SEPA, etc.)
- Internal service mesh
- Data at rest (transaction records, KYC/AML)
- Code signing (mobile, desktop, firmware)

### Layer 3 — Dependencies
- Business services
- Data classification
- Third parties (SWIFT, payment processors, cloud, SaaS)
- Hardware dependencies (HSM, TPM, secure element)
- Regulatory obligations (DORA, NIS2, CRA if applicable)

---

## 4. Regulatory overlay

### DORA Article 9
Financial entities must maintain high standards of confidentiality,
integrity, and availability of data at rest, in use, and in transit.

### DORA RTS Article 6
Requires financial entities to maintain a policy on encryption and
cryptographic controls, based on data classification and ICT risk
assessment, covering at least:
- data at rest
- data in transit
- data in use where necessary
- internal and external network connections
- cryptographic key management and lifecycle

Article 6(4) addresses updating or changing cryptographic technology in
response to developments in cryptanalysis.

### DORA RTS Article 7
Cryptographic key lifecycle: generation, renewal, storage, backup,
archiving, retrieval, transmission, retirement, revocation, destruction.

### DORA Article 30 (contractual arrangements)
Particularly relevant where cryptographic functions are performed by
third-party providers: SWIFT service bureaus, payment processors, cloud
KMS providers, PKI service providers, HSMaaS providers.

Requirements include:
- Contractual arrangements with ICT third-party service providers
- Exit strategies
- Data location and processing
- Access, use, and control
- Audit and access rights
- Termination rights

### NIS2 Article 21(2)(h)
Policies and procedures regarding the use of cryptography and, where
appropriate, encryption, as part of cybersecurity risk-management measures.

### EU Coordinated PQC Roadmap
Member States coordinate transition start by end-2026 and high-risk use
cases migrated no later than end-2030.

---

## 5. Financial-services specific inventory challenges

### Challenge A — Payment HSM opacity

Payment HSMs (Thales payShield, Atalla, etc.) abstract key hierarchies and
provide limited programmatic visibility. Discovery must rely on:
- Vendor-specific management APIs
- Administrative key list commands
- HSM audit logs
- Key ceremony documentation
- Physical records for HSM partitions and roles

### Challenge B — SWIFT key management

SWIFT-related keys follow SWIFT-specific lifecycle and custody practices.
Inventory should reference SWIFT documentation and certification requirements,
not just generic KMS/HSM practices.

### Challenge C — M&A inherited infrastructure

Mergers and acquisitions routinely introduce foreign CAs, signing keys, and
trust anchors not registered in the central inventory.

### Challenge D — ATM/POS firmware signing

ATM/POS firmware is often vendor-managed. Signing keys may be:
- Held by the vendor (opaque to the bank)
- Co-managed (bank has partial visibility)
- Bank-managed (full visibility)

Inventory must record the management model, not just the key existence.

### Challenge E — Cloud KMS provider lock-in

Cloud KMS providers expose cryptographic operations via APIs but abstract
algorithm choice, key custody, and rotation. Inventory should record:
- Key ID and purpose
- Provider-managed vs customer-managed
- Algorithm and parameter set (where disclosed)
- Rotation policy
- Region and residency
- Provider's PQC roadmap commitment

### Challenge F — Third-party SaaS crypto

SaaS providers terminate TLS, issue certificates, sign tokens, and store
data — but cryptographic configurations are often opaque. Inventory should
record declared state, observed state, and where possible verified state.

---

## 6. Recommended financial-services inventory fields

Beyond the QS04 minimum dataset, financial institutions should add:

    Regulatory relevance      (DORA Art. 9 / RTS Art. 6 / NIS2)
    Business service criticality
    Cross-border data flow
    Supervisory reporting flag
    Third-party provider
    Provider management model (self / co-managed / vendor-managed)
    Provider PQC roadmap commitment
    Provider CBOM availability
    Physical custody location
    HSM partition / role
    Key ceremony reference
    Backup and disaster recovery linkage

---

## 7. Prioritization model

For each asset:

1. Classify asset type
2. Determine business criticality
3. Map regulatory obligations
4. Map third-party dependencies
5. Assess quantum vulnerability
6. Estimate migration lead time
7. Assess adversarial value
8. Determine treatment path
9. Track migration status

---

## 8. Coverage metrics for financial institutions

| Metric | Formula |
|---|---|
| Payment HSM key coverage | Known HSM keys / Estimated HSM keys |
| CA hierarchy coverage | Discovered CAs / Estimated CAs |
| Code-signing key coverage | Registered signing keys / Estimated signing keys |
| Third-party crypto coverage | Assessed third-party crypto / Known third-party crypto |
| Regulatory mapping coverage | Assets mapped to obligations / Total assets |
| Migration traceability | Assets with migration status / Quantum-vulnerable assets |
| Evidence coverage | Verified records / Total records |

---

## 9. Cross-references

- QS04 — Cryptographic discovery and inventory framework (parent entry)
- QS01 — HNDL confidentiality exposure
- QS03 — Signature and trust exposure
- QS05 — Crypto agility
- QS06 — Secure PQC/hybrid migration
- QS07 — Hardware roots of trust (HSM, TPM, Secure Boot)
- DORA RTS Article 6 / Article 7 (regulatory anchors)
