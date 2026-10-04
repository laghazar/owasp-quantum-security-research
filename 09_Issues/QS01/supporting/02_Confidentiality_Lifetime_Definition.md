---
Title: QS01: Define confidentiality lifetime separately from data retention
Labels: quantum-security, QS01, methodology, very-high
Priority: Very High
Related OBS: QS01-OBS-002, QS01-OBS-012, QS01-OBS-022
Status: draft
---

## Problem

QS01 uses "required confidentiality lifetime" without defining it.

Readers can interpret this as retention period. They are not the same:

- Retention = 30 years / Confidentiality lifetime = 7 years -> possible
- Retention = 5 years / Confidentiality lifetime = 20 years -> possible

## Recommendation

Add an explicit definition, and use it consistently across Description,
Common Examples, and Attack Scenarios.

## Proposed definition

> "Confidentiality lifetime is the period during which unauthorized disclosure
> of the data would remain materially harmful or unacceptable, and should be
> assessed separately from the retention period."

## Operationalization

> "Classify and prioritize data based on confidentiality lifetime and
> adversarial value, not sensitivity alone. Assess confidentiality lifetime
> separately from retention period and use the result to determine migration
> priority."

## Acceptance

- Confidentiality lifetime defined in Description
- Retention and confidentiality lifetime distinguished in all sections
- Scenario 2 uses the distinction explicitly
