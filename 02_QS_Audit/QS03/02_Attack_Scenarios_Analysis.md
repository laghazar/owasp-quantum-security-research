# QS03 — Attack Scenarios Analysis (FULL)

## Merged scenario set — 5 total

- 3 existing OWASP scenarios (extended)
- 2 new scenarios (credential, re-establishment failure)
- 5 supplementary scenarios (software update, CA compromise,
  long-lived artifact, PQC signer + classical verifier, hardware-root failure)
- All content merged below, no reduction.

---

## Scenario 1 — Code-signing key compromise (ECDSA P-256)

### Current (OWASP draft)
"An attacker with a future CRQC recovers the private key of a code-signing
certificate still on ECDSA P-256. They sign malware that passes verification
on every device trusting that anchor, distributing a malicious 'update'
through the legitimate update channel."

### Core logic assessment
Correct. Active forgery model. Retain with extensions.

### Findings addressed
- OBS-007 (code-signing high impact)
- OBS-013 (HSM/verifier extension)
- OBS-021 (verifier migration)

### Proposed revised scenario 1 (FULL)

An organization distributes software updates signed with a quantum-vulnerable
RSA or ECDSA private signing key. An adversary obtains the corresponding public
key and retains information about the signing environment.

Once a CRQC becomes capable of compromising the underlying signature scheme,
the adversary derives the private signing key or otherwise obtains a practical
capability to create valid-looking signatures. The attacker then signs a
malicious software update. If update-verification systems trust the affected
signer and do not require an appropriately migrated post-quantum trust chain,
the malicious update may be accepted as authentic and installed.

The compromised key may be protected in an HSM, but HSM protection does not
alter the mathematical vulnerability of the algorithm; the quantum attack
recovers the corresponding private key from the public key, not by extracting
it from the HSM. The attack is indistinguishable from a legitimate update, and
revoking the signing certificate does not retroactively invalidate software
already installed by trusting verifiers.

The security impact is integrity and authenticity compromise rather than
decryption of the signed software.

---

## Scenario 2 — Partial CA hierarchy migration

### Current (OWASP draft)
"An organisation migrates its leaf TLS certificates to PQC but leaves the root
and intermediate CAs on RSA. An attacker forges an intermediate CA signature
with a CRQC and issues trusted certificates for arbitrary domains - the chain
is only as strong as its weakest classical link."

### Core logic assessment
Correct. Retain with extension.

### Findings addressed
- OBS-002 (trust-chain migration)
- OBS-014 (scenario chain precision)
- OBS-015 (certificate migration)

### Proposed revised scenario 2 (FULL)

A certificate hierarchy relies on a quantum-vulnerable signature mechanism.
The organization migrates its leaf TLS certificates to PQC but leaves the root
and intermediate CAs on RSA.

A future quantum-capable adversary compromises the corresponding CA private
key or obtains an equivalent signature-forgery capability. The attacker
generates a fraudulent certificate for a targeted identity. A relying party
that still trusts the affected CA and accepts the classical signature can be
induced to authenticate the attacker as the legitimate identity.

In a signature chain, the strength of the chain is bounded by its weakest
quantum-vulnerable link; partial migration that upgrades leaf certificates
while leaving roots or intermediates classical does not reduce the forgery
risk for the chain as a whole. The risk extends beyond the individual
certificate to the trust anchor, certificate issuance process, validation
policy, and relying-party trust store.

---

## Scenario 3 — Long-lived signed artefact

### Current (OWASP draft)
"A vendor issues software releases signed with ECDSA, with signatures expected
to remain valid for the product's decade-long support lifetime. Once a CRQC
exists, an attacker recovers the signing key and forges signatures on
malicious updates that still validate against the long-lived, un-rotated trust
anchor - the artefact was exposed from the day it was signed, under the same
Mosca's-inequality logic that governs confidentiality."

### Core logic assessment
Correct. Retain with retroactive framing extension.

### Findings addressed
- OBS-013 (long-lived signed artifacts)
- OBS-014 (signature assurance lifetime)
- OBS-040 (retroactive vs prospective exposure)

### Proposed revised scenario 3 (FULL)

An organization stores a signed legal, financial, regulatory, or operational
artifact for decades. The artifact was signed using a classical public-key
signature algorithm whose security assumptions are expected to be vulnerable
to a sufficiently capable quantum computer.

The artifact itself remains unchanged, but future quantum capabilities
undermine confidence that the signature could not have been forged by an
unauthorized party. If the organization needs to demonstrate authenticity and
integrity throughout the artifact's required assurance lifetime, the original
classical signature may no longer provide sufficient evidence.

Unlike confidentiality exposure, which is prospective (data collected now,
decrypted later), signature exposure is retroactive: any signature produced
today with a quantum-vulnerable key becomes forgeable once a CRQC exists, and
the trust it carries may still be acted upon.

The mitigation therefore requires lifecycle planning for signature assurance,
archival validation, and, where appropriate, re-signing or migration to a
post-quantum signature mechanism. Re-signing with a PQC scheme before the
classical scheme is deprecated is therefore remediation, not migration.

---

## Scenario 4 — Long-lived credential

