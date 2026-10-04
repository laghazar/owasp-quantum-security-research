# QS01 — Proposed Revised Text (OWASP PR candidate — FULL)

This is the complete proposed revised QS01 text. Every section is written out
verbatim. When submitting the PR, use this file directly as the source.

---

## Description

Adversaries can collect encrypted data today and retain it for future decryption
once a cryptographically relevant quantum computer (CRQC) becomes available.
This harvest-now-decrypt-later (HNDL) exposure is relevant when data that
remains confidential for a sufficiently long period is currently protected by
cryptographic mechanisms that are expected to be vulnerable to quantum attacks.

For communications, the relevant exposure commonly arises from quantum-vulnerable
public-key key-establishment mechanisms such as RSA key transport or classical
finite-field Diffie-Hellman and elliptic-curve Diffie-Hellman. For stored data,
the exposure can arise when encrypted archives, databases, backups, or other
ciphertext remain dependent on quantum-vulnerable key-establishment,
key-encryption, key-wrapping, or key-management mechanisms.

The in-transit and at-rest cases share the same HNDL risk outcome: data acquired
before quantum-safe protection is deployed may become decryptable later. However,
they differ materially in acquisition method, cryptographic dependency, and
remediation path. In-transit exposure primarily involves collection of protocol
transcripts and ciphertext across untrusted network boundaries. At-rest exposure
involves exfiltration or compromise of existing encrypted stores and the key
material or key hierarchy required to decrypt them.

The relevant risk should be assessed using the confidentiality lifetime of the
data, migration lead time, and the organisation's assessed quantum-risk horizon.
Confidentiality lifetime is the period during which unauthorised disclosure of
the data would remain materially harmful or unacceptable. It should be assessed
separately from the retention period, because data may be retained for longer
than the period during which disclosure would remain materially harmful, or may
require confidentiality protection even after active business use has ended.

A practical planning model is often expressed using Mosca's inequality: if the
time required to migrate to quantum-safe cryptography (X) plus the required
confidentiality lifetime of the data (Y) exceeds the assessed time until a CRQC
could compromise the relevant cryptographic protection (Z), the data may be
exposed to HNDL risk. Published migration roadmaps such as the UK NCSC timelines
and the EU coordinated PQC roadmap provide migration milestones; these should
not be interpreted as forecasts of the date on which a CRQC will become available.

HNDL assessment should therefore consider both the data itself and the complete
cryptographic dependency chain protecting it, including public-key key
establishment, certificates, key-encryption or key-wrapping mechanisms, KMS/HSM
dependencies, protocols, applications, libraries, and third-party services.
Organisations should prioritise migration where long confidentiality lifetimes,
high adversarial value, quantum-vulnerable cryptographic dependencies, and long
migration lead times combine to create significant exposure.

---

## Common Examples of Vulnerability

**Long-lived sensitive data protected only by classical public-key cryptography**

Health records, regulated personal data, intellectual property, government or
defence information, financial records, contractual information, and other data
whose confidentiality lifetime extends beyond relevant PQC migration milestones
or the organisation's assessed quantum-risk horizon.

**Quantum-vulnerable key establishment across untrusted boundaries**

TLS, VPN, private-network, satellite, microwave, or other communications channels
that depend on quantum-vulnerable public-key mechanisms for key establishment,
key agreement, or key transport.

**Long-lived archives and backups with quantum-vulnerable key protection**

Historical archives, backups, databases, or offline stores in which the
ciphertext remains protected by classical public-key key-encryption, wrapping,
or key-management mechanisms for longer than the available migration window.

**Symmetric encryption with vulnerable public-key key protection**

Data encrypted using strong symmetric algorithms such as AES-256 while the
corresponding data-encryption keys remain protected by quantum-vulnerable RSA
or elliptic-curve key-encryption or key-wrapping mechanisms.

**Partial migration leaving residual HNDL exposure**

- **5A — Communications:** Communication channels have migrated to PQC or hybrid
  key establishment while long-lived certificate, authentication, or signature
  dependencies remain classical.
- **5B — Stored data:** Communications have migrated to PQC or hybrid key
  establishment while archived data remains dependent on quantum-vulnerable
  key-encryption, key-wrapping, or key-management mechanisms.

---

## How to Prevent

**1. Identify and prioritize HNDL exposure**

Identify the cryptographic dependencies protecting high-value and long-lived
data, including key-establishment mechanisms, certificates, key-encryption or
key-wrapping mechanisms, KMS/HSM dependencies, protocols, applications,
libraries, and third-party services. Use cryptographic inventory information
to prioritize remediation.

**2. Classify data by confidentiality lifetime and adversarial value**

Classify and prioritize data based on confidentiality lifetime and adversarial
value, not sensitivity alone. Assess confidentiality lifetime separately from
retention period and use the result to determine migration priority.

**3. Migrate quantum-vulnerable communications**

Migrate quantum-vulnerable key-establishment mechanisms in externally exposed
channels to standards-based PQC or appropriate hybrid configurations using
approved mechanisms such as ML-KEM, where supported. Validate interoperability,
downgrade and fallback behaviour, certificate dependencies, and migration
readiness across clients, servers, libraries, proxies, and network infrastructure.

**4. Protect long-lived stored data and its key hierarchy**

For high-priority archives and backups, assess the complete protection hierarchy,
including data-encryption keys, key-encryption or wrapping keys, KMS/HSM
dependencies, and recovery mechanisms. Apply an architecture-appropriate
migration treatment, which may include re-encryption, re-wrapping, key-hierarchy
migration, replacement of vulnerable key-establishment mechanisms, or deployment
of a new protection envelope.

