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



| QS | Findings | Issues drafted | PRs drafted | Status |
|---|---|---|---|---|
| QS01 | 29 | 4 | 1 | Draft - awaiting QS05-QS10 validation |
| QS03 | 40 | 4 | 1 | Draft - awaiting QS05-QS10 validation |
| QS04 | 52 | 4 | 1 | Draft - awaiting QS05-QS10 validation |
| QS05 | 5 | 0 | 0 | Rapid audit complete |
| QS06 | 6 | 0 | 0 | Rapid audit complete |
| **Total** | **132** | **12** | **3** | - |