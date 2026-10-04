# Landscape Regulatory Context

## 1. Purpose

This document provides the taxonomy, jurisdiction scope reference, and
cross-entry anchor index used consistently across all Quantum Security
Top 10 entries. It exists because the eight active entries' Standards
and Regulatory Mapping sections currently cite sources without a shared
classification discipline.

This document does not modify OWASP content. It is the reference against
which per-entry Standards and Regulatory Mapping sections are aligned in
proposed OWASP contributions.

---

## 2. Source Type Taxonomy

Every source cited in a Standards and Regulatory Mapping section should
be classified by one of the following types:

| Type | Definition | Example |
|---|---|---|
| Standard | Final normative specification issued by an authoritative standards body | NIST FIPS 203, RFC 9881 |
| Draft | Public draft or initial public draft; not yet normative | NIST IR 8547 (IPD) |
| Government guidance | Non-binding guidance issued by a government authority | UK NCSC PQC timelines |
| Government policy | Binding policy applicable to a defined government scope | NSM-10, OMB M-23-02 |
| Policy roadmap | Coordination framework; not regulation | EU Coordinated PQC Roadmap |
| Algorithm suite / advisory | Recommended or required algorithm suites | NSA CNSA 2.0 |
| Directive | EU legal instrument requiring national implementation | NIS2 |
| Regulation | EU legal instrument directly applicable | DORA, CRA |
| Regulatory Technical Standard | Technical specification supporting an EU regulation | DORA RTS |
| Industry / open specification | Specification from industry consortium or open community | CycloneDX CBOM, SPDX, SLSA, in-toto |
| Research literature | Peer-reviewed academic or industry research | KyberSlash, QTrojan, Xu et al. |

**Key distinction.** A Standard, Draft, Guidance, Roadmap, Policy, and
Regulation have fundamentally different legal and normative weight. They
must not be presented in a flat list.

---

## 3. Jurisdiction Scope Reference

Every cited source should be qualified by jurisdiction and applicability:

| Scope | Applies to | Example |
|---|---|---|
| U.S. federal | U.S. federal agencies | OMB M-23-02 |
| U.S. National Security Systems | NSS only | NSA CNSA 2.0 |
| U.S. government | Broader U.S. federal policy | NSM-10 |
| EU Member States | Member state governments | EU Coordinated PQC Roadmap |
| EU financial entities | Banks, insurers, payment processors | DORA |
| EU covered entities | NIS2-covered sectors | NIS2 |
| EU products with digital elements | Products placed on EU market | CRA |
| UK | UK organisations | NCSC guidance |
| International | Global applicability | IETF RFCs, NIST standards (widely adopted) |

**Rule.** A scope-qualified source must not be generalized. For example:

- OMB M-23-02 applies to U.S. federal agencies; it is not a general
  industry mandate.
- CNSA 2.0 applies to U.S. National Security Systems; it is not a
  commercial regulatory requirement.
- NCSC PQC timelines are UK guidance; they are not a universal deadline.
- The EU Coordinated PQC Roadmap is a coordination framework; it is not
  directly binding regulation.

---

## 4. Cross-Entry Regulatory Anchor Index

The following table indexes which entries cite which regulatory anchors.
This index supports per-entry Standards and Regulatory Mapping sections
and identifies where landscape-wide consistency applies.

| Source | Type | Scope | Cited by |
|---|---|---|---|
| NIST FIPS 203 (ML-KEM) | Standard | International | QS01, QS04, QS06, QS07, QS09, QS10 |
| NIST FIPS 204 (ML-DSA) | Standard | International | QS03, QS04, QS06, QS07 |
| NIST FIPS 205 (SLH-DSA) | Standard | International | QS03, QS04 |
| NIST FIPS 186-5 | Standard | International | QS03 |
| NIST SP 800-208 | Standard | International | QS03 |
| NIST SP 800-227 | Standard | International | QS01 |
| NIST IR 8547 | Draft | International | QS01, QS03, QS04, QS05 |
| NIST CSWP 39upd1 | Standard / final | International | QS05 |
| UK NCSC PQC timelines | Government guidance | UK | QS01, QS03, QS04, QS05, QS07 |
| CISA / NSA / NIST fact sheet | Government guidance | U.S. | QS01, QS04, QS05 |
| EU Coordinated PQC Roadmap | Policy roadmap | EU Member States | QS01, QS03, QS04, QS05, QS06 |
| NSM-10 | Government policy | U.S. government | QS01 |
| OMB M-23-02 | Government policy | U.S. federal | QS01, QS04 |
| NSA CNSA 2.0 | Algorithm suite / policy | U.S. NSS | QS01, QS03, QS05, QS07 |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | QS03, QS04, QS05, QS06 |
| DORA Art. 9 | Regulation | EU financial | QS01, QS03, QS04 |
| DORA RTS Art. 6 | RTS | EU financial | QS01, QS04 |
| DORA RTS Art. 7 | RTS | EU financial | QS01, QS04 |
| DORA Articles 28-44 | Regulation | EU financial | QS03, QS08, QS09 |
| CRA Annex I | Regulation | EU products | QS03, QS04, QS06 |
| CRA Annex IV | Regulation | EU products | QS07 |
| CycloneDX CBOM v1.7 | Industry specification | International | QS04 |
| CycloneDX Cryptography Registry | Industry specification | International | QS04 |
| SPDX | Industry specification | International | QS04 |
| SLSA | Industry specification | International | QS09 |
| IETF RFC 8446 | Standard | International | QS06, QS09 |
| IETF RFC 9334 (RATS) | Standard | International | QS09 |
| IETF RFC 9881 | Standard | International | QS03 |
| IETF RFC 9882 | Standard | International | QS03 |
| IETF RFC 9909 | Standard | International | QS03 |
| IETF RFC 9954 | Standard | International | QS03, QS05, QS06 |
| IETF RFC 9964 | Standard | International | QS03 |
| TCG TPM 2.0 v185 | Industry specification | International | QS03, QS07 |
| TCG PTP 1.07 | Industry specification | International | QS03, QS07 |
| UEFI Secure Boot | Industry specification | International | QS03, QS07 |
| CA/Browser Forum Ballot SC-081 | Industry ballot | International | QS03 |
| Research papers | Research literature | International | QS03, QS08, QS09, QS10 |