**5. Reduce unnecessary exposure and maintain migration controls**

Where legally, operationally, and contractually permissible, reduce the
retention and replication of data whose confidentiality lifetime creates
significant HNDL exposure. Securely delete or de-identify data that no longer
requires retention. Use symmetric-key rotation as a supporting key-management
control, but not as a standalone mitigation for HNDL. Track residual classical
cryptographic dependencies and migration status until the relevant protection
has been fully transitioned.

---

## Example Attack Scenarios

### Scenario #1 — Passive collection of vulnerable encrypted traffic

An adversary passively records TLS-protected traffic as it crosses an untrusted
network boundary today. The connection relies on a quantum-vulnerable public-key
key-establishment mechanism, such as legacy RSA key transport or classical
finite-field or elliptic-curve Diffie-Hellman. The attacker retains the relevant
handshake information and ciphertext.

Once a CRQC becomes available, the attacker compromises the vulnerable
public-key mechanism using a quantum attack, derives or recovers the
cryptographic keying material required to process the captured traffic, and
decrypts previously captured information whose confidentiality lifetime extends
into the future.

This scenario assumes that the attacker can capture and retain the relevant
protocol material and that the underlying information remains sensitive until
future quantum cryptanalysis becomes feasible. Classical forward secrecy does
not by itself eliminate this HNDL exposure when the underlying ephemeral
key-establishment mechanism remains quantum-vulnerable.

### Scenario #2 — Exfiltration of an encrypted archive and protected key material

A regulated entity stores sensitive records in an AES-encrypted archive. The
data-encryption key (DEK) is protected by a quantum-vulnerable RSA key-encryption
or key-wrapping mechanism. The attacker exfiltrates the encrypted archive
together with the associated protected key material and retains it.

Once a CRQC becomes available, the attacker compromises the corresponding RSA
private key, recovers the protected DEK, and decrypts the historical archive.

The retention period of the records should not be assumed to be identical to
their confidentiality lifetime; the HNDL assessment should determine how long
unauthorised disclosure would remain materially harmful.

Protection of the RSA private key by an HSM or KMS does not by itself remove
the quantum vulnerability of the RSA algorithm. The assessment must therefore
consider both algorithmic vulnerability and the architecture used to protect
the key hierarchy.

---

## Reference Links

### Primary technical references

- **NIST FIPS 203 — Module-Lattice-Based Key-Encapsulation Mechanism Standard (ML-KEM).**
  Final, published 13 August 2024.
- **NIST SP 800-227 — Recommendations for Key-Encapsulation Mechanisms.**
  Final, published 18 September 2025. Secure implementation and use.
- **NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
  Cryptography Standards.** Published 12 November 2024. Transition planning
  document, not a normative algorithm standard.

### Migration guidance / roadmaps

- **UK NCSC — Timelines for migration to post-quantum cryptography.**
  Milestones: 2028 discovery + initial migration plan; 2031 highest-priority
  migration; 2035 full migration target.
- **EU Coordinated Implementation Roadmap for the Transition to PQC.**
  Member States start transition by end-2026; high-risk use cases migrate to
  PQC no later than end-2030.

### U.S. government policy (scope-limited)

- **U.S. NSM-10** — national security memorandum on quantum-risk migration.
- **OMB M-23-02** — federal memorandum on cryptographic inventory and PQC
  migration for U.S. federal agencies.
- **NSA CNSA 2.0** — algorithm suite / advisory for U.S. National Security
  Systems.

### EU regulatory references

- **NIS2 Article 21(2)(h)** — policies and procedures regarding cryptography
  and, where appropriate, encryption.
- **DORA Article 9** — ICT risk management; confidentiality, integrity, and
  availability of data at rest, in use, and in transit.
- **Commission Delegated Regulation (EU) 2024/1774, Article 6** — encryption
  and cryptographic controls policy.
- **Commission Delegated Regulation (EU) 2024/1774, Article 7** — cryptographic
  key lifecycle.
- **Cyber Resilience Act, Annex I** — state-of-the-art protection for
  confidentiality of stored, transmitted, or otherwise processed data.

---

## Standards and Regulatory Mapping

| Source | Type | Jurisdiction / Scope | QS01 relevance |
|---|---|---|---|
| NIST FIPS 203 | Standard | U.S. / internationally influential | ML-KEM key establishment |
| NIST SP 800-227 | Standard / guidance | U.S. / internationally influential | KEM secure use |
| NIST IR 8547 | Initial Public Draft | U.S. transition planning | PQC migration |
| NCSC PQC timelines | Government guidance | UK / broader reference | Migration milestones |
| EU PQC Roadmap | Policy roadmap | EU Member States | Migration milestones |
| NSM-10 | U.S. national security policy | U.S. government | Quantum-risk migration |
| OMB M-23-02 | Federal memorandum | U.S. federal agencies | HNDL + inventory |
| NSA CNSA 2.0 | Algorithm suite / advisory | U.S. NSS | PQ-resistant cryptography |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography / encryption policies |
| DORA Art. 9 | Regulation | EU financial entities | Data confidentiality |
| DORA RTS Art. 6 | Regulatory technical standard | EU financial entities | Encryption / cryptographic controls |
| DORA RTS Art. 7 | Regulatory technical standard | EU financial entities | Cryptographic key lifecycle |
| CRA Annex I | Regulation | EU products with digital elements | State-of-the-art crypto / data minimisation |
