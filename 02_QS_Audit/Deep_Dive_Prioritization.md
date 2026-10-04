# Deep-Dive Prioritization

## 1. Purpose

This document prioritizes the deep-dive work and cross-entry
contribution candidates identified across the full landscape audit.
It provides an effort / value assessment to guide the decision about
which items to pursue next.

This is an internal planning artifact. It does not modify any OWASP
content.

---

## 2. Current State

### Completed deep dives

| Entry | Findings | Status |
|---|---|---|
| QS01 | 27 | Deep dive committed |
| QS03 | 40 | Deep dive committed |
| QS04 | 52 | Deep dive committed |

### Rapid audits complete, deep-dive decision pending

| Entry | Findings | Deep-dive decision | Rationale |
|---|---|---|---|
| QS05 | 5 | OPTIONAL (deferred) | cMTTR question now clarified against NIST CSWP 39upd1 |
| QS06 | 6 | NO DEEP DIVE | Well-constructed; complementary to QS05 |
| QS07 | 7 | OPTIONAL (financial-services focus) | Hardware re-anchoring methodology absent |
| QS08 | 7 | OPTIONAL (isolation evidence framework) | Provider evidence gap |
| QS09 | 7 | RECOMMENDED | Submitted-to-dispatch-to-result integrity chain |
| QS10 | 6 | NO deep dive (cross-entry preferred) | Entry is well-scoped |

### Cross-entry contribution candidates

Seven candidates were identified during the full landscape audit:

1. QS09 integrity chain (submitted-to-dispatch-to-result)
2. Platform-surface provider evidence model (QS08 + QS09 + QS10)
3. Operational verification methodology (QS04 + QS05 + QS06)
4. Hardware re-anchoring methodology (QS03 + QS04 + QS07)
5. Migration lifecycle model (QS04 + QS05 + QS06 + QS07)
6. cMTTR operationalization (QS05 + NIST CSWP 39upd1)
7. Landscape-wide regulatory framework (all entries)

---

## 3. Evaluation Criteria

Each deep-dive and contribution candidate is assessed against five
criteria:

| Criterion | Description |
|---|---|
| **Evidence base** | Is the underlying evidence already assembled? |
| **Novelty** | Does it present a novel framework or metric? |
| **Actionability** | Can the output be applied by practitioners? |
| **Financial-services relevance** | Does it align with regulated-sector needs? |
| **Implementation effort** | How much work is required to produce it? |

Each criterion is rated Low / Medium / High.

---

## 4. Deep-Dive Prioritization

### Tier 1 — Highest priority (pursue next)

#### QS09 deep dive — Submitted-to-dispatch-to-result integrity chain

| Criterion | Assessment |
|---|---|
| Evidence base | High - already assembled (RFC 9334, SLSA, DORA Articles 28-44, four attack papers) |
| Novelty | High - not yet a deployed standard (entry states this explicitly) |
| Actionability | High - can be applied to procurement and integration decisions |
| Financial-services relevance | High - DORA Article 30 alignment is direct |
| Implementation effort | Medium - framework formalization plus evidence package model |

**Rationale:** QS09 is the strongest single-entry contribution candidate
in the landscape. The integrity chain model is novel, concrete,
anchored, financially relevant, and operationally specified. It has the
clearest path from research artifact to OWASP Issue.

**Scope if pursued:**
- Formal four-artifact integrity chain model
- Provider-assertion vs independent-proof classification
- SLSA level mapping for quantum toolchain artifacts
- RFC 9334 RATS role mapping
- DORA Article 30-aligned evidence package model

### Tier 2 — Strong priority (pursue after Tier 1)

#### Cross-entry platform-surface provider evidence model (QS08 + QS09 + QS10)

| Criterion | Assessment |
|---|---|
| Evidence base | High - QS08, QS09, QS10 all reviewed |
| Novelty | Medium-High - unified model across three layers is new |
| Actionability | High - provider selection and procurement |
| Financial-services relevance | High - DORA Articles 28-44 alignment |
| Implementation effort | High - spans three entries |

