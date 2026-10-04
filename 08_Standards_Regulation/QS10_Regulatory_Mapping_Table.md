# QS10 - Regulatory Mapping Table

Reusable reference for the QS10 - Side-Channel and Control-Plane
Exposure entry. Classification follows the
Landscape_Regulatory_Context.md taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS10 |
|---|---|---|---|
| Xu et al. (CCS 2023) | Research literature | International | Timing, energy, and power-trace attacks against quantum-computer controllers |
| NIST FIPS 140-3 | Standard | International | Partial physical-security coverage for cryptographic modules |
| Common Criteria (ISO/IEC 15408) | Standard | International | General security-evaluation framework; no quantum-controller-specific protection profiles established |
| DORA Art. 28 | Regulation | EU financial entities | Third-party ICT risk for quantum platforms consumed by financial entities |
| DORA Art. 30 | Regulation | EU financial entities | Contractual arrangements for side-channel disclosure |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies; contextual |

## Non-Mandate Note

No formal standard currently covers quantum-platform controller side
channels. FIPS 140-3 and Common Criteria provide partial conceptual
coverage but do not establish quantum-controller-specific compliance or
resistance. DORA Article 28 establishes third-party risk management
obligations; it does not prescribe controller side-channel disclosure.

## Relationship to Other Entries

- QS08 (execution) and QS09 (toolchain) are the adjacent platform
  layers
- Unified platform-surface provider evidence model spans QS08, QS09,
  QS10
- DORA Article 28 and Article 30 serve as the shared regulatory anchor
  for platform surface provider evidence