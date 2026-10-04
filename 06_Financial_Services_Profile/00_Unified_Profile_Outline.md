# Financial Services Unified Profile - Outline

## 1. Purpose

This document consolidates the three existing Financial Services Profile
files into a unified sector profile. The three existing files address:

- HNDL confidentiality exposure (QS01 extension)
- Signature trust exposure (QS03 extension)
- Cryptographic inventory (QS04 extension)

The unified profile is intended to be sector-specific. It does not
modify the OWASP entries themselves; it provides a regulated-sector
lens that financial entities can apply when reading the OWASP Quantum
Security Top 10.

## 2. Scope

The unified profile covers:

- Cryptographic asset classes specific to financial services
- Regulatory overlay (DORA, NIS2, CRA)
- Sector-specific threat models
- Procurement and third-party considerations
- Supervisory evidence requirements
- Cross-entry application (which OWASP entries apply at each stage)

The profile does not cover:

- Organisation-specific risk appetite
- Jurisdiction-specific legal interpretation
- Vendor-specific product selection

## 3. Existing Profiles (Source Material)

Three files currently exist in `06_Financial_Services_Profile/`:

| File | Extends | Scope |
|---|---|---|
| `01_HNDL_Financial_Services.md` | QS01 | Confidentiality HNDL exposure for financial data classes |
| `02_Signature_Trust_Financial_Services.md` | QS03 | Signature and trust exposure for financial signing infrastructure |
| `03_Crypto_Inventory_Financial_Services.md` | QS04 | Cryptographic inventory for financial estates |

The unified profile integrates these three into a single sector view
plus adds platform-surface coverage (QS05-QS10) and cross-cutting
themes.

## 4. Structure of the Unified Profile

The unified profile will be organized into the following sections:

### Section 1 — Financial Services Landscape

- Sector overview (banking, payments, capital markets, insurance)
- Regulatory environment (DORA, NIS2, CRA, national supervisors)
- Cryptographic estate overview
- Migration timeline context

### Section 2 — Cryptographic Asset Classes

| Asset class | Typical confidentiality lifetime | Typical signature assurance | Regulatory relevance |
|---|---|---|---|
| KYC records | 5-10 years | N/A | DORA, AML/CFT |
| AML investigations | 5-10 years | N/A | DORA, AML/CFT |
| Transaction records | 5-10 years | Variable | DORA, national |
| Payment authorizations | Session + audit | Immediate | DORA, PCI-DSS |
| SWIFT messaging | 5+ years | Immediate | DORA, SWIFT CSP |
| Loan / mortgage docs | 10-30 years | 10-30 years | DORA, national |
| Customer PII | Variable | N/A | GDPR, DORA |
| Credit information | 5-7 years | N/A | DORA, national |
| Financial statements | 10+ years | Variable | DORA, national |
| Backups | Variable | N/A | DORA |
| Archived contracts | 10-30 years | 10-30 years | DORA, national |
| Code signing | N/A | Product lifetime | DORA, CRA |
| Firmware signing (ATM/POS) | N/A | Device lifetime (10+ years) | DORA, CRA |
| HSM keys | Lifecycle | Lifecycle | DORA RTS Art. 6/7 |
| TLS certificates | Session + cert lifetime | Cert lifetime | DORA, PSD2, CRA |
| API certificates | Session + cert lifetime | Cert lifetime | DORA, PSD2 |
| Session keys | Session | N/A | DORA |

### Section 3 — Cross-Entry Application

For each OWASP entry, the profile describes how a financial entity
should apply it.

| OWASP entry | Financial services application |
|---|---|
| QS01 (HNDL) | Long-lived financial records; regulated data retention |
| QS03 (Signatures) | Trust chains for payment, PKI, code-signing, firmware |
| QS04 (Inventory) | Cryptographic asset inventory across the bank estate |
| QS05 (Agility) | Ability to migrate financial infrastructure safely |
| QS06 (Migration) | Hybrid deployment in payments, SWIFT, interbank |
| QS07 (Hardware) | HSM, ATM/POS, payment terminals, smart cards |
| QS08 (QPU isolation) | Quantum cloud use for optimisation and modelling |
| QS09 (Toolchain) | Third-party quantum platform integration |
| QS10 (Side channels) | Data-centre insider risk for hosted quantum workloads |

### Section 4 — Regulatory Overlay

#### DORA

| Article | Scope | Financial services relevance |
|---|---|---|
| Article 9 | ICT risk management | Confidentiality, integrity, availability of data |
| DORA RTS Article 6 | Encryption and cryptographic controls | Data-at-rest, in-transit, in-use, key management |
| DORA RTS Article 7 | Cryptographic key lifecycle | Generation through destruction |
| Article 28 | ICT third-party risk | General principles |
| Article 30 | Contractual arrangements | PKI, HSM, quantum platform vendors |
| Articles 31-44 | Oversight framework | Critical ICT third-party providers |

#### NIS2

- Article 21(2)(h): cryptography and encryption policies
- Applicability: EU covered entities across sectors

#### CRA

- Annex I: state-of-the-art mechanisms for confidentiality and
  integrity
- Annex IV: critical product categories (smart cards, smart meter
  gateways)
- Applicability: products with digital elements

#### Other regulatory anchors

- PCI-DSS 4.0 (payment card industry)
- SWIFT CSP (SWIFT Customer Security Programme)
- PSD2 (Payment Services Directive 2)
- GDPR (data protection)

