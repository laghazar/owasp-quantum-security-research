---
Title: QS01: Normalize standards, guidance, policy and regulatory mapping
Labels: quantum-security, QS01, regulatory, high
Priority: High
Related OBS: QS01-OBS-025, 026, 027, 028, 029
Status: draft
---

## Problem

Current Standards & Regulatory Mapping mixes:

- Standards
- Drafts
- Government guidance
- Roadmaps
- Federal policy
- Directives
- Regulations
- Regulatory technical standards
- Algorithm suites

This gives the impression all have equivalent legal weight.

## Recommendation

Convert to a structured table with columns:

- Source
- Type
- Jurisdiction / Scope
- QS01 relevance

## Specific corrections

### OBS-025 — U.S. federal policy scope
NSM-10 / OMB M-23-02 apply to U.S. federal agencies. Do not generalize.

### OBS-026 — CRA does not mandate PQC
CRA Annex I requires state-of-the-art confidentiality/integrity mechanisms.
It does not explicitly mandate PQC.

### OBS-027 — Remove "many products extend past 2030"
No direct source. Replace with migration-planning rationale.

### OBS-028 — Add DORA RTS Art. 6 and Art. 7
Directly relevant to QS01 controls.

### OBS-029 — Adopt taxonomy table

## Acceptance

- All entries have Type, Scope, Relevance columns
- U.S. federal policy is scoped
- CRA wording is qualified
- Unsupported CRA statement removed
- DORA RTS Art. 6 and Art. 7 included
