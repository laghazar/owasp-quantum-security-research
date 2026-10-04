# Financial Services Unified Profile

## 1. Purpose

This document consolidates the Financial Services Profile across the
OWASP Quantum Security Top 10 entries. It provides a regulated-sector
lens that financial entities can apply when reading the entries and
planning migration.

It does not modify OWASP entries. It provides sector-specific
interpretation, data classes, threat models, regulatory alignment, and
supervisory evidence requirements.

## 2. Scope

The profile covers:

- Cryptographic asset classes specific to financial services
- Regulatory overlay (DORA, NIS2, CRA, national supervisors)
- Sector-specific threat models
- Procurement and third-party considerations
- Supervisory evidence requirements
- Cross-entry application

It does not cover organisation-specific risk appetite,
jurisdiction-specific legal interpretation, or vendor-specific product
selection.

## 3. Sector Context

### Financial Services Landscape

Financial institutions span banking, payments, capital markets,
insurance, and asset management. Their cryptographic estate is
characterised by:

- Long data retention requirements (varies by jurisdiction and
  record type)
- Long-lived signing infrastructure (PKI, code signing, firmware
  signing)
- Heavy third-party dependency (SWIFT, payment networks, cloud, SaaS)
- Large HSM and TPM fleets with vendor-specific management interfaces
- Legacy platforms with multi-decade service life
- Direct regulatory obligations (DORA, NIS2, CRA, national regulators)
- Cross-border operations with multiple jurisdictional requirements

### Regulatory Environment

The primary EU regulatory anchors for financial entities are DORA,
NIS2, and CRA. National supervisors may impose additional requirements.
Jurisdiction-specific interpretation is out of scope here.

## 4. Cryptographic Asset Classes

| Asset class | Confidentiality lifetime | Signature assurance | Regulatory anchor |
|---|---|---|---|
| KYC records | Long (illustrative, jurisdiction-dependent) | N/A | DORA, AML/CFT |
| AML investigations | Long | N/A | DORA, AML/CFT |
| Transaction records | Medium-Long | Variable | DORA, national |
| Payment authorizations | Session + audit window | Immediate | DORA, PCI-DSS |
| SWIFT messaging | Multi-year | Immediate | DORA, SWIFT CSP |
| Loan / mortgage docs | Multi-decade | Multi-decade | DORA, national |
| Customer PII | Variable | N/A | GDPR, DORA |
| Credit information | Medium-Long | N/A | DORA, national |
| Financial statements | Long | Variable | DORA, national |
| Backups | Variable | N/A | DORA |
| Archived contracts | Multi-decade | Multi-decade | DORA, national |
| Code signing (bank apps) | N/A | Product lifetime | DORA, CRA |
| Firmware signing (ATM/POS) | N/A | Device lifetime | DORA, CRA |
| HSM keys | Lifecycle | Lifecycle | DORA RTS Art. 6/7 |
| TLS certificates (public) | Session + cert lifetime | Cert lifetime | DORA, PSD2, CRA |
| TLS certificates (internal PKI) | Session + cert lifetime | Cert lifetime | DORA, internal policy |
| API certificates | Session + cert lifetime | Cert lifetime | DORA, PSD2 |
| Session keys | Session | N/A | DORA |

**Note.** Confidentiality lifetime and signature assurance estimates
above are illustrative only. Actual requirements are jurisdiction-,
product-, and record-type-dependent.

## 5. Cross-Entry Application

For each OWASP entry, the profile describes how a financial entity
should apply it.

| OWASP entry | Financial services application |
|---|---|
| QS01 (HNDL) | Long-lived financial records; regulated data retention; confidential customer data |
| QS03 (Signatures) | Trust chains for payment, PKI, code-signing, firmware; signed regulatory filings; long-lived contracts |
| QS04 (Inventory) | Cryptographic asset inventory across the bank estate including HSM, TPM, cloud KMS, third-party services |
| QS05 (Agility) | Ability to migrate financial infrastructure safely; cMTTR as a board-relevant KPI; supplier agility requirements |
| QS06 (Migration) | Hybrid deployment in payments, SWIFT, interbank connectivity; middlebox and load-balancer constraints |
| QS07 (Hardware) | HSM, ATM/POS, payment terminals, smart cards, secure boot; long replacement cycles |
| QS08 (QPU isolation) | Quantum cloud use for portfolio optimisation, risk modelling, research; provider isolation evidence |
| QS09 (Toolchain) | Third-party quantum platform integration; integrity chain for submitted-to-dispatch-to-result |
| QS10 (Side channels) | Data-centre insider risk; provider side-channel disclosure for hosted quantum workloads |

