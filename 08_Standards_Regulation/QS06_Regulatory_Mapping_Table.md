# QS06 - Regulatory Mapping Table

Reusable reference for the QS06 - Insecure Migration and Hybrid Misuse
entry. Classification follows the Landscape_Regulatory_Context.md
taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS06 |
|---|---|---|---|
| RFC 9954 | Standard | International | Standardised hybrid key exchange construction for TLS 1.3 |
| draft-ietf-tls-ecdhe-mlkem | Draft | International | ECDHE-MLKEM groups (X25519MLKEM768, SecP256r1MLKEM768, SecP384r1MLKEM1024) |
| RFC 8446 | Standard | International | TLS 1.3 base protocol; transcript authentication; version-downgrade protection |
| NIST FIPS 203 | Standard | International | ML-KEM primitive for hybrid use |
| NIST FIPS 204 | Standard | International | ML-DSA primitive for hybrid signatures |
| OpenSSL 3.5 release notes | Industry | International | Default TLS groups changed to prefer hybrid PQC KEM |
| Bernstein et al. - KyberSlash | Research literature | International | Timing side-channel in ML-KEM implementations |
| CVE-2024-37880 (Clangover) | Vulnerability record | International | Compiler-optimised constant-time leak |
| IETF PQUIP Working Group | Standards development | International | Hybrid construction; downgrade resistance |
| EU Coordinated PQC Roadmap | Policy roadmap | EU Member States | End-2030 standalone-classical prohibition for high-risk cases; hybrid as interim |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography and encryption policies |
| DORA Art. 9 | Regulation | EU financial entities | ICT risk management for hybrid TLS in production |
| CRA Annex I | Regulation | EU products with digital elements | State-of-the-art integrity and authenticity |

## Non-Mandate Note

None of the above mandates hybrid deployment as a specific migration
pattern. RFC 9954 standardises the construction where hybrid is chosen;
national and EU guidance present hybrid as an interim mitigation.

## Relationship to Other Entries

- QS05 (agility) provides the capability; QS06 provides the execution
- QS01 (HNDL) is the downstream confidentiality exposure if fallback
  downgrades a session
- QS03 (signatures) is adjacent for hybrid signature deployment