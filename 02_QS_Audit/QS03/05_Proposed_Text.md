# QS03 — Proposed Revised Text (OWASP PR candidate — FULL)

This is the complete proposed revised QS03 text. Every section is written out
verbatim. When submitting the PR, use this file directly as the source.

---

## Description

Digital signatures provide authenticity and integrity for software, firmware,
certificates, documents, tokens, communications protocols, and other
security-sensitive objects. Many widely deployed signature mechanisms,
including RSA and discrete-logarithm-based schemes such as ECDSA, EdDSA, and
legacy DSA, rely on mathematical assumptions that a sufficiently capable
cryptographically relevant quantum computer (CRQC) is expected to undermine.

The security impact is not primarily loss of confidentiality. Instead, quantum
compromise of a classical signing mechanism can enable an adversary to forge
signatures or otherwise undermine the authenticity and integrity decisions
that depend on those signatures. The impact therefore extends beyond the
individual signing key to the trust architecture that accepts the signature,
including certificate authorities, trust anchors, firmware verification
systems, software update mechanisms, token validators, document-verification
systems, and hardware-backed identities.

A digital-signature migration must therefore be assessed as a trust-chain
migration rather than a simple algorithm replacement. Depending on the use
case, the chain may include a root or trust anchor, certificate issuer, signing
key, certificate or key identifier, artifact or message format, verifier
implementation, trust-store policy, revocation mechanism, update process, and
hardware or embedded components. A migration can fail when a new post-quantum
signature can be generated but cannot be validated by deployed verifiers, when
classical signatures remain accepted as a fallback, or when trust anchors and
other cryptographic dependencies cannot be updated securely.

Long-lived signed artifacts create an additional risk dimension. The period
for which a relying party needs confidence in a signature may extend beyond
the expected migration lifetime of the underlying classical signature
mechanism. This signature assurance lifetime is distinct from the retention
period of the artifact itself. Examples include long-lived software and
firmware, archived contracts and records, certificates, signed configuration,
legal or regulatory evidence, and other artifacts that may need to remain
trusted for many years.

Post-quantum migration should therefore assess the required signature
assurance lifetime, the complete trust chain, deployed verifier capabilities,
algorithm and encoding support, hardware and protocol constraints, and the
availability of secure migration and rollback mechanisms. NIST has
standardized ML-DSA and SLH-DSA as post-quantum signature mechanisms, while
current IETF standards define ML-DSA use in X.509, CMS, and JOSE/COSE.
Appropriate algorithm selection should remain dependent on the application,
protocol, security requirements, and implementation constraints.

Deployment of a post-quantum signing algorithm in one component does not by
itself remove the risk. Residual classical dependencies may remain in
certificate chains, trust anchors, verification libraries, firmware, hardware
roots of trust, tokens, archived artifacts, or third-party systems.
Organizations should therefore track migration at the level of the complete
signature and trust lifecycle rather than treating individual algorithm
replacement as proof of quantum readiness.

## Cryptographic assumptions

RSA, DSA, ECDSA, and EdDSA are quantum-vulnerable: they rely on integer
factorization or discrete-logarithm assumptions that a sufficiently capable
CRQC could break using Shor's algorithm. Until such a machine exists, these
algorithms remain secure against classical attack, but their migration must
begin well before that point.

- RSA -> integer factorization
- ECDSA / EdDSA -> elliptic-curve discrete logarithm
- DSA -> finite-field discrete logarithm

DSA is retained in FIPS 186-5 only for verification of existing signatures,
not for new signature generation.

## Re-establishment failure mode

A signature or credential migration can complete correctly on every
cryptographic measure — the new signature verifies, the new certificate chains,
the algorithm is compliant — while the process that issued the new credential
accepted the wrong evidence. If an enrolment flow takes proof-of-possession
from a key this entry already classifies as forgeable, and issues a strong
new credential on the strength of it, it produces two certificates that both
verify and a record indistinguishable from a correct migration.

The risk is not that the signature fails; it is that the re-issuance accepted
a compromised anchor as sufficient authority to mint its replacement.

Three distinct failure modes should be distinguished:

**A. Trust re-establishment failure.** An old classical trust anchor cannot
authenticate the new PQC signer.

