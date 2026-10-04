---
Title: QS04: Expand Cryptographic Inventory into Cryptographic Discovery and Dependency Mapping
Labels: quantum-security, QS04, conceptual, critical
Priority: Critical
Related OBS: QS04-OBS-002, 003, 023, 024, 033, 034, 047, 048
Status: draft
---

## Problem

QS04 correctly identifies the lack of cryptographic inventory as a migration
risk. However, the current framing focuses heavily on the existence of a
CBOM and does not clearly distinguish:

- cryptographic discovery;
- inventory representation;
- usage context;
- dependency mapping;
- risk prioritisation;
- continuous validation.

A machine-readable CBOM can represent cryptographic assets, but it does not
by itself prove that the organisation discovered all relevant cryptographic
dependencies or understands what relies on them.

## Proposed improvement

Model QS04 as:

    Discovery
       |
    Inventory
       |
    Usage Context
       |
    Dependency Mapping
       |
    Risk Prioritisation
       |
    Migration Tracking

The inventory should capture relationships between cryptographic assets and:

- applications;
- services;
- data;
- business processes;
- certificates and trust chains;
- hardware;
- suppliers and SaaS;
- libraries and implementations.

This is important because migration priority depends not only on the
algorithm but also on what depends on it and how difficult it is to replace.

## Additional required elements

- CBOM vs SBOM boundary explicit
- Dynamic / ephemeral crypto profile captured
- Inventory coverage and false-assurance risk modeled
- Migration completeness scenario included

## Expected outcome

QS04 becomes an actionable cryptographic visibility risk rather than a simple
"do you have a CBOM?" control.

## Acceptance

- Discovery / inventory / CBOM / dependency map distinguished
- Usage context captured (asset vs usage)
- Dependency graph modeled
- CBOM / SBOM boundary explicit
- Coverage / completeness measurable
- False assurance addressed
