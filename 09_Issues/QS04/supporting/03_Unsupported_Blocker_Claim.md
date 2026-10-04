---
Title: QS04: Replace Unsupported "Single Most Common Blocker" Claim
Labels: quantum-security, QS04, evidence, critical
Priority: Critical
Related OBS: QS04-OBS-025
Status: draft
---

## Problem

The current description states:

> "The absence of a structured cryptographic bill of materials (CBOM) is the
> single most common blocker to PQC migration in 2026."

This is a strong empirical claim that requires survey or research evidence to
establish that CBOM absence is the single most common blocker.

Current authoritative guidance from CISA, NSA, NIST, and NCSC strongly supports
cryptographic discovery and inventory as important prerequisites for PQC
migration, but does not establish this specific ranking across organisations.

## Proposed wording

> "The absence of a structured cryptographic inventory and dependency map can
> become a major blocker to PQC migration because organisations cannot
> reliably prioritise systems they cannot identify or map."

This preserves the substantive point while removing an unsupported universal
ranking.

## Evidence

- CISA, NSA and NIST encourage proactive cryptographic discovery and inventory
  as part of quantum-readiness planning.
- NCSC places full discovery and assessment at the centre of its early PQC
  migration timeline.

## Acceptance

- Claim softened or evidenced
- No unsupported universal ranking
- Substantive point preserved
