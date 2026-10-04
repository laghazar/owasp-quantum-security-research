# Signature Trust Exposure — Financial Services Profile

Sector-specific extension of QS03. Maintained separately so that the main
QS03 entry remains vendor-neutral and sector-neutral.

---

## 1. Purpose

Financial institutions combine:
- Long-lived signed artifacts (contracts, regulatory evidence, KYC/AML dossiers)
- High-value signing keys (payment authorization, transaction signing)
- Large verifier populations (ATM/POS fleets, embedded firmware, mobile apps)
- Direct regulatory obligations (DORA, NIS2)
- Complex PKI hierarchies and third-party signing dependencies
- Heavy reliance on hardware-backed signing (HSMs, TPMs, smart cards)

This makes them one of the highest-priority signature-trust exposure sectors.

---

## 2. Signed asset classes

| Asset class | Typical signature assurance lifetime | HNDL priority |
|---|---|---|
| Payment authorization | Transaction lifetime + audit window | Critical |
| Transaction signing | 5-10 years (audit / dispute) | Critical |
| Customer authentication | Session + audit window | High |
| Bank certificates (internal PKI) | Certificate lifetime (now ~200-47 days) | High |
| API certificates | Certificate lifetime | High |
| JWT tokens | Token lifetime + audit | High |
| SAML assertions | Assertion lifetime + audit | High |
| Signed documents (contracts) | 10-30 years | Critical |
| Loan / mortgage documents | 10-30 years | Critical |
| Regulatory evidence | 5-10 years | Critical |
| Software update infrastructure | Product support lifetime | Critical |
| ATM / POS firmware | Device operational lifetime (10+ years) | Critical |
| HSM-backed signing | Lifecycle-dependent | Critical |
| Mobile banking app signing | App distribution lifetime | High |
| Bank infrastructure firmware | Device operational lifetime | Critical |
| Audit log signing | Retention + audit window | High |

---

## 3. Risk chain

    Signing Key
        |
        v
    Certificate / Trust Anchor
        |
        v
    Artifact / Transaction / Token
        |
        v
    Verifier
        |
        v
    Business decision

### Example chains

**Compromised transaction-signing key**

    Signing key compromise
        |
    forged token / message
        |
    API accepts token
        |
    unauthorized transaction

**Compromised code-signing key**

    Signing key compromise
        |
    malicious update
        |
    bank endpoint
        |
    privilege escalation / malware

**Compromised CA key**

    CA key compromise
        |
    forged certificate
        |
    identity impersonation

---

## 4. Regulatory overlay

### DORA Article 9
Financial entities must maintain high standards of confidentiality,
integrity, and availability of data at rest, in use, and in transit.

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

### DORA Article 30 — Contractual arrangements
Particularly relevant for PKI, certificate-authority, and signing-service
vendors. Key requirements:
- Contractual arrangements with ICT third-party service providers
- Exit strategies
- Data location and processing
- Access, use, and control
- Audit and access rights
- Termination rights

### NIS2 Article 21(2)(h)
Policies and procedures regarding the use of cryptography and, where
appropriate, encryption, as part of cybersecurity risk-management measures.

### PQC migration guidance
- UK NCSC PQC timelines
- EU Coordinated PQC Roadmap
- U.S. federal PQC policy (contextual)

---

## 5. Financial-services specific attack paths

### Path A — Transaction integrity
- Payment authorization signing key compromise
- Transaction message forgery
- API token forgery (JWT/SAML)
- Clearing and settlement message forgery

### Path B — Code and firmware
- Banking app signing key compromise
- ATM / POS firmware signing compromise
- Internal software distribution signing compromise
- Device provisioning signing compromise

### Path C — Trust chain
- Root CA compromise
- Intermediate CA compromise
- Cross-signing abuse
- Trust store poisoning

### Path D — Long-lived artifacts
- Signed contracts losing assurance
- Regulatory evidence losing assurance
- Archived transaction records losing assurance
- KYC / AML dossiers losing assurance

### Path E — Third-party
- Cloud provider code signing
- SaaS providers signing tokens
- Payment processors signing transactions
- Clearing and settlement signing
- SWIFT service bureau signing

---

## 6. Prioritization model

For each signed asset:

1. Classify asset type
2. Determine signature assurance lifetime (independent of retention)
3. Identify signing key and trust chain
4. Assess quantum vulnerability
5. Map verifier population
6. Estimate migration lead time
7. Assess adversarial value
8. Identify regulatory obligations (DORA Art. 30, RTS Art. 6/7, NIS2)
9. Determine treatment path (re-sign / re-issue / re-anchor / retire)
10. Track migration status

---

## 7. Cross-references

- QS03 — Signature trust exposure framework (parent entry)
- QS01 — HNDL confidentiality exposure (parallel Mosca's inequality)
- QS04 — Cryptographic discovery and inventory
- QS05 — Crypto agility
- QS06 — Secure PQC/hybrid migration
- QS07 — Hardware roots of trust (HSM, TPM, Secure Boot)
