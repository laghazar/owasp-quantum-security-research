---
Title: QS01: Clarify CRQC risk horizon vs PQC migration milestones
Labels: quantum-security, QS01, methodology, critical
Priority: Critical
Related OBS: QS01-OBS-003
Status: draft
---

## Problem

QS01 currently presents 2030-2035 as "CRQC planning horizon most regulators use".

The cited NCSC and EU materials are PQC migration milestones, not CRQC arrival
forecasts:

- NCSC: 2028 discovery / 2031 highest-priority / 2035 completion
- EU Roadmap: 2026 start transition / 2030 high-risk use cases migrated

The current wording risks conflating two different concepts:

- CRQC arrival uncertainty — cannot be precisely predicted
- PQC migration deadlines — policy-driven, multi-year lead time

## Recommendation

Separate the two concepts explicitly. Reframe QS01's methodology around:

- Confidentiality lifetime
- Migration lead time
- Assessed quantum-risk horizon

Rather than implying a known CRQC date.

## Proposed wording

Replace:

> "CRQC planning horizon most regulators use (2030-2035)"

With:

> "Data sets whose confidentiality lifetime, combined with migration lead time,
> extends beyond the organisation's assessed quantum-risk horizon..."

## Acceptance

- No migration milestone is described as a CRQC arrival forecast
- QS01 methodology references confidentiality lifetime + migration lead time
  + assessed quantum-risk horizon
