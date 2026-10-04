---

## QS05 - Crypto-Agility Failures

Rapid audit. Findings: 5. Status: Complete (rapid).

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS05-OBS-001 | 2026-10-04 | QS05 | Entry quality assessment (positive) | Verified | Note only | Note | Drafted |
| QS05-OBS-002 | 2026-10-04 | QS05 | cMTTR operationalization | Provisional | Potential contribution | Needs research | Drafted |
| QS05-OBS-003 | 2026-10-04 | QS05 | QS05 <-> QS06 boundary pressure | Provisional | Boundary question | Deferred | Drafted |
| QS05-OBS-004 | 2026-10-04 | QS05 | Procurement demonstrability undefined | Provisional | Clarification | Needs research | Drafted |
| QS05-OBS-005 | 2026-10-04 | QS05 | Symmetric agility coverage | Provisional | Extension | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- Deep-dive decision deferred until QS06 audit and NIST CSWP 39upd1 review.
- Scenario #2 boundary pressure is carried forward to QS06 audit.

See `02_QS_Audit/QS05_Rapid_Audit.md` for the full rapid audit.

---

## QS06 - Insecure Migration and Hybrid Misuse

Rapid audit. Findings: 6. Status: Complete (rapid).

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS06-OBS-001 | 2026-10-04 | QS06 | Entry quality assessment (positive) | Verified | Note only | Note | Drafted |
| QS06-OBS-002 | 2026-10-04 | QS06 | Fallback semantics QS05 boundary | Verified | Boundary resolution | Resolves QS05-OBS-003 | Drafted |
| QS06-OBS-003 | 2026-10-04 | QS06 | "Configured but unobserved" verification axis | Provisional | Potential contribution | Needs research | Drafted |
| QS06-OBS-004 | 2026-10-04 | QS06 | Middlebox / operator governance failure mode | Provisional | Cross-entry observation | Needs research | Drafted |
| QS06-OBS-005 | 2026-10-04 | QS06 | Pre-standard Kyber / Dilithium lifecycle overlap | Provisional | Boundary observation | Needs research | Drafted |
| QS06-OBS-006 | 2026-10-04 | QS06 | Standards and Regulatory Mapping TODO | Verified | Cross-entry pattern | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- QS05-OBS-003 resolved (complementary, not conflicting).
- QS05 cMTTR clarified: NIST CSWP 39upd1 does not define cMTTR
  specifically, but provides compatible maturity framework.
- No deep dive recommended for QS06.

See `02_QS_Audit/QS06_Rapid_Audit.md` for the full rapid audit.

---

## QS07 - Hardware Roots of Trust

Rapid audit. Findings: 7. Status: Complete (rapid).

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS07-OBS-001 | 2026-10-04 | QS07 | Entry quality assessment (context) | Verified | Note only | Note | Drafted |
| QS07-OBS-002 | 2026-10-04 | QS07 | TCG TPM 2.0 v185 PQC support under-cited | Verified | Correction | Needs research | Drafted |
| QS07-OBS-003 | 2026-10-04 | QS07 | UEFI Secure Boot PQC direction under-cited | Provisional | Correction | Needs research | Drafted |
| QS07-OBS-004 | 2026-10-04 | QS07 | HSM / smart card capacity analysis incomplete | Provisional | Extension | Needs research | Drafted |
| QS07-OBS-005 | 2026-10-04 | QS07 | Hardware re-anchoring methodology absent | Verified | Contribution candidate | Needs research | Drafted |
| QS07-OBS-006 | 2026-10-04 | QS07 | Compensating controls not framed | Provisional | Extension | Needs research | Drafted |
| QS07-OBS-007 | 2026-10-04 | QS07 | Standards and Regulatory Mapping TODO | Verified | Cross-entry pattern | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- QS06-OBS-003 and QS06-OBS-005 partially resolved via QS07 boundary.
- Deep-dive OPTIONAL, focused on hardware re-anchoring methodology +
  HSM capacity + compensating controls framework.
- Cross-entry candidates: QS03 (TPM/UEFI), QS04 (hardware inventory),
  QS07 (migration constraints).

See `02_QS_Audit/QS07_Rapid_Audit.md` for the full rapid audit.

---

## QS08 - QPU Tenant Isolation Failures

Rapid audit. Findings: 7. Status: Complete (rapid). Platform surface.

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS08-OBS-001 | 2026-10-04 | QS08 | Entry quality and character (positive) | Verified | Note only | Note | Drafted |
| QS08-OBS-002 | 2026-10-04 | QS08 | Platform surface vs migration surface boundary | Provisional | Boundary definition | Needs research | Drafted |
| QS08-OBS-003 | 2026-10-04 | QS08 | Isolation evidence framework missing | Provisional | Contribution candidate | Needs research | Drafted |
| QS08-OBS-004 | 2026-10-04 | QS08 | DORA Article 28 scope precision | Verified | Scope qualification | Needs research | Drafted |
| QS08-OBS-005 | 2026-10-04 | QS08 | Shared-QPU output observability decision model | Provisional | Extension | Needs research | Drafted |
| QS08-OBS-006 | 2026-10-04 | QS08 | Standards-track progress not tracked | Provisional | Extension | Needs research | Drafted |
| QS08-OBS-007 | 2026-10-04 | QS08 | Standards and Regulatory Mapping TODO | Verified | Cross-entry pattern | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- First platform-surface entry reviewed.
- No migration-surface carry-forward applies.
- Deep-dive OPTIONAL, focused on isolation evidence framework.
- Financial-services relevance: proprietary optimisation on quantum
  cloud + DORA Article 28 alignment.

