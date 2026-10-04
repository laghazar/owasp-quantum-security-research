# Contributions and Findings

An independent review of the OWASP Quantum Security Top 10 (v0.1
draft), with evidence-backed observations and a submitted contribution.

## Overview

This repository documents an independent practitioner review of the
current OWASP Quantum Security Top 10 (v0.1 draft). The review covers
all 9 active entries and 4 candidate entries.

The review is not affiliated with OWASP. It uses the current OWASP
draft entries, authoritative primary sources (NIST, NCSC, EU, IETF,
TCG, UEFI), and peer-reviewed research as its evidence base.

## Submitted Contribution

### QS09 - Toolchain and Compiler Compromise

**A formal integrity chain model for quantum job execution.**

Submitted to OWASP:
https://github.com/OWASP/quantum-security-project/issues/54

The proposal formalizes the submitted-to-dispatch-to-result integrity
chain as an explicit concern of QS09, with:

- A four-artifact model (submitted, transformed, dispatched, result)
- A provider evidence classification (5 categories)
- SLSA and RFC 9334 RATS framework anchors
- A DORA Article 30-aligned evidence package for regulated use

The proposal does not introduce a new concept. It formalizes and
operationalizes concepts the current QS09 entry mentions at a high
level.

## Scope

### Active entries reviewed

| Entry | Title | Surface |
|---|---|---|
| QS01 | Harvest-Now-Decrypt-Later Exposure | Migration |
| QS03 | Vulnerable Signatures and Code-Signing | Migration |
| QS04 | Cryptographic Discovery and Inventory Gaps | Migration |
| QS05 | Crypto-Agility Failures | Migration |
| QS06 | Insecure Migration and Hybrid Misuse | Migration |
| QS07 | Hardware Roots of Trust | Migration |
| QS08 | QPU Tenant Isolation Failures | Platform |
| QS09 | Toolchain and Compiler Compromise | Platform |
| QS10 | Side-Channel and Control-Plane Exposure | Platform |

### Candidate entries reviewed

- Compliance Obligations
- Insecure Quantum Software Supply Chain
- Misdirected Quantum Countermeasures
- Unverifiable Quantum Execution and Result Assurance

## What was produced

### Deep-dive reviews

- QS01 (HNDL exposure): 27 findings
- QS03 (Signature trust): 40 findings
- QS04 (Cryptographic inventory): 52 findings
- QS09 (Toolchain integrity chain): 7 findings + 5-artifact deep dive

### Rapid audits

- QS05 (Crypto-Agility): 5 findings
- QS06 (Insecure Migration): 6 findings
- QS07 (Hardware Roots): 7 findings
- QS08 (QPU Isolation): 7 findings
- QS10 (Side-Channel): 6 findings

### Methodology and governance

- Review methodology with priority label disclaimer
- Research QA Checklist (36 items, pre-submission gate)
- Cross-entry boundary register (23 boundaries)
- Landscape-wide regulatory context (source taxonomy and
  non-mandate rule)
- Per-entry regulatory mapping tables for all entries
- Evidence Matrix

### Sector profile

- Financial Services Unified Profile: sector-specific view aligned
  with DORA, NIS2, and CRA regulatory anchors

## Key findings by entry

### QS09 - Toolchain and Compiler Compromise

The formal four-artifact integrity chain model:
submitted -> transformed -> dispatched -> result, with explicit
bindings, failure modes, and provider evidence categories.

See: [Issue #54](https://github.com/OWASP/quantum-security-project/issues/54)

### QS04 - Cryptographic Discovery and Inventory Gaps

A three-layer model separating cryptographic asset, usage, and
dependency, with coverage metrics and false-assurance risk.

Additional precision on:
- Discovery vs inventory vs CBOM vs SBOM distinction
- CycloneDX v1.7 (current) and SPDX reference discipline
- Dependency mapping as core (not context)

### QS03 - Vulnerable Signatures and Code-Signing

Reference modernization to current IETF RFCs (9881, 9882, 9909,
9964), TCG TPM 2.0 v185, UEFI PQC work, and CA/Browser Forum Ballot
SC-081.

Conceptual contributions proposed:
- Signature assurance lifetime (parallel to QS01's confidentiality
  lifetime)
- Trust-chain migration model
- Re-establishment failure (3 sub-modes)

### QS01 - Harvest-Now-Decrypt-Later Exposure

Precision corrections:
- CRQC timeline vs migration milestones
- Confidentiality lifetime definition (distinct from retention)
- In-transit vs at-rest distinction
- At-rest key hierarchy and KMS/HSM dependencies
- Regulatory mapping taxonomy

## Cross-entry analysis

A 23-boundary register documents the working boundary between each
pair of entries, with a three-level status model:

- Provisional
- Established within current review
- Revalidated after full landscape review

A platform-surface three-layer model is documented:

- QS09 toolchain layer
- QS08 execution layer
- QS10 infrastructure layer

## Regulatory alignment

Standards, guidance, policy, roadmaps, directives, and regulations are
classified per a landscape-wide taxonomy. No cited source is presented
as mandating a specific algorithm unless its implementing requirement
establishes that obligation.

Primary EU regulatory anchors used:

- DORA Article 9 (ICT risk management)
- DORA RTS Article 6 (encryption and cryptographic controls)
- DORA RTS Article 7 (cryptographic key lifecycle)
- DORA Article 30 (third-party contractual arrangements)
- NIS2 Article 21(2)(h) (cryptography and encryption policies)
- CRA Annex I (state-of-the-art integrity and authenticity)

## Non-OWASP status

This is an independent research workspace. It is not an official
OWASP repository and does not represent OWASP, its project leads, or
the official project position.

## Repository structure

- `02_QS_Audit/` - entry reviews (deep dives and rapid audits)
- `03_QS04/` - QS04 deep dive
- `06_Financial_Services_Profile/` - sector profile
- `08_Standards_Regulation/` - regulatory mapping and context
- `09_Issues/` - contribution Issues and proposals
- `10_PRs/` - Pull Request preparation
- `12_Contribution_Log/` - contribution log, status, QA checklist,
  evidence matrix

## OWASP Quantum Security Project

The OWASP Quantum Security Project is developing the OWASP Top 10 for
Quantum Security Risks through a community sprint. Contributions from
the practitioner community are welcome.

- Project repository: https://github.com/OWASP/quantum-security-project
- Contact: contribute@quantum-owasp.org

## License and use

Independent research. No warranty. Use for reference and discussion.