**B. Cryptographic migration failure.** A PQC signature is introduced, but a
legacy verifier does not support it, and the artifact is rejected.

**C. Key lifecycle migration failure.** An old signing key transitions to a
new signing key requiring certificate, firmware, or trust-store update, and
the device cannot safely transition.

Prevention item 5 (distinguish re-signing from re-issuance) is the mitigation
for this failure mode specifically. Detection requires auditing the issuance
flow, not just the output: any verification of a migration should confirm
that the new credential was issued on evidence independent of the credential
being replaced.

---

## Common Examples of Vulnerability

1. **Quantum-vulnerable software and firmware signing.** Software updates,
   drivers, operating-system components, firmware, bootloaders, or embedded
   code rely on RSA, ECDSA, EdDSA, or other quantum-vulnerable signatures for
   release or execution authorization.

2. **Classical PKI trust chains.** Root, intermediate, or end-entity
   certificates depend on quantum-vulnerable signature algorithms, leaving
   identity authentication and certificate issuance exposed to future
   signature forgery.

3. **Long-lived signed artifacts.** Contracts, regulatory evidence, signed
   records, firmware images, signed configuration, archived documents, or
   other artifacts require signature assurance longer than the migration
   lifetime of the underlying classical signature mechanism.

4. **Token and message signatures.** JWT, JOSE, COSE, SAML, CMS, or similar
   signed objects rely on quantum-vulnerable signature algorithms and
   continue to trust those algorithms after post-quantum alternatives
   become available.

5. **Hardware-anchored signature trust.** TPMs, Secure Boot, firmware
   verification systems, smart cards, HSM-backed signing systems, or
   embedded trust anchors contain or depend on classical public-key
   signature mechanisms and lack a validated migration or upgrade path.

6. **Verifier-side migration gaps.** Signers or issuers have migrated to
   post-quantum signatures, but deployed verifiers, gateways, devices,
   libraries, trust stores, or protocol implementations cannot validate
   the new signatures.

7. **Classical fallback during PQC migration.** Systems support a
   post-quantum signature mechanism but retain unconditional acceptance of
   quantum-vulnerable classical signatures, creating a downgrade or
   residual-trust path.

8. **Third-party signing dependencies.** SaaS providers, software suppliers,
   certificate authorities, firmware vendors, package registries, or other
   external trust providers continue to depend on quantum-vulnerable signing
   mechanisms while the relying organization assumes its own migration is
   complete.

---

## How to Prevent

**1. Inventory signature and trust dependencies.**

Identify signing keys, certificates, trust anchors, signature algorithms,
artifact formats, verification libraries, token validators, firmware
verification mechanisms, hardware-backed identities, and third-party trust
dependencies. Record where each signature is generated, where it is verified,
and how trust is established.

**2. Assess signature assurance lifetime.**

Determine how long each artifact, identity, firmware image, certificate,
record, or security assertion must remain trustworthy. Assess this signature
assurance lifetime separately from retention or operational lifetime and
prioritize assets whose required assurance extends beyond the expected
migration window.

**3. Migrate the complete trust chain.**

Replace quantum-vulnerable signing mechanisms with appropriate post-quantum
signatures such as ML-DSA or SLH-DSA where suitable. Update trust anchors,
certificate authorities, certificates, signing keys, verification libraries,
trust stores, policy engines, and dependent protocols rather than migrating
only the leaf signing key.

**4. Validate verifier compatibility and interoperability.**

Confirm that all relying parties can validate the selected post-quantum
signature, key format, certificate or object encoding, and protocol
representation. Test constrained devices, firmware, legacy applications,
HSMs, TPMs, network components, and third-party integrations where relevant.

**5. Control classical fallback and downgrade paths.**

Do not treat the presence of a post-quantum signature option as sufficient
protection if quantum-vulnerable classical signatures remain unconditionally
accepted. Define explicit algorithm-selection and fallback policies and test
downgrade resistance.

**6. Protect long-lived signed artifacts.**

Identify artifacts whose signature assurance must survive for many years.
Where required, establish an architecture for re-signing, archival
validation, trusted time evidence, algorithm transition, and preservation of
the evidence needed to demonstrate authenticity and integrity over the
required assurance period.

**7. Plan hardware and embedded trust migration.**

