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

Two orthogonal status dimensions apply across the repository:

1. **Analysis status** — what state the research artifact is in
2. **Submission status** — whether it has been submitted to OWASP

Completed analysis work is not equivalent to a submission-ready
artifact. Both dimensions are tracked separately.

### Analysis status (6 levels)

| Status | Meaning |
|---|---|
| Review Complete | Review pass completed; findings register finalized |
| Evidence Validated | Source-level validation completed; citations verified |
| Contribution Candidate | Identified as potential OWASP contribution with coherent thesis |
| Submission Ready | All QA Checklist gates passed; ready for OWASP review |
| Submitted | Submitted to OWASP as Issue or PR |
| Revalidated | Re-checked against full landscape or after external feedback |

### Submission status

| Status | Meaning |
|---|---|
| Not submitted | Internal research only |
| Submitted | Formally submitted to OWASP |
| In review | Under OWASP review |
| Merged | Accepted and merged |
| Closed | Closed without merge |

### Application

The status for each artifact is recorded at the top of the
corresponding file (Master Review, Contribution Log entry, or similar).
Current landscape status:

| Entry | Analysis Status | Submission Status |
|---|---|---|
| QS01 | Review Complete (Evidence validation pending) | Not submitted |
| QS03 | Review Complete (Evidence validation pending) | Not submitted |
| QS04 | Review Complete (Evidence validation pending) | Not submitted |
| QS05 | Review Complete (Evidence validation pending) | Not submitted |
| QS06 | Review Complete (Evidence validation pending) | Not submitted |
| QS07 | Review Complete (Evidence validation pending) | Not submitted |
| QS08 | Review Complete (Evidence validation pending) | Not submitted |
| QS09 | Review Complete (Evidence validation pending) | Not submitted |
| QS10 | Review Complete (Evidence validation pending) | Not submitted |
| QSxx Candidates | Candidate review complete | Not applicable |
| FSP unified profile | Outline complete | Not submitted |

**Rule.** Do not mark an entry "Complete" without specifying which
dimension (Review, Evidence, Contribution, Submission). The plain
"Complete" label is ambiguous and is deprecated.


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

---

## Platform Surface Model

The platform surface is represented as a three-layer stack based on
the QS08, QS09, and QS10 reviews.

    Quantum application layer
       |
       v
    QS09 - Toolchain layer
       (compiler, transpiler, scheduler, dispatch, result record)
       |
       v
    QS08 - Execution layer
       (QPU multi-tenancy, tenant isolation, qubit reset)
       |
       v
    QS10 - Infrastructure layer
       (controller electronics, physical access, telemetry)

Each layer addresses a distinct threat property:

| Layer | Entry | Threat property |
|---|---|---|
| Toolchain | QS09 | Integrity of transformation and result record |
| Execution | QS08 | Confidentiality across tenant boundaries |
| Infrastructure | QS10 | Confidentiality against physical side channels |

Cross-layer observations:

- The submitted-to-dispatch-to-result integrity chain (QS09) spans
  the toolchain layer and records its outputs for the result record
- QS08 and QS10 both concern information leakage but from different
  layers (logical execution vs physical infrastructure)
- A unified platform-surface provider evidence model is a cross-entry
  contribution candidate (QS08 + QS09 + QS10)

---

## Deep-Dive Status

The following table records the deep-dive decision for each reviewed
entry.

| Entry | Audit type | Findings | Deep-dive decision | Rationale |
|---|---|---|---|---|
| QS01 | Deep | 27 | Deep dive committed | Foundational entry |
| QS03 | Deep | 40 | Deep dive committed | Signature trust chain |
| QS04 | Deep | 52 | Deep dive committed | Inventory foundation |
| QS05 | Rapid | 5 | OPTIONAL (deferred) | Strong entry; cMTTR questioned |
| QS06 | Rapid | 6 | NO DEEP DIVE | Well-constructed three-layer model |
| QS07 | Rapid | 7 | OPTIONAL (financial-services) | Hardware re-anchoring methodology |
| QS08 | Rapid | 7 | OPTIONAL (isolation evidence) | Isolation evidence framework |
| QS09 | Rapid | 7 | **RECOMMENDED** | Submitted-to-dispatch-to-result integrity chain |
| QS10 | Rapid | 6 | NO deep dive | Cross-entry platform model preferred |
| QS02 | Note | — | Not applicable | Restructuring history |

Total findings: 157 (active entries) + 4 candidate reviews.

Cross-entry contribution candidates (spanning multiple entries):

1. QS09 integrity chain (submitted-to-dispatch-to-result)
2. Platform-surface provider evidence model (QS08 + QS09 + QS10)
3. Operational verification methodology (QS04 + QS05 + QS06)
4. Hardware re-anchoring methodology (QS03 + QS04 + QS07)
5. Migration lifecycle model (QS04 + QS05 + QS06 + QS07)
6. cMTTR operationalization (QS05 + NIST CSWP 39upd1 alignment)
7. Landscape-wide regulatory framework standardization

---

## Candidate Recommendations

The following candidates were reviewed against the active landscape.

| Candidate | Recommendation | Rationale |
|---|---|---|
| Compliance Obligations | DO NOT ADOPT (standalone) | Framing not quantum-specific; overlaps every entry's Standards and Regulatory Mapping; consider merge into landscape-wide regulatory framework |
| Insecure Quantum Software Supply Chain | STRONG ADOPT | Self-delineated from QS09; strong research anchors; complements QS09 |
| Misdirected Quantum Countermeasures | STRONG ADOPT | Novel conceptual position (believes it has migrated); strong NCSC/NSA anchors |
| Unverifiable Quantum Execution and Result Assurance | STRONG ADOPT | Novel problem; strong peer-reviewed anchor; explicit scope delineation from QS08/QS09/QS10 |

Candidate reviews are documented in:

    02_QS_Audit/QSxx_Candidates/

Candidate review status does not imply OWASP adoption.

---

## Data Flow Across the Landscape

    Classical data at rest
       |
       v
    QS01 - HNDL confidentiality exposure
       |
       v
    QS03 - Signature / trust exposure
       |
       v
    QS04 - Cryptographic discovery and inventory
       |
       v
    QS05 - Crypto-agility
       |
       v
    QS06 - Secure migration / hybrid deployment
       |
       v
    QS07 - Hardware-root constraints
       |
       v
    QS08 - QPU tenant isolation (platform)
       |
       v
    QS09 - Toolchain integrity (platform)
       |
       v
    QS10 - Control-plane side channels (platform)

Cross-cutting considerations:

- QS04 inventory is the input for QS05, QS06, and QS07 planning
- QS01 and QS03 use QS04 output as their data foundation
- QS08, QS09, QS10 form the platform surface, distinct from the
  migration surface but share a provider-evidence requirement pattern
- Standards and Regulatory Mapping exists in every active entry and
  is flagged for landscape-wide TODO resolution (8 instances)