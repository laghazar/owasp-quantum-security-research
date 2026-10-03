# QS03 — Full Diff (before / after, all sections)

Full "after" text: 02_QS_Audit/QS03/05_Proposed_Text.md

---

## Description

### Before (current OWASP)
- "RSA, DSA, ECDSA, and EdDSA are all broken by Shor's algorithm"
- Mosca's inequality used with Y undefined
- Re-establishment failure buried in a Description paragraph
- No retroactive vs prospective framing
- No trust-chain model
- No signature assurance lifetime

### After
See 05_Proposed_Text.md -> Description + Cryptographic assumptions +
Re-establishment failure mode.

### Changes
- Shor's algorithm qualified (theoretical, CRQC-dependent)
- Underlying cryptographic assumptions decomposed (RSA/factorization,
  ECDSA+EdDSA/ECDLP, DSA/FFDLP)
- Trust-chain migration model introduced
- Signature assurance lifetime defined
- Retroactive vs prospective exposure stated
- Re-establishment failure elevated to distinct section with 3 sub-modes
- DSA verification-only status noted
- Verifier / fallback / hardware-root covered

---

## Common Examples

### Before (current OWASP)
Flat list without class structure; TPM EK unqualified.

### After
8 categorized examples: software/firmware signing, PKI trust chains,
long-lived artifacts, token/message signatures, hardware-anchored trust,
verifier-side gaps, fallback, third-party.

### Changes
- Verifier populations expanded (embedded, IoT, medical, ICS, legacy, third-party)
- TPM qualified; 2026 PQC support referenced
- Long-lived signed artifacts emphasized
- Verifier-side migration gap added
- Fallback / downgrade added
- Third-party dependency added

---

## How to Prevent

### Before (current OWASP)
7 items with mixed granularity; "replace RSA/ECDSA" framing.

### After
8 lifecycle-based control families:
1. Inventory signature and trust dependencies
2. Assess signature assurance lifetime
3. Migrate the complete trust chain
4. Validate verifier compatibility and interoperability
5. Control classical fallback and downgrade paths
6. Protect long-lived signed artifacts
7. Plan hardware and embedded trust migration
8. Track residual classical dependencies

### Changes
- Lifecycle-based rather than algorithm-replacement
- Signature assurance lifetime is first-class
- Verifier compatibility explicit
- Fallback / downgrade explicit
- Hardware and embedded trust migration explicit
- Residual classical dependency tracking explicit

---

## Example Attack Scenarios

### Before (current OWASP)
3 scenarios (code-signing, partial CA, long-lived artefact).

### After
7 scenarios:
1. Forged software update (extended)
2. Compromised certificate authority signing key (extended)
3. Long-lived signed artifact loses assurance (extended)
4. Long-lived credential (new)
5. Re-establishment failure (new)
6. Post-quantum signer with classical verifier (new)
7. Hardware-root migration failure (new)

### Changes
- HSM interaction explicit
- Trust-chain precision
- Retroactive exposure framing
- Long-lived credential scenario
- Re-establishment failure scenario
- Verifier-side gap scenario
- Hardware-root scenario

---

## Reference Links

### Before (current OWASP)
8 references, mixed types, NSA FAQ document number unverified.

### After
5 categories:
- Primary technical standards (FIPS 204, 205, 186-5, SP 800-208, IR 8547)
- IETF standards (RFC 9881, 9882, 9909, 9964)
- Migration guidance (NCSC, EU Roadmap)
- U.S. government policy (CNSA 2.0, FAQ)
- Platform / industry (TCG v185, PTP 1.07, UEFI, UEFI PQC, CA/B SC-081, LAMPS)
- EU regulatory (NIS2, DORA Art. 30, CRA)

### Changes
- FIPS 186-5 added
- RFC 9881, 9882, 9909, 9964 added
- TCG TPM 2.0 v185 added
- TCG PTP 1.07 added
- UEFI Secure Boot and UEFI PQC work added
- CA/B Ballot SC-081 added
- DORA Art. 30 added
- NSA FAQ document number to be verified
- NCSC ML-DSA-65 claim to be verified
- References organized by category

---

## Standards and Regulatory Mapping

### Before (current OWASP)
TODO comment; mixed types; unverified citations.

### After
Taxonomy table with columns: Source / Type / Scope / Relevance.

### Changes
- Converted to structured taxonomy table
- TODO resolved
- CRA qualified (not PQC mandate)
- CNSA 2.0 scoped (NSS only)
- DORA Art. 28-44 scoped; Art. 30 emphasized
- NCSC ML-DSA-65 claim verified or rephrased
- NSA FAQ document number verified or removed
- Modern IETF RFCs added
- TCG / UEFI platform specifications added