---

## 5. Regulatory Non-Mandate Rule

**No cited source mandates a specific cryptographic algorithm unless its
implementing requirement or harmonised standard establishes that
obligation.**

Examples:

- NIS2 Article 21(2)(h) requires cryptography and encryption policies as
  part of cybersecurity risk management. It does not mandate PQC.
- DORA Article 9 requires confidentiality, integrity, and availability of
  data. It does not mandate PQC.
- DORA RTS Article 6 requires encryption and cryptographic controls based
  on data classification. It does not mandate PQC.
- DORA RTS Article 7 requires a cryptographic key lifecycle. It does not
  mandate PQC.
- CRA Annex I requires state-of-the-art mechanisms for confidentiality
  and integrity. It does not mandate PQC.
- CRA Annex IV lists critical product categories. It does not mandate
  PQC.

**Correct phrasing:**
> "DORA RTS Article 6 requires encryption and cryptographic controls
> based on data classification; its applicability to PQC migration
> should be assessed in light of the implementing requirements and
> applicable standards."

**Incorrect phrasing:**
> "DORA requires PQC migration."

---

## 6. Regulatory Wording Discipline

When drafting Standards and Regulatory Mapping sections, use the
following patterns:

| Pattern | Example |
|---|---|
| `<Source>` requires `<control>` | "CRA Annex I requires state-of-the-art confidentiality mechanisms." |
| `<Source>` applies to `<scope>` | "DORA applies to EU financial entities." |
| `<Source>` establishes `<framework>`; applicability to `<topic>` should be assessed in light of `<context>` | "DORA RTS Article 6 establishes encryption and cryptographic controls; its applicability to PQC should be assessed in light of implementing requirements." |
| `<Source>` provides `<guidance>` for `<audience>` | "NCSC provides PQC migration guidance for UK organisations." |
| `<Source>` establishes `<requirement>`; it does not mandate a specific algorithm | "CRA Annex I establishes confidentiality requirements; it does not mandate a specific algorithm." |

Avoid:
- "X mandates PQC" unless the source does so explicitly
- "X requires CBOM" unless the source does so explicitly
- "X prohibits classical cryptography" unless the source does so
  explicitly with a defined scope
- Generalized claims from sector-specific or national sources

---

## 7. Application to the Eight Standards and Regulatory Mapping TODOs

Eight active entries (QS03, QS04, QS05, QS06, QS07, QS08, QS09, QS10)
currently carry identical TODO comments in their Standards and Regulatory
Mapping sections. This document provides the reference for resolving
those TODOs.

**Recommended resolution:** apply the taxonomy from section 2, the
jurisdiction scope from section 3, and the wording discipline from
section 6 to each per-entry Standards and Regulatory Mapping section.
The result is a short per-entry table (4-8 rows) using the columns:

| Source | Type | Jurisdiction / Scope | Relevance to this entry |
|---|---|---|---|

**Landscape-wide consistency:** Sources that appear in multiple entries
should be classified identically. This document is the single source of
truth for the classification.

---

## 8. Non-OWASP Status

This document is an internal research artifact. It does not modify any
OWASP content. It is the reference used to align proposed Standards and
Regulatory Mapping sections in future OWASP contributions.

---

**Status:** Review Complete (Evidence validation pending)
**Submission:** Not submitted
**Depends on:** QS01, QS03, QS04 deep-dive reviews; QS05-QS10 rapid
audits; QSxx candidate reviews