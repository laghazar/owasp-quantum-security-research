# Evidence Matrix

QA Checklist completion matrix for contribution candidates.

This matrix tracks, for each contribution candidate, whether the
Research_QA_Checklist.md gates have been passed. It is used as the
final gate before submission.

## Legend

- ✅ Passed
- ⚠️ Partial / needs work
- ❌ Not yet
- N/A Not applicable to this candidate

## Contribution Candidates

| Candidate | Content | Evidence | Technical | Regulatory | Cross-entry | Submission | Ready |
|---|---|---|---|---|---|---|---|
| QS01 umbrella (HNDL precision) | ✅ | ⚠️ | ✅ | ✅ | ✅ | ⚠️ | ❌ |
| QS03 umbrella (signature trust) | ✅ | ⚠️ | ✅ | ✅ | ✅ | ⚠️ | ❌ |
| QS04 umbrella (inventory) | ✅ | ⚠️ | ✅ | ✅ | ✅ | ⚠️ | ❌ |
| QS09 deep dive (integrity chain) | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| QSxx Supply Chain proposal | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| QSxx Misdirected Countermeasures | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| QSxx Unverifiable Execution | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| FSP Unified Profile | ✅ | ⚠️ | ✅ | ✅ | ✅ | ⚠️ | ❌ |

## Gap Notes

### QS01, QS03, QS04 umbrella Issues

- Content: complete
- Evidence: partial — Current OWASP Main gap analysis not yet performed
- Submission: blocked on gap analysis (avoid duplicate submission)

### QS09 deep dive

- Content: complete
- Evidence: strong (SLSA, RATS, DORA anchors verified)
- Submission: pending SLSA wording neutralization (Batch 5) and
  Current OWASP Main gap analysis

### QSxx proposals

- Content: complete
- Evidence: strong
- Submission: pending candidate adoption decision

### FSP Unified Profile

- Content: complete
- Evidence: retention periods qualified as illustrative (Batch 3o)
- Submission: sector-specific supplement, not core entry

## Pre-Submission Actions

For each candidate marked Ready ❌ or ⚠️:

1. Perform Current OWASP Main gap analysis against the candidate's
   target entry
2. Identify specific delta between candidate findings and current
   OWASP main
3. Confirm candidate is non-duplicative
4. Update evidence status to ✅
5. Then mark Ready ✅

## Current Blockers to Submission

| Blocker | Affects | Action |
|---|---|---|
| Current OWASP Main gap analysis not performed | All candidates | Fetch current main and perform line-by-line comparison |
| ChatGPT review not yet received | QS09 priority confirmation | Awaiting ChatGPT limit reset |
| Line-ending normalization in working tree | QS09 PR preparation | Normalize before final PR diff |

## Status

**Last updated:** 2026-10-04
**Next action:** Current OWASP Main gap analysis for QS09 (highest-priority candidate)