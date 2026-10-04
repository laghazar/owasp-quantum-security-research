# QS01 — Full Diff (before / after, all sections)

Full "after" text: 02_QS_Audit/QS01/05_Proposed_Text.md

---

## Description

### Before (current OWASP)
"Both are the same exposure ... differing only in where the ciphertext currently
resides." ... "required confidentiality lifetime" ... "CRQC planning horizon
most regulators use (2030-2035)" ...

### After
See 05_Proposed_Text.md -> Description (7 paragraphs).

### Changes
- HNDL explicitly defined
- In-transit and at-rest distinguished (acquisition, dependency, remediation)
- Confidentiality lifetime explicitly defined
- Retention vs confidentiality lifetime separated
- CRQC arrival uncertainty separated from migration milestones
- Cryptographic dependency chain introduced
- Mosca's inequality stated with X / Y / Z defined

---

## Common Examples

### Before (current OWASP)
Flat list without class structure.

### After
5 exposure classes; Example 5 split into 5A (communications) and 5B (stored data).

### Changes
- Examples restructured around exposure classes
- Partial migration split into 5A and 5B

---

## How to Prevent

### Before (current OWASP)
Key rotation presented as primary mitigation; "re-encryption" as the main at-rest
treatment; "PQC-protected encryption envelope" ambiguous.

### After
5 control families:
1. Identify and prioritize HNDL exposure
2. Classify data by confidentiality lifetime and adversarial value
3. Migrate quantum-vulnerable communications
4. Protect long-lived stored data and its key hierarchy
5. Reduce unnecessary exposure and maintain migration controls

### Changes
- Key rotation downgraded to supporting control
- Re-encryption generalized to architecture-appropriate treatment
- Crypto dependency discovery added
- Migration tracking added
- "PQC-protected encryption envelope" replaced with architecture-dependent wording

---

## Example Attack Scenarios

### Before (current OWASP)
Scenario 1: "RSA/ECDH", "recovers session key"
Scenario 2: "attacker exfiltrates store", "recovers wrapping key"

### After
Full text in 05_Proposed_Text.md.

### Changes
- Scenario 1: RSA vs ECDH distinguished; TLS version-aware; forward secrecy
  clarified; assumptions explicit
- Scenario 2: exfiltration material specified (archive + key material);
  RSA private key recovery (not "wrapping key"); HSM/KMS clarified;
  retention vs confidentiality distinguished

---

## Reference Links

### Before (current OWASP)
6 references, mixed types, no taxonomy.

### After
4 categories:
- Primary technical references (FIPS 203, SP 800-227, IR 8547)
- Migration guidance / roadmaps (NCSC, EU Roadmap)
- U.S. government policy (NSM-10, OMB M-23-02, CNSA 2.0)
- EU regulatory references (NIS2, DORA Art. 9, DORA RTS Art. 6/7, CRA)

### Changes
- NIST SP 800-227 added
- DORA RTS Art. 6 and Art. 7 added
- References organized by category
- Scopes explicitly labeled

---

## Standards and Regulatory Mapping

### Before (current OWASP)
Flat list mixing standards, drafts, guidance, roadmaps, memoranda, algorithm
suites, directives, regulations.

### After
Taxonomy table with columns: Source / Type / Jurisdiction-Scope / Relevance.

### Changes
- Converted to structured taxonomy table
- Scope column added
- CRA qualified (not explicit PQC mandate)
- U.S. federal policy scoped (NSM-10, OMB M-23-02)
- DORA RTS Art. 6/7 added
- "many products extend past 2030" removed (unsupported)