See `02_QS_Audit/QS08_Rapid_Audit.md` for the full rapid audit.

---

## QS09 - Toolchain and Compiler Compromise

Rapid audit. Findings: 7. Status: Complete (rapid). Platform surface.

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS09-OBS-001 | 2026-10-04 | QS09 | Entry quality and technical density (positive) | Verified | Note only | Note | Drafted |
| QS09-OBS-002 | 2026-10-04 | QS09 | Submitted-to-dispatch-to-result integrity chain | Verified | Contribution candidate | Needs research | Drafted |
| QS09-OBS-003 | 2026-10-04 | QS09 | Provider assertion vs independent proof | Verified | Contribution candidate | Needs research | Drafted |
| QS09-OBS-004 | 2026-10-04 | QS09 | Three attack classes tabulation suggestion | Provisional | Editorial | Note | Drafted |
| QS09-OBS-005 | 2026-10-04 | QS09 | SLSA and RFC 9334 not operationalized | Verified | Extension | Needs research | Drafted |
| QS09-OBS-006 | 2026-10-04 | QS09 | DORA Articles 28-44 - Article 30 emphasis | Verified | Scope refinement | Needs research | Drafted |
| QS09-OBS-007 | 2026-10-04 | QS09 | Standards and Regulatory Mapping TODO | Verified | Cross-entry pattern | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- Second platform-surface entry.
- Strongest single contribution candidate of the landscape:
  submitted-to-dispatch-to-result integrity chain.
- Deep-dive RECOMMENDED for integrity chain model.
- Platform surface may be a three-layer stack (toolchain / execution /
  infrastructure) - suggested for REVIEW_METHODOLOGY.md update.
- QS04 cross-reference possibility noted.

See `02_QS_Audit/QS09_Rapid_Audit.md` for the full rapid audit.

---

## QS10 - Side-Channel and Control-Plane Exposure

Rapid audit. Findings: 6. Status: Complete (rapid). Platform surface.

| ID | Date | QS | Observation | Evidence | Contribution | Disposition | Status |
|---|---|---|---|---|---|---|---|
| QS10-OBS-001 | 2026-10-04 | QS10 | Entry quality and threat-model discipline (positive) | Verified | Note only | Note | Drafted |
| QS10-OBS-002 | 2026-10-04 | QS10 | Provider side-channel disclosure framework missing | Provisional | Contribution candidate | Needs research | Drafted |
| QS10-OBS-003 | 2026-10-04 | QS10 | Physical-to-remote threat transition model absent | Provisional | Extension | Needs research | Drafted |
| QS10-OBS-004 | 2026-10-04 | QS10 | Workload-level mitigation trade-offs not modeled | Provisional | Extension | Needs research | Drafted |
| QS10-OBS-005 | 2026-10-04 | QS10 | FIPS 140-3 / Common Criteria operationalization | Provisional | Extension | Needs research | Drafted |
| QS10-OBS-006 | 2026-10-04 | QS10 | Standards and Regulatory Mapping TODO (pattern) | Verified | Cross-entry pattern | Needs research | Drafted |

Notes:

- Rapid audit, not full deep-dive.
- Third and final platform-surface entry.
- Platform-surface three-layer model confirmed:
  - QS09 toolchain layer
  - QS08 execution layer
  - QS10 infrastructure layer
- Cross-entry contribution candidate: unified platform-surface
  provider evidence model spanning QS08 + QS09 + QS10.
- All 9 active entries now reviewed (QS01, QS03-QS10).

See `02_QS_Audit/QS10_Rapid_Audit.md` for the full rapid audit.

---

## QSxx Candidate Audit

Four candidate entries from Pre-Sprint 0 reviewed for scope,
distinctiveness, and overlap with active entries.

| Candidate | Recommendation | Rationale |
|---|---|---|
| Compliance Obligations | DO NOT ADOPT (standalone) | Framing not quantum-specific; overlaps every entry's Standards and Regulatory Mapping; consider merge with landscape-wide regulatory framework |
| Insecure Quantum Software Supply Chain | STRONG ADOPT | Self-delineated from QS09; strong research anchors; complements QS09 |
| Misdirected Quantum Countermeasures | STRONG ADOPT | Novel conceptual position (believes it has migrated); strong NCSC/NSA anchors; financial-services relevance |
| Unverifiable Quantum Execution and Result Assurance | STRONG ADOPT | Novel problem (execution assurance); strong peer-reviewed anchor; explicit scope delineation from QS08/QS09/QS10 |

See `02_QS_Audit/QSxx_Candidates/` for the full candidate reviews.

| QS | Findings | Issues drafted | PRs drafted | Status |
|---|---|---|---|---|
| QS01 | 27 | 4 | 1 | Review Complete |
| QS03 | 40 | 4 | 1 | Review Complete |
| QS04 | 52 | 4 | 1 | Review Complete |
| QS05 | 5 | 0 | 0 | Review Complete |
| QS06 | 6 | 0 | 0 | Review Complete |
| QS07 | 7 | 0 | 0 | Review Complete |
| QS08 | 7 | 0 | 0 | Review Complete |
| QS09 | 7 | 0 | 0 | Review Complete |
| QS10 | 6 | 0 | 0 | Review Complete |
| QSxx Candidates | 4 reviewed | 0 | 0 | Candidate review complete |
| **Total** | **157** | **12** | **3** | All active entries + candidates reviewed |