Assess TPM, Secure Boot, smart-card, HSM, firmware, and other hardware-root
dependencies for algorithm support, storage, update capability, lifecycle,
and field-upgrade constraints. Do not assume hardware-backed protection is
itself post-quantum; verify the algorithms and secure migration path
supported by the deployed component.

**8. Track residual classical dependencies.**

Maintain migration status until classical signature dependencies are removed,
isolated, or explicitly risk-accepted. Include external certificate
authorities, software suppliers, SaaS platforms, device vendors, package
ecosystems, and other third parties in the assessment.

---

## Example Attack Scenarios

### Scenario #1 — Forged software update

An organization distributes software updates signed with a quantum-vulnerable
RSA or ECDSA private signing key. An adversary obtains the corresponding
public key and retains information about the signing environment.

Once a CRQC becomes capable of compromising the underlying signature scheme,
the adversary derives the private signing key or otherwise obtains a practical
capability to create valid-looking signatures. The attacker then signs a
malicious software update. If update-verification systems trust the affected
signer and do not require an appropriately migrated post-quantum trust chain,
the malicious update may be accepted as authentic and installed.

The security impact is integrity and authenticity compromise rather than
decryption of the signed software.

### Scenario #2 — Compromised certificate authority signing key

A certificate hierarchy relies on a quantum-vulnerable signature mechanism. A
future quantum-capable adversary compromises the corresponding CA private key
or obtains an equivalent signature-forgery capability.

The attacker generates a fraudulent certificate for a targeted identity. A
relying party that still trusts the affected CA and accepts the classical
signature can be induced to authenticate the attacker as the legitimate
identity.

The risk therefore extends beyond the individual certificate to the trust
anchor, certificate issuance process, validation policy, and relying-party
trust store. In a signature chain, the strength of the chain is bounded by
its weakest quantum-vulnerable link.

### Scenario #3 — Long-lived signed artifact loses assurance

An organization stores a signed legal, financial, regulatory, or operational
artifact for decades. The artifact was signed using a classical public-key
signature algorithm whose security assumptions are expected to be vulnerable
to a sufficiently capable quantum computer.

The artifact itself remains unchanged, but future quantum capabilities
undermine confidence that the signature could not have been forged by an
unauthorized party. If the organization needs to demonstrate authenticity and
integrity throughout the artifact's required assurance lifetime, the original
classical signature may no longer provide sufficient evidence.

The mitigation therefore requires lifecycle planning for signature assurance,
archival validation, and, where appropriate, re-signing or migration to a
post-quantum signature mechanism.

### Scenario #4 — Long-lived credential

A government issues identity credentials with a ten-year validity period,
signed with ECDSA. A CRQC becomes available in year three. An attacker forges
credentials that verify against the still-trusted classical issuer.

Re-issuance of PQC credentials must not rely on the compromised classical
credential as proof of identity; the issuance flow must require independent
evidence.

### Scenario #5 — Re-establishment failure

An organisation migrates its internal PKI to PQC. The migration is
technically correct on every cryptographic measure: new signatures verify,
new certificate chains build, algorithms are compliant.

However, the enrolment flow for the new PQC certificates accepts
proof-of-possession from the same classical key that the old certificates
used. An attacker who has already compromised the classical key (or who will
compromise it with a CRQC) can enrol for a PQC certificate under any identity
the enrolment flow will accept. The resulting certificate chain verifies
cleanly and is indistinguishable from a correct migration.

### Scenario #6 — Post-quantum signer with classical verifier

A software publisher migrates its release signing system to a post-quantum
signature algorithm. However, a population of deployed devices still supports
only the legacy classical signature algorithm.

The publisher either cannot deploy the new signature at all or introduces a
fallback allowing both classical and post-quantum signatures. An attacker
targets the classical path, causing the device to continue accepting a
quantum-vulnerable signature even though the publisher considers the migration
complete.

This scenario demonstrates that post-quantum signing is not complete until
the complete signer-to-verifier trust path supports and enforces the intended
migration policy.

### Scenario #7 — Hardware-root migration failure

A device relies on Secure Boot and hardware-backed trust. Its current trust
chain depends on classical signature mechanisms embedded in firmware or device
trust stores.

A new post-quantum signing system is available at the software layer, but the
deployed device cannot securely update its trust anchors, verification
implementation, or firmware signing policy. The organization therefore cannot
establish a complete post-quantum trust chain without hardware or firmware
lifecycle changes.

