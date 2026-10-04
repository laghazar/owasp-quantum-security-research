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

Boundary findings between QS entries are tracked with three internal
status levels. These are internal research labels only and do not
represent any OWASP confirmation, endorsement, or adoption.

### Boundary status levels

**1. Provisional**

One or both sides of the boundary have not been independently reviewed
within this research workspace. The boundary is a working hypothesis.

**2. Established within current review**

Both entries have been reviewed within this research workspace and a
working boundary has been documented.

**3. Revalidated after full landscape review**

Both entries have been reviewed and the boundary has been re-checked
against the full active and candidate landscape (all QS entries and
QSxx candidate drafts).

None of these statuses means that OWASP has formally confirmed,
endorsed, or adopted the boundary.

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

## Active Landscape Scope

The current OWASP Quantum Security project landscape is tracked with
the following internal scope model.

### Active entries

    Migration surface:
      QS01  Harvest-Now-Decrypt-Later Exposure
      QS03  Vulnerable Signatures and Code-Signing
      QS04  Cryptographic Discovery and Inventory Gaps
      QS05  Crypto-Agility Failures
      QS06  Insecure Migration and Hybrid Misuse
      QS07  Hardware Roots of Trust

    Platform surface:
      QS08  QPU Tenant Isolation Failures
      QS09  Toolchain and Compiler Compromise
      QS10  Side-Channel and Control-Plane Exposure

### Restructuring history

QS02 is treated as restructuring history rather than a standalone current
active entry. The current OWASP README documents a Sprint 1 candidate
restructuring in which QS01 and QS02 were merged; QS02 signature and
credential-lifetime content moved into QS03. The replacement slot was not
presented as finally decided.

### Candidate entries

Unnumbered QSxx drafts are treated as candidate-scope material and are
not counted as active OWASP Top 10 entries. Candidate review is
documented separately and does not by itself imply adoption.

See "Candidate Entry Handling" below.


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


## Candidate Entry Handling

Unnumbered QSxx drafts in the OWASP repository are treated as candidate
entries. They are reviewed for scope, distinctiveness, and potential
overlap with active entries.

### Candidate review approach

Candidate entries are reviewed with a lightweight structured pass:

- Problem definition
- Intended scope
- Primary actor
- Main security consequence
- Distinctive quantum-specific element
- Potential overlap with active entries
- Potentially covered by which active entry
- Evidence anchor
- Open question

This is intentionally lighter than the full deep-dive applied to
active entries. The purpose is scope and overlap assessment, not a
comprehensive finding register.

### Candidate review outputs

Each candidate review is stored under:

    02_QS_Audit/QSxx_Candidates/

### Candidate review status

A candidate entry review does not imply:

- That the candidate should be adopted
- That the candidate should be rejected
- Any OWASP position on the candidate

It only documents internal research observations about scope,
distinctiveness, and overlap.

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