### Findings addressed
- OBS-006 (re-establishment failure, mode A)
- OBS-030 (re-signing vs re-issuance)
- OBS-031 (re-establishment detection)

### Proposed scenario 4 (FULL)

A government issues identity credentials with a ten-year validity period,
signed with ECDSA. A CRQC becomes available in year three. An attacker forges
credentials that verify against the still-trusted classical issuer.

Re-issuance of PQC credentials must not rely on the compromised classical
credential as proof of identity. A credential asserts that a named subject
controls a key; a PQC signature over the same claim only re-asserts it with
stronger cryptography - it does not re-establish the claim itself.

The issuance flow must require independent evidence: fresh identity proofing,
a still-trusted anchor, or hardware attestation. This is a concrete instance
of the re-establishment failure mode described in the Description section.

---

## Scenario 5 — Re-establishment failure

### Findings addressed
- OBS-006 (re-establishment failure, all 3 sub-modes)
- OBS-030 (re-signing vs re-issuance)
- OBS-031 (re-establishment detection)

### Proposed scenario 5 (FULL)

An organisation migrates its internal PKI to PQC. The migration is technically
correct on every cryptographic measure: new signatures verify, new certificate
chains build, algorithms are compliant.

However, the enrolment flow for the new PQC certificates accepts
proof-of-possession from the same classical key that the old certificates
used. An attacker who has already compromised the classical key (or who will
compromise it with a CRQC) can enrol for a PQC certificate under any identity
the enrolment flow will accept.

The resulting certificate chain verifies cleanly and is indistinguishable
from a correct migration. Detection requires auditing the issuance flow, not
just the output. Migration verification should confirm that the new credential
was issued on evidence independent of the credential being replaced.

### Sub-modes that QS03 should distinguish

**A. Trust re-establishment failure**
Old classical trust anchor cannot authenticate new PQC signer.

**B. Cryptographic migration failure**
PQC signature introduced, but legacy verifier doesn't support it, and the
artifact is rejected.

**C. Key lifecycle migration failure**
Old signing key -> new signing key requires cert / firmware / trust-store
update, and the device cannot safely transition.

---

## Scenario 6 — Post-quantum signer with classical verifier

### Findings addressed
- OBS-021 (verifier migration)
- OBS-023 (downgrade / fallback)

### Proposed scenario 6 (FULL)

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

---

## Scenario 7 — Hardware-root migration failure

### Findings addressed
- OBS-008 (Secure Boot trust root)
- OBS-028 (TPM 2026 PQC support)
- OBS-029 (UEFI PQC direction)

### Proposed scenario 7 (FULL)

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

## Assessment tables

### Scenario 1 — Code-signing key compromise
| Element | Assessment |
|---|---|
| Core concept | Correct |
| HSM interaction | Needs explicit statement |
| Verifier population | Needs extension |
| Revocation limits | Needs extension |
| Overall | Keep with extensions |

### Scenario 2 — Partial CA hierarchy migration
| Element | Assessment |
|---|---|
| Chain integrity concept | Correct |
| Weakest link precision | Needs extension |
| Overall | Keep with extension |

### Scenario 3 — Long-lived signed artefact
| Element | Assessment |
|---|---|
| Mosca's inequality use | Correct |
| Retroactive vs prospective | Needs explicit statement |
| Re-signing as remediation | Correct |
| Overall | Keep with extension |

### Scenario 4 — Long-lived credential (NEW)
| Element | Assessment |
|---|---|
| Core concept | Correct |
| Re-issuance requirement | Correct |
| Re-establishment risk | Highlighted |
| Overall | Add to entry |

### Scenario 5 — Re-establishment failure (NEW)
| Element | Assessment |
|---|---|
| Core concept | Candidate contribution |
| Detection guidance | Required |
| Sub-modes (A/B/C) | Explicit |
| Overall | Add to entry |

### Scenario 6 — PQC signer + classical verifier (NEW)
| Element | Assessment |
|---|---|
| Core concept | Verifier-side gap |
| Downgrade risk | Explicit |
| Overall | Add to entry |

### Scenario 7 — Hardware-root migration failure (NEW)
| Element | Assessment |
|---|---|
| Core concept | Hardware lifecycle constraint |
| TPM/UEFI context | Referenced |
| Overall | Add to entry |

---

## Attack Scenarios — unified findings register

| ID | Finding | Type | Priority |
|---|---|---|---|
| OBS-007 | Code-signing high impact | Gap | Very High |
| OBS-013 | Long-lived signed artifacts | Gap | Very High |
| OBS-014 | Signature assurance lifetime | New dimension | Very High |
| OBS-015 | Certificate migration | Gap | High |
| OBS-016 | CMS / archive signatures | Extension | High |
| OBS-019 | Blockchain scope | Clarification | Medium-High |
| OBS-021 | Verifier migration | Gap | Very High |
| OBS-023 | Downgrade / fallback | Gap | High |
| OBS-028 | TPM 2026 PQC support | Current evidence | High |
| OBS-029 | UEFI PQC direction | Current evidence | High |
| OBS-030 | Re-signing vs re-issuance | Original contribution | Very High |
| OBS-031 | Re-establishment detection | Missing dimension | Very High |
| OBS-040 | Retroactive vs prospective | Conceptual | High |