## 6. Regulatory Overlay

### DORA (Regulation (EU) 2022/2554)

| Article | Scope | Financial services relevance |
|---|---|---|
| Article 9 | ICT risk management | Confidentiality, integrity, availability of data at rest, in use, in transit |
| DORA RTS Article 6 | Encryption and cryptographic controls | Data-at-rest, in-transit, in-use; internal/external traffic; key management and lifecycle |
| DORA RTS Article 7 | Cryptographic key lifecycle | Generation through destruction |
| Article 28 | ICT third-party risk | General principles |
| Article 30 | Contractual arrangements | PKI, HSM, quantum platform, and signing-service vendors |
| Articles 31-44 | Oversight framework | Critical ICT third-party providers |

**DORA Article 30** is particularly relevant for cryptographic vendor
governance: contract terms, audit rights, exit strategies, data
location, and termination. This is the anchor for provider evidence
requirements (isolation, toolchain integrity, side-channel
disclosure).

### NIS2 (Directive (EU) 2022/2555)

- Article 21(2)(h): cryptography and encryption policies as part of
  cybersecurity risk management
- Applies to EU covered entities across sectors including financial
  services

### CRA (Regulation (EU) 2024/2847)

- Annex I: state-of-the-art mechanisms for confidentiality and
  integrity of data in products with digital elements
- Annex IV: critical product categories including smart cards and
  smart meter gateways
- Applies to products placed on the EU market

### Other Regulatory Anchors (contextual)

- PCI-DSS 4.0 (payment card industry)
- SWIFT CSP (SWIFT Customer Security Programme)
- PSD2 (Payment Services Directive 2)
- GDPR (data protection)
- National supervisory requirements

## 7. Sector-Specific Threat Models

### Threat model A - HNDL on financial records

    Attacker collects encrypted financial records today
       ->
    Retains for future CRQC decryption
       ->
    Historical records exposed at CRQC availability

Affected asset classes: KYC, AML, loan/mortgage, transaction history,
archived contracts.

Primary OWASP entries: QS01, QS04, QS05, QS06.

### Threat model B - Signature trust collapse

    Attacker forges signatures on financial artefacts after CRQC
       ->
    Fake payment authorizations, fraudulent certificates, forged
    SWIFT messages, forged regulatory filings

Affected asset classes: payment authorization, SWIFT, transaction
signing, bank certificates, code-signing, firmware signing.

Primary OWASP entries: QS03, QS04, QS07.

### Threat model C - Third-party platform exposure

    Quantum or classical platform provider fails to isolate, attest,
    or disclose
       ->
    Financial workloads exposed or unverifiable

Affected asset classes: proprietary optimisation models, quantum
research outputs, cloud-hosted sensitive workloads.

Primary OWASP entries: QS04, QS08, QS09, QS10.

### Threat model D - Hardware root lock-in

    Hardware anchors cannot be migrated
       ->
    Classical cryptography remains in service past PQC deadline

Affected asset classes: HSM keys, ATM/POS firmware, payment
terminals, smart cards, secure boot anchors.

Primary OWASP entries: QS07 (primary), QS03, QS04.

### Threat model E - Misdirected programme

    Organisation spends on quantum-branded procurement that replaces
    no quantum-vulnerable algorithm
       ->
    Reaches regulatory deadline with unmigrated estate

Primary OWASP entries: QS04 (inventory detection), QS05
(procurement prevention), candidate Misdirected Quantum
Countermeasures.

## 8. Procurement and Third-Party Considerations

For each critical vendor class:

| Vendor class | Evidence required | Regulatory anchor |
|---|---|---|
| PKI / CA | PQC roadmap; trust-chain migration plan; algorithm disclosures | DORA Art. 30 |
| HSM | PQC capability (ML-DSA/ML-KEM support); firmware update path; key ceremony documentation | DORA RTS Art. 6/7 |
| Quantum platform provider | Isolation evidence; toolchain integrity evidence; side-channel disclosure | DORA Art. 28, 30 |
| Software signing / code-signing | PQC algorithm roadmap; dual-signing support | DORA Art. 30 |
| Cloud KMS | PQC algorithm support; key lifecycle disclosures; region/residency | DORA RTS Art. 6 |
| SWIFT service bureau | PQC migration plan aligned to SWIFT roadmap | DORA Art. 30, SWIFT CSP |
| Payment network | PQC migration timeline; ecosystem coordination | DORA Art. 30, PCI-DSS |

