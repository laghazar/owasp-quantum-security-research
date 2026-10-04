# QS05 - Regulatory Mapping Table

Reusable reference for the QS05 - Crypto-Agility Failures entry.
Classification follows the Landscape_Regulatory_Context.md taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS05 |
|---|---|---|---|
| NIST CSWP 39upd1 | Standard / final | International | Primary crypto-agility anchor; 4-tier maturity model; operational mechanisms |
| NIST IR 8547 | Draft | International | Migration-timeline framing |
| NSA CNSA 2.0 | Algorithm suite / policy | U.S. NSS | Dated algorithm-transition deadlines |
| NIST SP 1800-38 | Government guidance | International | Practice detail for cryptographic migration |
| UK NCSC PQC timelines | Government guidance | UK / broader reference | Migration milestones |
| EU Coordinated PQC Roadmap | Policy roadmap | EU Member States | Migration milestones |
| CISA / NSA / NIST fact sheet | Government guidance | U.S. / broader reference | Cryptographic agility recommendation |
| IETF PQUIP Working Group | Standards development | International | Agility documents and migration patterns |
| RFC 9954 | Standard | International | Hybrid key exchange in TLS 1.3 |
| draft-ietf-tls-ecdhe-mlkem | Draft | International | ECDHE-MLKEM groups for TLS 1.3 |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies; state-of-the-art and risk-based |
| DORA Art. 9 | Regulation | EU financial entities | ICT risk management |
| DORA RTS Art. 6 | Regulatory Technical Standard | EU financial entities | Encryption and cryptographic controls policy |
| CRA Annex I | Regulation | EU products with digital elements | State-of-the-art integrity and authenticity |

## Non-Mandate Note

None of the above mandates a specific cryptographic algorithm. NIS2,
DORA, and CRA establish policy, control, and confidentiality
requirements; their applicability to PQC agility should be assessed in
light of implementing requirements and applicable standards.

## Relationship to Other Entries

- QS04 (inventory) is the enabler for QS05 measurement (cMTTR bounded
  by CBOM visibility)
- QS06 (migration execution) is the downstream concern after QS05
  capability exists