### Section 5 — Sector-Specific Threat Models

#### Threat model A — HNDL on financial records

    Attacker collects encrypted financial records today
       ->
    Retains for future CRQC decryption
       ->
    Historical records exposed at CRQC availability

Financial asset classes affected: KYC, AML, loan/mortgage, transaction
history, archived contracts.

#### Threat model B — Signature trust collapse

    Attacker forges signatures on financial artefacts after CRQC
       ->
    Fake payment authorizations, fraudulent certificates, forged SWIFT messages

Financial asset classes affected: payment authorization, SWIFT,
transaction signing, bank certificates, code-signing.

#### Threat model C — Third-party exposure

    Quantum platform provider fails to isolate or attest
       ->
    Financial workloads exposed or unverifiable

Financial asset classes affected: proprietary optimisation models,
quantum research outputs.

#### Threat model D — Hardware root lock-in

    Hardware anchors cannot be migrated
       ->
    Classical cryptography remains in service past PQC deadline

Financial asset classes affected: HSM keys, ATM/POS firmware, payment
terminals, smart cards.

### Section 6 — Procurement and Third-Party Considerations

- Vendor PQC roadmaps (PKI, HSM, quantum platform)
- Contractual evidence requirements (DORA Article 30)
- Vendor CBOM / SBOM disclosure
- Quantum platform isolation evidence (QS08)
- Quantum toolchain integrity evidence (QS09)
- Side-channel disclosure (QS10)
- Exit strategies for critical vendor dependencies

### Section 7 — Supervisory Evidence Requirements

For each risk area, what evidence is required to demonstrate
compliance and effective risk management:

| Risk area | Evidence required |
|---|---|
| HNDL exposure | Cryptographic inventory (QS04); confidentiality lifetime assessment |
| Signature trust | Trust chain inventory; re-signing / re-issuance records |
| Crypto agility | cMTTR metric; rotation test records |
| Migration | Hybrid deployment verification; fallback policy records |
| Hardware | HSM/TPM lifecycle; replacement roadmap; compensating controls |
| Quantum platform | Provider isolation evidence; toolchain integrity evidence; side-channel disclosure |

### Section 8 — Metrics

Financial-services-specific metrics:

- **Cryptographic asset coverage** — % of assets in inventory
- **Confidentiality lifetime coverage** — % of assets with documented confidentiality lifetime
- **Signature assurance coverage** — % of signing infrastructure with documented assurance lifetime
- **Agility coverage** — % of systems with tested rotation path
- **Migration progress** — % of quantum-vulnerable algorithms retired
- **Third-party coverage** — % of providers with PQC roadmap and evidence

### Section 9 — Financial Services Cross-Entry Contribution Candidates

Sector-specific contribution candidates:

1. Financial-services HNDL data classification model
2. Financial-services signature assurance lifetime framework
3. Financial-services cryptographic inventory template (CBOM + sector classes)
4. Financial-services third-party PQC evidence requirements
5. Financial-services supervisory reporting alignment

## 5. Integration Approach

The unified profile integrates the three existing FSP files by:

1. Extracting the sector-specific content from each
2. Removing duplication (asset classes appear in multiple files)
3. Adding platform-surface coverage (QS05-QS10)
4. Adding cross-cutting sections (regulatory overlay, threat models,
   metrics, supervisory evidence)

The three existing FSP files remain as extension-specific references.
The unified profile is the top-level sector view.

## 6. Relationship to OWASP Entries

The unified profile does not modify OWASP content. It provides:

- Financial-services interpretation of OWASP entries
- Sector-specific data classes and threat models
- Regulatory alignment
- Supervisory evidence requirements

The profile can be referenced from OWASP Issues or PRs when the
sector-specific application is relevant, but it is not itself OWASP
content.

## 7. Open Questions

### Q1

Should the unified profile be submitted to OWASP as a sector-specific
supplement, or maintained as a personal research artifact?

### Q2

Which regulatory anchors should be cited with full scope and which can
be referenced summarily?

### Q3

Should the profile include jurisdiction-specific sections (EU vs U.S.
vs UK vs APAC), or remain jurisdiction-neutral?

### Q4

How does the unified profile interact with the OWASP entries' own
Standards and Regulatory Mapping sections?

### Q5

Should the profile include a maturity model (aligned with NIST CSWP
39upd1 four-tier model), or remain a descriptive rather than
assessment tool?

## 8. Recommendation

Proceed with the unified profile as outlined.

Recommended sequencing:

1. Complete the outline (this document)
2. Draft the unified profile file
   (`06_Financial_Services_Profile/00_Unified_Profile.md`)
3. Migrate content from the three existing FSP files
4. Add platform-surface sections (QS05-QS10)
5. Add cross-cutting sections
6. Optionally submit as sector-specific supplement

The unified profile is a high-value financial-services artifact and
aligns with the user's professional domain.

## 9. Draft Scope for Immediate Next Step

If the unified profile is pursued, the first draft should cover:

- Section 1: Financial Services Landscape (2-3 pages)
- Section 2: Cryptographic Asset Classes (table, 2 pages)
- Section 3: Cross-Entry Application (table, 2 pages)
- Section 4: Regulatory Overlay (4-5 pages, detailed DORA)

Sections 5-9 can be added in subsequent drafts.

**Reviewed:** 2026-10-04
**Scope:** Financial Services Unified Profile outline
**Status:** Outline complete; unified profile drafting pending
**Next step:** Draft unified profile file after independent validation