Contractual arrangements should include exit strategies, audit rights,
data location, termination rights, and PQC migration commitments.

## 9. Supervisory Evidence Requirements

For each risk area, what evidence a financial entity should be able to
produce for supervisory review.

| Risk area | Evidence required |
|---|---|
| HNDL exposure | Cryptographic inventory; confidentiality lifetime assessment; migration prioritisation |
| Signature trust | Trust chain inventory; re-signing / re-issuance records; algorithm migration evidence |
| Crypto agility | cMTTR metric; rotation test records; governance runbook |
| Migration execution | Hybrid deployment verification; fallback policy; middlebox compatibility test results |
| Hardware roots | HSM/TPM lifecycle; replacement roadmap; compensating controls documentation |
| Quantum platform | Provider isolation evidence; toolchain integrity evidence; side-channel disclosure |
| Third party | Vendor PQC roadmaps; contractual evidence requirements; exit strategies |
| Regulatory mapping | Cryptographic asset map aligned with DORA/NIS2/CRA obligations |

## 10. Metrics

Sector-relevant metrics for tracking migration progress and residual
exposure.

| Metric | Formula | Purpose |
|---|---|---|
| Cryptographic asset coverage | Known assets / Estimated assets (within defined scope) | Inventory completeness |
| Confidentiality lifetime coverage | Assets with documented lifetime / Total assets | HNDL exposure assessment |
| Signature assurance coverage | Signing infrastructure with documented assurance / Total signing infrastructure | Signature risk assessment |
| Agility coverage | Systems with tested rotation path / Total in scope | Migration readiness |
| Migration progress | Quantum-vulnerable algorithms retired / Total identified | Programme progress (not spend) |
| Third-party coverage | Providers with PQC roadmap / Total critical providers | Supply-chain readiness |
| cMTTR | Time-to-rotate (average or per-system) | Board-level KPI |

Metrics should be defined with explicit scope. Estimated totals should
be based on a defined baseline rather than an undisclosed estimate.

## 11. Financial Services Contribution Candidates

Sector-specific contribution opportunities:

1. Financial-services HNDL data classification model (extends QS01)
2. Financial-services signature assurance lifetime framework
   (extends QS03)
3. Financial-services cryptographic inventory template with sector
   asset classes (extends QS04)
4. Financial-services third-party PQC evidence requirements
   (extends QS04, QS08, QS09, QS10)
5. Financial-services supervisory reporting alignment (extends
   landscape regulatory framework)

These contributions are candidates, not claims of novelty. Prior-art
review and OWASP Sprint evaluation would determine whether any is
adopted.

## 12. Relationship to OWASP Entries

The unified profile is a sector-specific supplement. It does not
modify OWASP content. It can be referenced from OWASP Issues or PRs
where sector-specific application is relevant.

Per-entry Financial Services extensions remain available in the
supporting folder:

    06_Financial_Services_Profile/supporting/

- 01_HNDL_Financial_Services.md (QS01 extension)
- 02_Signature_Trust_Financial_Services.md (QS03 extension)
- 03_Crypto_Inventory_Financial_Services.md (QS04 extension)

## 13. Cross-Entry Relationships

The profile integrates with:

- QS01 (HNDL) - asset classes and confidentiality lifetime
- QS03 (Signatures) - trust chain and assurance lifetime
- QS04 (Inventory) - cryptographic asset inventory
- QS05 (Agility) - cMTTR and migration readiness
- QS06 (Migration) - hybrid deployment and fallback
- QS07 (Hardware) - HSM, TPM, ATM/POS, smart cards
- QS08 (QPU isolation) - quantum cloud provider isolation
- QS09 (Toolchain) - integrity chain and provider evidence
- QS10 (Side channels) - provider disclosure
- Landscape_Regulatory_Context.md - source taxonomy and non-mandate rule
- Research_QA_Checklist.md - pre-submission quality gates

## 14. Status

**Analysis status:** Review Complete (Evidence validation pending)
**Submission status:** Not submitted
**Depends on:** QS01/QS03/QS04 deep dives; QS05-QS10 rapid audits;
DORA/NIS2/CRA regulatory mapping; Landscape_Regulatory_Context.md