# HNDL Exposure — Financial Services Profile

Sector-specific extension of QS01. Maintained separately so that the main QS01
entry remains vendor-neutral and sector-neutral.

---

## 1. Purpose

Financial institutions combine:
- Long confidentiality lifetimes
- High adversarial value
- Complex cryptographic key hierarchies
- Heavy third-party dependencies (payment networks, SWIFT, cloud, SaaS)
- Direct regulatory obligations (DORA, NIS2)
- Large legacy estates with slow migration cycles

This makes them one of the highest-priority HNDL exposure sectors.

---

## 2. Data classes

| Data class | Typical retention | Typical confidentiality lifetime | HNDL priority |
|---|---|---|---|
| KYC records | 5-10 years post relationship | High (long) | High |
| AML investigations | 5-10 years | High (long) | High |
| Transaction history | 5-10 years | Medium-High | High |
| Payment records | 5-10 years | Medium | Medium-High |
| SWIFT-related information | 5+ years | High | High |
| Loan / mortgage records | 10-30 years | High | Critical |
| Customer PII | Varies | High | High |
| Credit information | 5-7 years | High | High |
| Financial statements | 10+ years | Medium-High | High |
| Backups | Varies | Varies | High |
| Archived contracts | 10-30 years | High | Critical |
| Source code / IP | Indefinite | High | Critical |
| Security architecture docs | Indefinite | High | Critical |
| Cryptographic keys | Lifecycle-dependent | Critical | Critical |
| Long-lived audit records | 5-10 years | Medium-High | High |

---

## 3. Risk model

    Asset
      |
      v
    Data class
      |
      v
    Confidentiality lifetime
      |
      v
    Current cryptography
      |
      v
    Quantum vulnerability
      |
      v
    Migration lead time
      |
      v
    HNDL exposure
      |
      v
    Business impact
      |
      v
    Regulatory relevance
      |
      v
    Treatment

---

## 4. Regulatory overlay

### DORA Article 9
Financial entities must maintain high standards of confidentiality, integrity,
and availability of data at rest, in use, and in transit.

### DORA RTS Article 6 (Commission Delegated Regulation (EU) 2024/1774)
Financial entities must maintain a policy on encryption and cryptographic
controls, based on data classification and ICT risk assessment, covering at
least:
- data at rest
- data in transit
- data in use where necessary
- internal and external network connections
- cryptographic key management and lifecycle

Article 6(4) addresses updating or changing cryptographic technology in
response to developments in cryptanalysis.

### DORA RTS Article 7
Extends cryptographic key lifecycle to generation, renewal, storage, backup,
archiving, retrieval, transmission, retirement, revocation, and destruction.

### NIS2 Article 21(2)(h)
Policies and procedures regarding the use of cryptography and, where
appropriate, encryption, as part of cybersecurity risk-management measures.

### PQC migration guidance
- UK NCSC PQC timelines
- EU Coordinated PQC Roadmap
- U.S. federal PQC policy (contextual)

---

## 5. Financial-services specific attack paths

### Path A — In-transit
- Payment network interbank traffic
- Customer-facing TLS
- Inter-branch and inter-DC traffic
- API traffic to third parties

### Path B — At-rest
- Transaction archives
- Loan / mortgage files
- KYC / AML dossiers
- Backup environments
- Cryptographic key stores (KMS / HSM)

### Path C — Third-party
- Cloud provider key management
- SaaS providers holding customer data
- Payment processors
- Clearing and settlement systems
- SWIFT service bureaus

---

## 6. Prioritization model

For each asset:

1. Classify data class
2. Determine confidentiality lifetime (independent of retention period)
3. Identify cryptographic dependencies (algorithms, protocols, key hierarchy)
4. Assess quantum vulnerability
5. Estimate migration lead time
6. Assess adversarial value
7. Identify regulatory obligations (DORA Art. 9, RTS Art. 6/7, NIS2)
8. Determine treatment path
9. Track migration status

---

## 7. Cross-references

- QS01 — HNDL exposure framework (parent entry)
- QS04 — Cryptographic discovery and inventory
- QS05 — Crypto agility
- QS06 — Secure PQC/hybrid migration
- QS07 — Hardware roots of trust
