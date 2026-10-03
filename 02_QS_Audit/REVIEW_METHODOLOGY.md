# Review Methodology and Priority Label Disclaimer

This document defines the review methodology used across this research
workspace and clarifies the priority labels used in finding registers.

## Priority Label Disclaimer

Priority labels ("Critical", "Very High", "High", "Medium") are internal
reviewer triage labels used only within this research workspace.

They do not represent OWASP severity, ranking, official project position,
or an OWASP decision-making criterion.

They are used to sequence internal research and validation work and must not
be interpreted as an OWASP-assigned priority.

When transferring content to an OWASP Issue or Pull Request, use the
finding's substantive content and evidence. Do not carry the internal
priority label forward as an implied OWASP severity or ranking.

## Review Methodology

Each QS review follows a structured evidence-oriented process.

### Inputs

- Current OWASP draft entry
- Authoritative primary sources
- Peer-reviewed research where relevant
- Technical evidence where relevant
- Relevant standards and regulatory material
- Cross-entry materials from adjacent reviews

### Review dimensions

1. Conceptual accuracy
2. Technical precision
3. Scope clarity
4. Evidence strength
5. Regulatory precision
6. Cross-entry boundaries
7. Operational actionability

## Cross-Entry Boundary Status

Boundary findings start as provisional hypotheses until both sides of the
boundary have been independently reviewed.

"Established within current review" means that both entries have been reviewed
within this research workspace and a working boundary has been documented.

It does not mean that OWASP has formally confirmed, endorsed, or adopted the
boundary.

| Boundary | Status |
|---|---|
| QS01 <-> QS03 | Established within current review |
| QS01 <-> QS04 | Established within current review |
| QS03 <-> QS04 | Established within current review |
| QS01 <-> QS05 | Provisional |
| QS01 <-> QS06 | Provisional |
| QS01 <-> QS07 | Provisional |
| QS03 <-> QS05 | Provisional |
| QS03 <-> QS06 | Provisional |
| QS03 <-> QS07 | Provisional |
| QS04 <-> QS05 | Provisional |
| QS04 <-> QS06 | Provisional |
| QS04 <-> QS07 | Provisional |

These boundary statuses cover the currently reviewed active-entry scope only.
They do not constitute a formal OWASP taxonomy.

## Status Model

Analysis status is distinct from submission status.

### Analysis status

- Draft
- Reviewed
- Cross-entry verified
- Source verified
- Submission-ready

### Submission status

- Not submitted
- Submitted
- In review
- Merged
- Closed

Completed research work is not the same as a contribution approved for
submission.

## Evidence Discipline

A finding should distinguish among:

- Fact
- Interpretation
- Hypothesis
- Proposed change

A potential gap is not treated as a confirmed deficiency until sufficient
evidence has been gathered.

## Contribution Discipline

The intended workflow is:

Observation
-> Evidence
-> Analysis
-> Proposed change
-> Issue or Pull Request

The repository's internal review labels and conclusions are independent
research artifacts and do not represent official OWASP decisions.