**Rationale:** The three-layer platform model (toolchain / execution /
infrastructure) is confirmed. A unified provider evidence model would
integrate QS08 isolation evidence, QS09 integrity chain, and QS10
side-channel disclosure. This is a strong cross-entry contribution but
requires coordination across three entries.

**Scope if pursued:**
- Layer-specific evidence requirements (one per platform layer)
- Unified provider evidence package specification
- Alignment with DORA Articles 28-44 and CRA
- Integration with QS09 integrity chain framework

### Tier 3 — Medium priority

#### QS07 deep dive — Hardware re-anchoring methodology

| Criterion | Assessment |
|---|---|
| Evidence base | Medium - requires TCG, UEFI, HSM vendor research |
| Novelty | High - no current framework exists |
| Actionability | High - direct procurement relevance |
| Financial-services relevance | Very High - HSM and payment terminals |
| Implementation effort | High - needs vendor engagement |

**Rationale:** Hardware re-anchoring is a technically hard problem and
is the single most actionable gap in QS07. Financial-services relevance
is strong (HSM, payment terminals, ATM/POS). However, evidence requires
TCG and HSM vendor roadmaps that may not be publicly documented.

**Scope if pursued:**
- Re-anchoring methodology framework (from firmware update to ceremony)
- HSM / smart card capacity decision framework
- Compensating controls framework with decision criteria
- Cross-entry framing with QS03 (TPM/UEFI) and QS04 (hardware inventory)

#### QS08 deep dive — Isolation evidence framework

| Criterion | Assessment |
|---|---|
| Evidence base | Medium - research-driven; providers don't disclose |
| Novelty | High - "isolation as claim requiring evidence" is novel |
| Actionability | Medium-High - procurement and third-party risk |
| Financial-services relevance | High - proprietary optimisation on quantum cloud |
| Implementation effort | Medium |

**Rationale:** The isolation evidence framework is a strong contribution
candidate. However, it partially overlaps with the cross-entry platform
provider evidence model (Tier 2). If Tier 2 is pursued, QS08 deep dive
becomes a component of it, not a standalone deep dive.

### Tier 4 — Lower priority (defer)

#### QS05 deep dive — cMTTR operationalization

| Criterion | Assessment |
|---|---|
| Evidence base | High - NIST CSWP 39upd1 reviewed |
| Novelty | Medium - NIST provides compatible framework but not specific metric |
| Actionability | Medium-High - metric needs adoption |
| Financial-services relevance | High - KPI for boards |
| Implementation effort | Low-Medium |

**Rationale:** The cMTTR question was clarified during the QS06 audit.
NIST does not define cMTTR specifically but provides a compatible
four-tier maturity model. The QS05 cMTTR may be an original
operationalization. However, standalone this is a single-metric
contribution, which may be too narrow for a deep dive.

**Alternative:** Integrate with Tier 2 or Tier 3 contribution rather
than a standalone QS05 deep dive.

#### QS06 deep dive

**Decision:** NO DEEP DIVE. Entry is well-constructed. Findings are
precision-level and boundary-level.

#### QS10 deep dive

**Decision:** NO DEEP DIVE. Cross-entry platform model preferred
(captured in Tier 2).

---

## 5. Cross-Entry Contribution Prioritization

The seven cross-entry contribution candidates are assessed as follows:

