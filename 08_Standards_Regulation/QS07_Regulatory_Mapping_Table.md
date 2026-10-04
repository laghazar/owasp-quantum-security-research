# QS07 - Regulatory Mapping Table

Reusable reference for the QS07 - Hardware Roots of Trust entry.
Classification follows the Landscape_Regulatory_Context.md taxonomy.

| Source | Type | Jurisdiction / Scope | Relevance to QS07 |
|---|---|---|---|
| UK NCSC PQC timelines | Government guidance | UK / broader reference | Hardware anchors (TPM, UEFI, X.509, 6G) requiring PQC standards by 2028 |
| NSA CNSA 2.0 | Algorithm suite / policy | U.S. NSS | Niche equipment and constrained devices CNSA 2.0 by 2033 |
| TCG TPM 2.0 v185 | Industry specification | International | PQC support for ML-KEM, ML-DSA, Attestation Keys |
| TCG PTP 1.07 | Industry specification | International | ML-DSA support in PC-client TPM profile |
| UEFI Secure Boot specification | Industry specification | International | Firmware trust anchor and certificate-path validation |
| UEFI PQC work (2026) | Industry work | International | Secure Boot and firmware-authentication PQC direction |
| 3GPP PQC for 6G | Standards development | International | Cellular hardware-anchor evolution |
| IETF LAMPS Working Group | Standards development | International | PQC X.509 profiles for hardware certificate chains |
| CRA Annex IV | Regulation | EU products with digital elements | Critical product categories (smart cards, smart meter gateways) |
| DORA Art. 9 | Regulation | EU financial entities | HSM and payment-terminal cryptographic controls |
| DORA RTS Art. 6 | Regulatory Technical Standard | EU financial entities | Encryption and cryptographic controls policy |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies |

## Non-Mandate Note

None of the above mandates a specific hardware migration deadline for
commercial organisations. CNSA 2.0 applies to U.S. National Security
Systems. CRA Annex IV identifies critical product categories but does
not establish a hardware-specific PQC deadline.

## Relationship to Other Entries

- QS03 (signatures) identifies TPM and UEFI trust exposures that QS07
  owns the hardware constraints for
- QS04 (inventory) is the input for hardware-asset discovery
- QS05 (agility) and QS06 (migration) are limited by hardware
  constraints that QS07 owns