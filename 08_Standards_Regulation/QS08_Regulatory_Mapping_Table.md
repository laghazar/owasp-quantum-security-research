# QS08 - Regulatory Mapping Table

Reusable reference for the QS08 - QPU Tenant Isolation Failures entry.
Classification follows the Landscape_Regulatory_Context.md taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS08 |
|---|---|---|---|
| Choudhury et al. (NDSS 2025) | Research literature | International | Crosstalk-induced side-channel and fidelity attack on shared QPUs |
| Ash-Saki et al. (ISLPED 2020) | Research literature | International | Crosstalk-based fault injection in multi-programming regime |
| Xu et al. (CCS 2023) | Research literature | International | Reset-operation state leakage across tenant boundary |
| DORA Art. 28 | Regulation | EU financial entities | Third-party ICT risk expectations; platform claims should be evidenced |
| DORA Art. 30 | Regulation | EU financial entities | Contractual arrangements with quantum platform providers |

## Non-Mandate Note

No formal standard currently covers QPU tenant isolation. The cited
research papers are peer-reviewed technical literature. DORA Articles
28 and 30 establish third-party risk and contractual expectations for
regulated entities consuming quantum platform services; they do not
prescribe per-job isolation verification.

## Relationship to Other Entries

- QS09 (toolchain) is the adjacent platform layer above QS08
- QS10 (infrastructure) is the adjacent platform layer below QS08
- Unified platform-surface provider evidence model spans QS08, QS09,
  QS10