| # | Candidate | Evidence | Novelty | Actionability | FS relevance | Effort | Priority |
|---|---|---|---|---|---|---|---|
| 1 | QS09 integrity chain | High | High | High | High | Medium | **Tier 1** |
| 2 | Platform-surface provider evidence model | High | Med-High | High | High | High | **Tier 2** |
| 3 | Operational verification methodology (QS04 + QS05 + QS06) | Medium | Medium | Medium-High | Medium | High | Tier 3 |
| 4 | Hardware re-anchoring methodology (QS03 + QS04 + QS07) | Medium | High | High | Very High | High | **Tier 3** |
| 5 | Migration lifecycle model (QS04 + QS05 + QS06 + QS07) | High | Medium | Medium | High | High | Tier 3 |
| 6 | cMTTR operationalization (QS05) | High | Medium | Medium-High | High | Low-Med | Tier 4 |
| 7 | Landscape-wide regulatory framework | High | Medium | Medium | High | Medium | Already planned (Option B) |

**Recommended sequencing:**

1. **Immediate:** QS09 deep dive (Tier 1)
2. **After QS09:** Platform-surface provider evidence model (Tier 2)
3. **Parallel track:** Landscape-wide regulatory framework (Option B -
   already planned)
4. **After Tier 1+2:** Hardware re-anchoring methodology (Tier 3)
5. **Defer:** Operational verification, migration lifecycle, cMTTR
   (Tier 3-4)

---

## 6. Effort / Value Matrix
HIGH VALUE
|
QS09 | Platform-surface
integrity | provider evidence
chain | model
|
|
Hardware | Migration
re-anchoring | lifecycle
|
|
cMTTR | Operational
| verification
|
LOW VALUE
LOW EFFORT ------------- HIGH EFFORT

**Interpretation:**

- **Top-left (high value, low effort):** QS09 integrity chain - pursue
  first
- **Top-right (high value, high effort):** Platform-surface provider
  evidence model - pursue second, requires coordination
- **Middle-left (medium value, low effort):** Hardware re-anchoring -
  actually medium effort, deferred to Tier 3
- **Bottom-right (medium value, high effort):** Operational
  verification, migration lifecycle - defer

---

## 7. Recommended Deep-Dive Sequence

### Immediate next (after independent validation)

**QS09 deep dive — Integrity chain formalization**

Deliverables:

- `02_QS_Audit/QS09_Integrity_Chain/` folder
- `00_Integrity_Chain_Model.md` — four-artifact chain formalization
- `01_Provider_Evidence_Classification.md` — assertion vs proof
- `02_SLSA_and_RATS_Mapping.md` — generic framework mapping
- `03_DORA_Article_30_Evidence_Package.md` — financial-services evidence
- `04_Proposed_OWASP_Text.md` — proposal for QS09 entry revision

### Second

**Platform-surface provider evidence model**

Deliverables:

- `02_QS_Audit/Platform_Provider_Evidence/` folder
- Unified model across QS08 + QS09 + QS10
- Cross-entry contribution proposal

### Third

**Landscape-wide regulatory framework**

This is already planned in Option B. Execute the plan after independent
validation.

---

## 8. Open Questions

### Q1

Should the QS09 deep dive proceed before or after independent validation of
the prioritization?

### Q2

Should the platform-surface provider evidence model be developed by
extending the QS09 deep dive, or as an independent cross-entry track?

### Q3

Should the landscape-wide regulatory framework (Option B) be executed
in parallel with QS09 deep dive, or sequenced after?

### Q4

How should the OWASP sprint timeline (public review closed October 5;
final review October 5-12) affect the sequencing?

---

## 9. Recommendation

Priority sequencing:

1. QS09 deep dive (Tier 1) — highest single-entry contribution
2. Platform-surface provider evidence model (Tier 2) — highest
   cross-entry contribution
3. Landscape-wide regulatory framework (Option B plan) — already
   scoped
4. Hardware re-anchoring methodology (Tier 3) — financial-services
   focus
5. Defer operational verification, migration lifecycle, cMTTR

Pending: independent review of this prioritization, then execution.

---

**Reviewed:** 2026-10-04
**Scope:** Deep-dive and cross-entry contribution prioritization
**Status:** Draft — pending independent verification
**Next step:** Execute QS09 deep dive after independent validation