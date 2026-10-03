# DORA RTS Article 6 — Encryption and Cryptographic Controls

**Source:** Commission Delegated Regulation (EU) 2024/1774
**Related:** DORA Regulation (EU) 2022/2554, Article 9

---

## Article 6 — Policy on encryption and cryptographic controls

Financial entities must develop and implement a policy on encryption and
cryptographic controls, based on data classification and ICT risk assessment.

The policy must cover at least:

- Data at rest
- Data in transit
- Data in use where necessary
- Internal and external network connections
- Cryptographic key management and lifecycle

Article 6(4) addresses updating or changing cryptographic technology in
response to developments in cryptanalysis.

---

## Article 7 — Cryptographic key lifecycle

The key lifecycle must cover:

- Generation
- Renewal
- Storage
- Backup
- Archiving
- Retrieval
- Transmission
- Retirement
- Revocation
- Destruction

---

## Relevance to QS01

- At-rest HNDL exposure maps to Article 6 data-at-rest
- In-transit HNDL exposure maps to Article 6 data-in-transit
- Key wrapping, KEK, DEK, KMS/HSM all fall under Article 6 key management
- Re-wrapping, re-encryption, key-hierarchy migration map to Article 6(4)
- Re-encryption, re-wrapping, key retirement map to Article 7

This is the strongest EU regulatory anchor for QS01 controls.

---

## Relevance to QS03

- Certificate and credential lifecycle
- PKI and signing service providers
- Third-party cryptographic risk
