# Landscape-Wide Standards and Regulatory Mapping TODO Resolution Plan

## 1. Scope & Method

This document addresses the same TODO comment that appears in the
Standards and Regulatory Mapping section of eight active entries:

> "TODO: This section is carried over from the source document and is
> not part of _template.md. Confirm whether to keep it in the final
> entry format, and verify each standard/citation."

The purpose is to propose a landscape-wide resolution rather than
resolving the TODO individually in eight separate entries. Per-entry
resolution risks producing eight slightly different structures,
inconsistent taxonomy, and possible contradictions.

This document is internal. It does not modify any OWASP content
directly. It proposes a structure that would be applied landscape-wide
if adopted.

---

## 2. Problem Statement

Every active entry from QS03 to QS10 carries the identical TODO comment
in its Standards and Regulatory Mapping section. The section itself is
carried over from an earlier source document and is not part of the
current entry template.

The section contents vary significantly:

- Some entries cite regulatory anchors with precision (QS09 cites DORA
  Articles 28-44 and CRA Annex I with scope qualification)
- Some entries cite with less precision (QS10 has the shortest section;
  it does not mention DORA, NIS2, or CRA)
- Some entries include substantive content in the TODO text itself
  (QS09's TODO text is nearly a resolved section)
- Some entries are almost empty aside from the TODO (QS08)

Additionally, each entry's Reference Links section already cites
regulatory anchors with varying precision. The Regulatory Mapping
section is intended to add scope and taxonomy, not to duplicate the
references.

---

## 3. The Eight Instances

| Entry | Finding ID | Section length | DORA cited | NIS2 cited | CRA cited | NSA/CNSA cited |
|---|---|---|---|---|---|---|
| QS03 | QS03-OBS-019 | Medium | Art. 28-44 (via Art. 30) | Yes | Yes | Yes |
| QS04 | QS04-OBS-039 | Medium | Art. 9 (via RTS 6/7) | Yes | Yes | No |
| QS05 | QS05-OBS-006 | Short | No | Yes | Yes | No |
| QS06 | QS06-OBS-006 | Short | Art. 9 (short) | Yes | No | No |
| QS07 | QS07-OBS-007 | Short | No | No | Yes (Annex IV) | Yes |
| QS08 | QS08-OBS-007 | Minimal | Art. 28 (short) | No | No | No |
| QS09 | QS09-OBS-007 | Medium (detailed TODO text) | Art. 28-44 | No | Yes (Annex I) | No |
| QS10 | QS10-OBS-006 | Minimal | No | No | No | No |

Observations:

- DORA is cited in six of eight entries, but scope varies widely
  (Article 9 only, Article 28, Articles 28-44)
- NIS2 is cited in four entries (QS03, QS04, QS05, QS06)
- CRA is cited in five entries (QS03, QS04, QS05, QS07, QS09)
- NSA / CNSA 2.0 is cited in QS03 and QS07 only
- QS10 cites no EU regulatory anchors at all

This inconsistency is not itself a defect, because different entries
have different regulatory relevance. But the taxonomy that would make
that relevance explicit is missing from every entry.

---

## 4. What the Resolution Should Provide

Based on the QS01, QS03, and QS04 reference audits conducted earlier
in this workspace, the following are the elements that should be
present in a standardized Standards and Regulatory Mapping section.

### 4.1 Taxonomy discipline

Each cited source should be classified by type:

- Standard (final, normative)
- Draft / Initial Public Draft (not normative)
- Government guidance (e.g., NCSC, CISA)
- Government policy (e.g., NSM-10, OMB M-23-02)
- Policy roadmap (e.g., EU Coordinated Implementation Roadmap)
- Algorithm suite / advisory (e.g., CNSA 2.0)
- Directive (e.g., NIS2)
- Regulation (e.g., DORA, CRA)
- Regulatory Technical Standard (e.g., DORA RTS)
- Industry / open specification (e.g., CycloneDX, SPDX, SLSA)
- Research literature (e.g., peer-reviewed papers)

### 4.2 Jurisdiction / scope discipline

Each cited source should be qualified by jurisdiction and applicability:

- U.S. federal (agencies only)
- U.S. National Security Systems (CNSA 2.0 only)
- EU Member States (roadmap, directives)
- EU financial entities (DORA)
- EU covered entities (NIS2)
- EU products with digital elements (CRA)
- UK (NCSC guidance)
- International (IETF, ISO, industry specifications)

### 4.3 Relevance to the entry

Each cited source should be linked to the specific entry section it
informs, so the reader can see why it is included and how it applies.

### 4.4 Non-duplication with Reference Links

Where a source is already listed in the entry's Reference Links section
for the same purpose, the Standards and Regulatory Mapping section
should either:

- Consolidate (list once, in the mapping section), or
- Differentiate (Reference Links = citation, Mapping = scope and
  applicability)

The current situation is that both sections cite the same sources with
different levels of precision, which is confusing.

---

## 5. Proposed Resolution Options

### Option 1 — Landscape-wide template applied per-entry

Define a standardized Standards and Regulatory Mapping section template
and apply it consistently in all eight entries.

Advantages:

- Consistent structure across the landscape
- Reader can compare entries at a glance
- Per-entry specificity preserved

Disadvantages:

- Requires touching eight entries individually
- May take multiple OWASP PR cycles

### Option 2 — Single landscape-wide regulatory framework document

Create a single document (e.g., `Standards_and_Regulatory_Context.md`)
that holds the taxonomy and scope discipline once, and have each entry's
Standards and Regulatory Mapping section reference it.

Advantages:

- Single source of truth
- Reduces duplication
- Easier maintenance

Disadvantages:

- Reader has to navigate to a separate document
- OWASP entry format may not support external cross-references well
- Loses per-entry specificity

### Option 3 — Hybrid: per-entry summary + landscape-wide context

Each entry keeps a short Standards and Regulatory Mapping section
(4-8 rows maximum), and a single landscape-wide document holds the
fuller taxonomy and jurisdiction reference.

Advantages:

- Per-entry section stays focused on relevance
- Landscape-wide document handles the full taxonomy
- Reader sees entry-level relevance plus full context

Disadvantages:

- Requires both per-entry edits and a new landscape-wide document
- More files to maintain

### Recommended: Option 3

The hybrid approach is recommended because:

- Each entry has different regulatory relevance, which per-entry
  sections can express
- The taxonomy and jurisdiction discipline is identical across
  entries, which a landscape-wide document can express once
- The OWASP Top 10 format benefits from entries being readable in
  isolation, with a landscape-wide document as supplementary

---

## 6. Proposed Per-Entry Template

The following template is proposed for the Standards and Regulatory
Mapping section of each entry. Fields use the same column set as the
QS01, QS03, QS04 regulatory mapping tables already present in
`08_Standards_Regulation/`.

    | Source | Type | Jurisdiction / Scope | Relevance to this entry |
    |---|---|---|---|

Entries where the mapping is short (e.g., QS08, QS10) may have 3-5
rows. Entries where the mapping is more substantial (e.g., QS01, QS03,
QS09) may have 8-12 rows.

The template does not prescribe a minimum or maximum row count. It
prescribes column structure and taxonomy discipline.

---

## 7. Existing Regulatory Tables as Foundation

Three regulatory mapping tables already exist in
`08_Standards_Regulation/`:

- `QS01_Regulatory_Mapping_Table.md`
- `QS03_Regulatory_Mapping_Table.md`
- `QS04_Regulatory_Mapping_Table.md`

These tables already use the recommended column structure. They can
serve as the reference for how the template should be applied across
all entries.

The remaining entries (QS05-QS10) do not yet have dedicated regulatory
mapping tables in `08_Standards_Regulation/`. If the recommended
Option 3 is adopted, tables for these entries would need to be created
on the same model.

---

## 8. Per-Entry Recommendations

### QS03 — Vulnerable Signatures and Code-Signing

Recommended rows:

- NIST FIPS 204, 205, 186-5, SP 800-208
- NIST IR 8547 (draft)
- NSA CNSA 2.0
- NCSC PQC guidance
- RFC 9881, 9882, 9909, 9964
- TCG TPM 2.0 v185, TCG PTP 1.07
- UEFI Secure Boot, UEFI PQC work
- CA/Browser Forum SC-081
- IETF LAMPS
- NIS2 Article 21(2)(h)
- DORA Articles 28-44 (esp. Article 30)
- CRA Annex I

Existing reference: `08_Standards_Regulation/QS03_Regulatory_Mapping_Table.md`

### QS04 — Cryptographic Discovery and Inventory Gaps

Recommended rows:

- UK NCSC PQC timelines
- CISA / NSA / NIST fact sheet
- EU PQC Roadmap
- NIST IR 8547
- CycloneDX CBOM, Cryptography Registry, key/cert use cases
- SPDX (adjacent BOM ecosystem)
- NIS2 Article 21(2)(h)
- DORA Article 9
- DORA RTS Article 6, Article 7
- DORA Article 30
- CRA Annex I

Existing reference: `08_Standards_Regulation/QS04_Regulatory_Mapping_Table.md`

### QS05 — Crypto-Agility Failures

Recommended rows:

- NIST CSWP 39upd1 (Final, 29 June 2026) - primary anchor
- NIST IR 8547 (draft)
- NSA CNSA 2.0
- NIST SP 1800-38 (practice detail)
- UK NCSC PQC timelines
- EU PQC Roadmap
- IETF PQUIP
- RFC 9954 (hybrid key exchange in TLS 1.3)
- draft-ietf-tls-ecdhe-mlkem
- CISA / NSA / NIST fact sheet
- NIS2 Article 21(2)(h) - state-of-the-art and risk-based
- DORA (Article 9 as anchor, RTS Article 6 for controls)
- CRA Annex I

New regulatory table needed: `08_Standards_Regulation/QS05_Regulatory_Mapping_Table.md`

### QS06 — Insecure Migration and Hybrid Misuse

Recommended rows:

- RFC 9954 (hybrid key exchange in TLS 1.3)
- draft-ietf-tls-ecdhe-mlkem
- RFC 8446 (TLS 1.3 base, transcript authentication)
- NIST FIPS 203, 204
- Bernstein et al. KyberSlash (research)
- CVE-2024-37880 Clangover (vulnerability)
- OpenSSL 3.5 release notes (implementation)
- IETF PQUIP
- EU PQC Roadmap (end-2030 standalone-classical prohibition)
- NIS2 Article 21(2)(h)
- DORA Article 9 (short reference; no DORA RTS scope)
- CRA Annex I (if applicable)

New regulatory table needed: `08_Standards_Regulation/QS06_Regulatory_Mapping_Table.md`

### QS07 — Hardware Roots of Trust

Recommended rows:

- UK NCSC PQC timelines (hardware anchor milestones)
- NSA CNSA 2.0 (niche equipment and constrained devices by 2033)
- TCG TPM 2.0 v185
- TCG PTP 1.07
- UEFI Secure Boot specification
- UEFI PQC work (2026)
- 3GPP PQC for 6G
- IETF LAMPS
- CRA Annex IV (critical product categories: smart cards,
  smart-meter gateways)
- DORA (relevant for HSM management in financial entities)
- NIS2 (contextual)

New regulatory table needed: `08_Standards_Regulation/QS07_Regulatory_Mapping_Table.md`

### QS08 — QPU Tenant Isolation Failures

Recommended rows:

- Choudhury et al. (NDSS 2025) - crosstalk side-channel
- Ash-Saki et al. (ISLPED 2020) - crosstalk fault injection
- Xu et al. (CCS 2023) - reset-state leakage
- DORA Article 28 - third-party ICT risk
- No formal standard yet - explicit statement

New regulatory table needed: `08_Standards_Regulation/QS08_Regulatory_Mapping_Table.md`

### QS09 — Toolchain and Compiler Compromise

Recommended rows:

- Suresh et al. (HASP 2021) - circuit theft
- Chu et al. (IEEE ICASSP 2023) - QTrojan
- Xu and Szefer (IEEE S&P 2025) - pulse-level attacks
- Weder et al. - QProv provenance
- Hrda et al. - CHEQ
- SLSA provenance (generic)
- IETF RFC 9334 (RATS)
- DORA Articles 28-44 (Article 30 for contracts)
- CRA Annex I (applicability qualification)
- No formal standard yet - explicit statement

New regulatory table needed: `08_Standards_Regulation/QS09_Regulatory_Mapping_Table.md`

### QS10 — Side-Channel and Control-Plane Exposure

Recommended rows:

- Xu et al. (CCS 2023) - controller power side channel
- NIST FIPS 140-3 - partial physical-security coverage
- Common Criteria (ISO/IEC 15408) - partial evaluation framework
- No formal standard yet - explicit statement
- DORA Article 28 (if platform consumed by financial entity)
- NIS2 (contextual)

New regulatory table needed: `08_Standards_Regulation/QS10_Regulatory_Mapping_Table.md`

---

## 9. Landscape-Wide Document

If Option 3 is adopted, a single landscape-wide document should be
created at:

    08_Standards_Regulation/Landscape_Regulatory_Context.md

Content:

- Taxonomy of source types (Standard, Draft, Guidance, Policy,
  Roadmap, Directive, Regulation, RTS, Industry specification,
  Research)
- Jurisdiction scope reference (U.S. federal, U.S. NSS, EU, UK,
  international)
- Cross-entry regulatory anchor index (which entries cite which
  sources)
- Explicit statement that no cited source mandates a specific
  algorithm unless its implementing requirement does so

This document does not replace per-entry mapping. It supplements it
with the taxonomy and jurisdiction reference that is identical across
entries.

---

## 10. Open Questions

### Q1

Should the per-entry Standards and Regulatory Mapping section be
retained, replaced by Reference Links, or merged with Reference Links
into a single section?

### Q2

Should the landscape-wide regulatory context document be created as
part of the OWASP entry set, or as a personal research artifact that
informs the entries without being submitted?

### Q3

How should entries with minimal regulatory relevance (e.g., QS08, QS10)
handle the Standards and Regulatory Mapping section? Is a minimal
3-row table acceptable, or should they state explicitly that no formal
standard covers the topic?

### Q4

How should the resolution handle sources that appear in multiple
entries (e.g., DORA Article 9 in QS01, QS04, QS06; NIS2 in five
entries)? Is duplication acceptable, or should the landscape-wide
document be the single source of truth?

### Q5

The eight TODOs have slightly different wording, but the same intent.
Should the resolution replace all eight with an identical standard
sentence, or should the wording vary based on the entry's regulatory
content?

---

## 11. Recommendation

Adopt Option 3 (hybrid approach).

Actions:

1. Create the landscape-wide document
   `08_Standards_Regulation/Landscape_Regulatory_Context.md`
2. Create per-entry regulatory mapping tables in
   `08_Standards_Regulation/` for QS05-QS10 (following the existing
   QS01/QS03/QS04 table model)
3. Update each entry's Standards and Regulatory Mapping section with
   a short per-entry table and a reference to the landscape-wide
   document
4. Resolve the eight identical TODO comments in a single landscape-wide
   pass, not per-entry

This approach is defensible because:

- The taxonomy and jurisdiction discipline are identical across entries
- Per-entry specificity is preserved where it matters
- The OWASP reader sees entry-level relevance plus full context
- The eight TODOs are resolved consistently

---

**Reviewed:** 2026-10-04
**Scope:** Landscape-wide TODO resolution planning
**Status:** Plan drafted, not executed
**Depends on:** all 9 active entries reviewed (complete)
**Next step:** pending independent verification of the plan