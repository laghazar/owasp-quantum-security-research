# OWASP Quantum Security Research

Research and analysis workspace focused on contributing to the OWASP Quantum
Security Project through structured security research, evidence-based
analysis, and practical risk-management perspectives.

## Submission Status

As of this repository revision, all Issues and Pull Requests in this
repository are internal research drafts. No contribution has been submitted
to the OWASP Quantum Security Project.

Research outputs intended for potential submission remain subject to source
validation, cross-entry boundary review, and final evidence review.

## Purpose

This repository documents an independent research and contribution workflow
around quantum security, with an initial focus on:

- Post-quantum cryptography (PQC)
- Cryptographic inventory and CBOM
- Cryptographic agility
- PQC migration and hybrid cryptography
- Quantum security risk management
- Financial-services security and governance
- Standards and regulatory mapping
- SIKE and post-quantum cryptography research
- OWASP Quantum Security Project contributions

The objective is to transform research findings into clear, evidence-based
observations and, where appropriate, actionable Issues and Pull Requests.

## Relationship to the OWASP Quantum Security Project

This repository is an independent personal research workspace supporting
analysis and potential contributions to the official OWASP Quantum Security
Project.

It is not an official OWASP repository and does not represent OWASP, its
project leads, or the official project position.

This repository does not modify, represent, or supersede the official OWASP
Quantum Security Project.

Where official OWASP material is reproduced or adapted, applicable licensing,
attribution, and ShareAlike requirements will be respected.

## Research Approach

The research process follows a structured progression:

1. Understand the current OWASP project scope and terminology.
2. Review the current Quantum Security entries and their boundaries.
3. Identify observations and questions without prematurely assuming that a
   gap exists.
4. Gather authoritative and peer-reviewed evidence.
5. Evaluate the observation against the evidence.
6. Assess practical enterprise and financial-services implications.
7. Develop a concrete contribution where the evidence supports one.
8. Use GitHub Issues for discussion and GitHub Pull Requests for
   sufficiently concrete changes.

### Evidence hierarchy

Research will prioritize:

1. Primary authoritative sources
   - NIST
   - CISA
   - NSA
   - UK NCSC
   - EU institutions
   - IETF and relevant RFCs
   - Applicable regulatory or standards bodies
2. Peer-reviewed academic research
3. Technical evidence
   - CVEs
   - Demonstrated proofs of concept
   - Reproducible technical findings
4. Industry and professional bodies

Vendor material may be used as contextual evidence where appropriate, but
will not normally be treated as the primary authority for a security claim.

## Current Research Areas

### Quantum Security Risk

Analysis of practical security risks arising from the transition to
post-quantum cryptography and the development of quantum computing
platforms.

### Financial Services

Assessment of quantum security through a regulated-industry lens, including:

- Cryptographic asset criticality
- Cryptographic inventory and CBOM
- Crypto-agility governance
- Migration readiness
- Third-party and supply-chain risk
- Security ownership and accountability
- Risk indicators and control evidence
- Standards and regulatory mapping

### SIKE / PQC Research

Research into SIKE and broader post-quantum cryptography lessons, with
emphasis on how cryptographic failures can translate into enterprise
security-risk implications and whether existing quantum-security guidance
sufficiently captures those lessons.

## Repository Structure

| Directory                       | Purpose                                                                            |
| ------------------------------- | ---------------------------------------------------------------------------------- |
| `01_Project_Orientation`        | OWASP project orientation, charter, timeline, contribution model and project notes |
| `02_QS_Audit`                   | Current Quantum Security entry landscape and comparative audit, with entry-specific review dossiers |
| `03_QS04`                       | Cryptographic inventory and CBOM research (dedicated deep-dive)                    |
| `04_QS05`                       | Crypto-agility research                                                            |
| `05_QS06`                       | PQC migration and hybrid-use research                                              |
| `06_Financial_Services_Profile` | Financial-services quantum security profile                                        |
| `07_SIKE_PQC`                   | SIKE and PQC research                                                              |
| `08_Standards_Regulation`       | Standards, guidance and regulatory evidence                                        |
| `09_Issues`                     | Issue drafts and, when applicable, submitted Issues                                |
| `10_PRs`                        | Pull Request preparation and contribution evidence                                 |
| `11_Publications`               | Publication-oriented research outputs                                              |
| `12_Contribution_Log`           | Chronological contribution and research activity log                               |

## Observation Model

Research observations are recorded before they become formal contribution
proposals.

Each observation follows the structure:

- Observation ID
- Quantum Security entry
- Section
- Observation
- Why the observation was identified
- Evidence required
- Financial-services relevance
- Status

Initial observations are deliberately marked as requiring research rather
than being treated as confirmed deficiencies.

## Contribution Model

The intended contribution path is:

**Observation -> Evidence -> Analysis -> Proposed change -> Issue or Pull
Request**

The objective is not to maximize the number of GitHub activities, but to
develop a small number of well-supported and useful contributions.

Potential contribution types include:

- Clarification of an existing risk
- Improved scope or boundary definition
- Additional standards mapping
- Stronger evidence or references
- Practical enterprise control guidance
- Financial-services interpretation
- Risk-management methodology
- New research-informed content

## Professional Principles

This repository follows several principles:

- Evidence over speculation
- Vendor neutrality
- Clear distinction between fact, observation and proposal
- Explicit treatment of uncertainty
- Reproducible research where practical
- Respect for intellectual property and source licensing
- No disclosure of confidential, proprietary or non-public organisational
  information
- Practitioner perspectives will be presented generically and will not
  disclose internal bank information

## Priority Label Disclaimer

Priority labels ("Critical", "Very High", "High", "Medium") used in this
repository are the reviewer's internal triage classification.

They are internal review labels only. They do not represent OWASP severity,
ranking, official project position, or any formal OWASP prioritisation.

These labels are used only to sequence internal research and review effort.
They must not be carried into an OWASP Issue or Pull Request as an implied
OWASP severity or ranking.

See `02_QS_Audit/REVIEW_METHODOLOGY.md` for the detailed methodology.

## Status

This repository is an evolving research workspace.

Research conclusions, contribution candidates and proposed changes may
change as additional evidence is identified and as the OWASP Quantum
Security Project evolves.

The official OWASP project remains the authoritative source for its own
scope, entries, contribution decisions and published guidance.