The resulting exposure is a migration and trust-establishment failure rather
than simply a weak cryptographic algorithm.

---

## Reference Links

### Primary technical standards

- **NIST FIPS 204 — ML-DSA.** Final, August 2024; see current NIST
  errata/planning note.
- **NIST FIPS 205 — SLH-DSA.** Final, August 2024.
- **NIST FIPS 186-5 — Digital Signature Standard.** Classical signature
  baseline (RSA, ECDSA, EdDSA; DSA verification-only).
- **NIST SP 800-208 — Stateful Hash-Based Signature Schemes (LMS, XMSS).**
  Final, October 2020.
- **NIST IR 8547 (Initial Public Draft) — Transition to Post-Quantum
  Cryptography Standards.** 12 November 2024.

### IETF standards

- **RFC 9881 — ML-DSA in X.509.** October 2025.
- **RFC 9882 — ML-DSA in CMS.** October 2025.
- **RFC 9909 — SLH-DSA in X.509.** December 2025.
- **RFC 9964 — ML-DSA for JOSE and COSE.** May 2026.

### Migration guidance / roadmaps

- **NCSC — PQC migration guidance.**
- **EU Coordinated Implementation Roadmap for the Transition to PQC.**

### U.S. government policy

- **NSA CNSA 2.0.**
- **NSA CNSA 2.0 FAQ** — algorithm-allowance table.

### Platform / industry references

- **TCG TPM 2.0 v185** — PQC support (ML-KEM, ML-DSA, Attestation Keys).
- **TCG PTP 1.07** — ML-DSA in PC Client TPM profile.
- **UEFI Secure Boot specification.**
- **UEFI PQC work (2026).**
- **CA/Browser Forum Ballot SC-081** — TLS certificate lifetime reduction.
- **IETF LAMPS Working Group** — PQC X.509 and CMS extensions.

### EU regulatory references

- **NIS2 Article 21(2)(h)** — cryptography / encryption policies.
- **DORA Articles 28-44 (esp. Article 30)** — ICT third-party risk management.
- **Cyber Resilience Act, Annex I** — integrity / authenticity.

---

## Standards and Regulatory Mapping

| Source | Type | Jurisdiction / Scope | QS03 relevance |
|---|---|---|---|
| NIST FIPS 204 | Standard | U.S. / intl. | ML-DSA general signatures |
| NIST FIPS 205 | Standard | U.S. / intl. | SLH-DSA high-assurance signatures |
| NIST FIPS 186-5 | Standard | U.S. / intl. | Classical signature baseline |
| NIST SP 800-208 | Standard / recommendation | U.S. / intl. | LMS/XMSS stateful HBS |
| NIST IR 8547 | Initial Public Draft | U.S. transition planning | PQC migration |
| NSA CNSA 2.0 | Policy directive / algorithm suite | U.S. NSS | Firmware/software signing by 2030 |
| NSA CNSA 2.0 FAQ | Advisory | U.S. NSS | Algorithm-allowance table |
| NCSC PQC guidance | Government guidance | UK / broader reference | ML-DSA recommendations |
| RFC 9881 | IETF Standards Track | International | ML-DSA in X.509 |
| RFC 9882 | IETF Standards Track | International | ML-DSA in CMS |
| RFC 9909 | IETF Standards Track | International | SLH-DSA in X.509 |
| RFC 9964 | IETF Standards Track | International | ML-DSA for JOSE / COSE |
| TCG TPM 2.0 v185 | Platform specification | International | PQC hardware-backed trust |
| TCG PTP 1.07 | Platform specification | International | ML-DSA in TPM profile |
| UEFI Secure Boot | Platform specification | International | Firmware / code-signing trust |
| CA/Browser Forum SC-081 | Industry ballot | Global TLS ecosystem | Certificate lifetime reduction |
| IETF LAMPS WG | Standards development | International | PQC X.509 / CMS extensions |
| NIS2 Art. 21(2)(h) | Directive | EU covered entities | Cryptography policies |
| DORA Art. 28-44 (esp. 30) | Regulation | EU financial entities | Third-party PKI risk |
| CRA Annex I | Regulation | EU products w/ digital elements | Integrity / authenticity |
