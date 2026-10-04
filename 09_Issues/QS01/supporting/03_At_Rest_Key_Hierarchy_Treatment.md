---
Title: QS01: Expand at-rest HNDL treatment beyond re-encryption
Labels: quantum-security, QS01, technical, high
Priority: High
Related OBS: QS01-OBS-005, 007, 013, 020, 021, 023, 024
Status: draft
---

## Problem

Stored-data HNDL depends on the complete cryptographic protection hierarchy,
not just the leaf encryption algorithm.

Real architectures can be:

- Master / Root Key -> KEK -> DEK -> Encrypted Data
- KMS / HSM -> KEK / wrapping key -> DEK -> AES ciphertext

Remediation may involve:

- Re-encryption
- Re-wrapping
- Key-hierarchy migration
- Replacement of vulnerable key-establishment mechanisms
- New protection envelope
- KMS migration / HSM replacement

## Specific corrections

1. "PQC-protected encryption envelope" is ambiguous — ML-KEM is a KEM, not an
   encryption algorithm like AES-GCM.

2. "CRQC recovers wrapping key" is technically imprecise. For RSA:
   - Public key = wrapping / encryption key
   - Private key = unwrapping / decryption key
   The quantum attack recovers the private key.

3. HSM / KMS protection does not remove the quantum vulnerability of RSA / ECC.
   It reduces classical key-extraction risk only.

## Proposed wording

> "For high-priority archives and backups, assess the complete protection
> hierarchy, including data-encryption keys, key-encryption or wrapping keys,
> KMS/HSM dependencies, and recovery mechanisms. Apply an architecture-
> appropriate migration treatment, which may include re-encryption,
> re-wrapping, key-hierarchy migration, replacement of vulnerable
> key-establishment mechanisms, or deployment of a new protection envelope."

## Acceptance

- At-rest treatment accounts for key hierarchy
- "PQC-protected encryption envelope" clarified
- "recovers wrapping key" -> "recovers corresponding private key"
- HSM/KMS is not PQ protection stated explicitly
- Cross-reference to QS07 added
