# QS01 — Attack Scenarios Analysis (FULL)

## Scenario 1 — Passive TLS capture today, future CRQC decryption

### Current (OWASP draft)
"Passive TLS capture today, RSA/ECDH, future CRQC recovers session key and
decrypts historical traffic."

### Core logic assessment
Textbook HNDL scenario. Core concept is correct. Retain with precision upgrades.

### Original attack chain

    TODAY
    Client ----- TLS ----- Server
                  |
                  |
            Attacker observes
                  |
                  v
            Stores ciphertext
                  |
                  |
            FUTURE CRQC
                  |
                  v
    Recovers vulnerable asymmetric
    key-establishment secret
                  |
                  v
    Reconstructs session secret
                  |
                  v
    Decrypts historical traffic

### Findings

**OBS-017 — RSA/ECDH grouping**

The shorthand "RSA/ECDH" collapses two different TLS constructions:

- **RSA key transport** (legacy TLS 1.2 and earlier):
  Recorded handshake + ciphertext -> future quantum attack against RSA public
  key -> recovery of RSA private key -> recovery of encrypted premaster secret
  -> derivation of session keys -> historical traffic decrypted.

- **(EC)DHE key establishment** (TLS 1.3 and modern TLS 1.2):
  Recorded TLS handshake -> public ephemeral EC keys -> future quantum
  computation -> recover corresponding private value -> reconstruct ECDH
  shared secret -> derive TLS traffic keys -> decrypt recorded ciphertext.

Modern TLS 1.3 removed static RSA and static DH cipher suites. QS01 should not
imply "TLS = RSA/ECDH" universally.

**OBS-018 — Implicit assumptions**

The scenario should state explicitly:
- attacker can capture relevant traffic
- attacker can retain handshake transcript and ciphertext
- session relies on quantum-vulnerable key-establishment mechanism
- protected information remains sensitive until quantum decryption becomes
  feasible

**OBS-019 — Forward secrecy**

Classical forward secrecy protects against future compromise of the long-term
authentication key. It does not protect against a quantum attack on the
ephemeral key-establishment mechanism itself.

    Classical future key compromise
        !=
    Quantum retrospective attack

If the attacker retained the handshake transcript and can later solve the
underlying discrete-log problem with a quantum algorithm, the corresponding
ephemeral secret can be recovered and the historical session can be
reconstructed.

### Proposed revised scenario 1 (FULL)

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

---

## Scenario 2 — Regulated archive exfiltration, future key recovery

### Current (OWASP draft)
"Regulated entity retains personal records 30 years, RSA-wrapped AES at rest;
attacker exfiltrates store now; future CRQC recovers wrapping key and decrypts
archive."

### Attack chain (full)

    TODAY
    Regulated organisation
       |
       +-- Personal records
       |
       +-- AES-encrypted archive
              |
              v
          AES Data Key
              |
              v
          RSA-wrapped DEK
              |
              v
          Key material
              |
    Attacker exfiltrates
    archive + relevant
    cryptographic material
              |
              v
          STORES IT
              |
          YEARS
              |
              v
          FUTURE CRQC
              |
              v
    RSA private-key recovery
              |
              v
    Unwrap AES DEK
              |
              v
    Decrypt archive

### Findings

**OBS-020 — Specify what the attacker exfiltrates**

If the attacker only has AES ciphertext and not the protected key material, the
future quantum attack cannot help. The scenario must specify that the archive
and the protected key material are both exfiltrated and retained.

**OBS-021 — Illustrative architecture**

"RSA-wrapped AES" is one implementation pattern. Real enterprise architecture
may be: HSM master key -> KEK -> DEK -> AES -> Data. QS01 should not tie the
scenario to one wrapping architecture.

**OBS-022 — 30-year retention is not 30-year confidentiality**

    Retention = 30 years
    Confidentiality lifetime = 7 years   (possible)
    Retention = 5 years
    Confidentiality lifetime = 20 years  (possible)

**OBS-023 — "Recovers wrapping key" is technically imprecise**

For RSA:
- Public key = wrapping / encryption key (public)
- Private key = unwrapping / decryption key (secret)

The quantum attack recovers the private key, not the public wrapping key.

**OBS-024 — HSM/KMS does not equal PQ protection**

A strong HSM protects key material from classical extraction. It does not
alter the mathematical vulnerability of RSA/ECC. Quantum attack recovers the
private key from the public key, not by extracting it from the HSM.

    HSM protection != post-quantum protection

### Proposed revised scenario 2 (FULL)

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

## Assessment tables

### Scenario 1 — Final assessment

| Element | Assessment |
|---|---|
| Core HNDL concept | Correct |
| Passive capture model | Correct |
| Future quantum decryption | Correct |
| "Recover session key" wording | Needs precision |
| RSA/ECDH grouping | Needs refinement |
| Threat assumptions | Should be explicit |
| Forward secrecy interaction | Worth clarifying |
| Overall scenario | Keep with corrections |

### Scenario 2 — Final assessment

| Element | Assessment |
|---|---|
| Core HNDL at-rest concept | Correct |
| Exfiltration model | Needs precision |
| Wrapping key recovery wording | Needs technical correction |
| Retention vs confidentiality | Needs clarification |
| HSM/KMS interaction | Needs explicit statement |
| Overall scenario | Keep with corrections |

---

## Attack Scenarios — findings register

| ID | Finding | Type | Priority |
|---|---|---|---|
| OBS-017 | RSA/ECDH grouping needs precision | Technical clarification | High |
| OBS-018 | Passive capture assumptions not explicit | Clarification | Medium |
| OBS-019 | Classical forward secrecy vs quantum retrospective attack | Clarification | High |
| OBS-020 | At-rest scenario: specify exfiltrated material | Technical clarification | High |
| OBS-021 | RSA-wrapped AES as illustrative architecture | Scope/Clarification | Medium |
| OBS-022 | 30-year retention is not 30-year confidentiality | Clarification | High |
| OBS-023 | "recovers wrapping key" -> "recovers corresponding private key" | Technical correction | High |
| OBS-024 | HSM/KMS protection is not PQC protection | Missing dimension / Cross-entry | High |
