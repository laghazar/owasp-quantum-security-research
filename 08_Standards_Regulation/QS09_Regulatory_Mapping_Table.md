# QS09 - Regulatory Mapping Table

Reusable reference for the QS09 - Toolchain and Compiler Compromise
entry. Classification follows the Landscape_Regulatory_Context.md
taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS09 |
|---|---|---|---|
| Suresh et al. (HASP 2021) | Research literature | International | Untrusted-compiler circuit-IP-theft threat |
| Chu et al. - QTrojan (IEEE ICASSP 2023) | Research literature | International | Circuit backdoor via quantum-compiler configuration files |
| Xu and Szefer (IEEE S&P 2025) | Research literature | International | Pulse-level gate/pulse interface attacks; qubit plunder, timing, frequency, phase, waveform mismatch |
| Weder et al. - QProv | Research literature | International | Quantum-specific provenance collection across circuits, computers, compilation, execution |
| Hrda et al. - CHEQ | Research literature | International | Circuit-integrity checking at the controller |
| SLSA provenance model | Industry specification | International | Generic software supply-chain integrity and provenance model |
| IETF RFC 9334 (RATS) | Standard | International | Remote attestation architecture (Attester, Verifier, Relying Party) |
| DORA Art. 28 | Regulation | EU financial entities | ICT third-party risk when consuming quantum platform services |
| DORA Art. 30 | Regulation | EU financial entities | Contractual arrangements for integrity-chain evidence |
| DORA Articles 31-44 | Regulation | EU financial entities | Oversight framework for critical ICT third-party providers |
| CRA Annex I | Regulation | EU products with digital elements | State-of-the-art integrity and authenticity; applicability to quantum software depends on product scope |

## Non-Mandate Note

No formal standard currently covers end-to-end quantum toolchain
integrity. SLSA and RFC 9334 provide generic provenance and attestation
models that can inform quantum-platform controls but are not
quantum-specific. DORA Articles 28-44 establish third-party ICT risk
obligations; they do not prescribe per-job toolchain attestation.

## Relationship to Other Entries

- QS08 (execution) and QS10 (infrastructure) are the adjacent platform
  layers
- QS04 (inventory) is adjacent for provenance inventory
- QS09 integrity chain (submitted -> transformed -> dispatch -> result)
  is the highest-priority single-entry contribution candidate