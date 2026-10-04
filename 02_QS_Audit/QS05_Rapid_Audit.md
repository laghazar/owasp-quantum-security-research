# QS05 - Rapid Audit

## 1. Scope & Method

Reviewed:

- Description
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenarios
- Reference Links

This is a rapid landscape review, not a forensic reference or regulatory
audit. Findings are precision-level and boundary-level, not structural.

The purpose of this review is to:

- Understand what QS05 claims to be
- Identify observations worth carrying forward
- Check cross-entry boundaries against QS04, QS06, QS07
- Decide whether a full deep-dive is warranted

---

## 2. Entry Summary

### Risk

Crypto-agility failures: systems that cannot replace algorithms, key sizes,
parameter sets, or key formats without rebuilding around them are unable to
respond to NIST parameter-set updates, broken primitives, or future
migrations.

The entry frames crypto-agility as a security control with three governance
requirements:

- named owner
- governing policy
- measurable definition of agility

### Primary failure mode

Technical agility without operational governance and exercised testing is
theoretical agility. The entry explicitly distinguishes:

- Technically agile (abstraction exists)
- Operationally able to exercise agility (tested rotation path)
- Governed agility (owner + policy + runbook)
- Measurable agility (cMTTR, CBOM-bounded)

### Primary actors

- System / application owners (technical agility)
- Governance owners (policy, runbook, triggers)
- Procurement teams (agility requirements in contracts)

### Main controls

- Cryptographic abstraction layer
- Standard libraries with PQC support (OpenSSL 3.x, BoringSSL, SymCrypt,
  JDK 24+, .NET 10+)
- Standardised protocols (TLS 1.3 hybrid PQC)
- Tested end-to-end rotation (including embedded / mobile)
- Procurement requirements for demonstrable replacement
- Track IETF PQUIP + TLS working-group
- Accountable owner + governing policy + runbook
- cMTTR as primary metric, capped by CBOM visibility (QS04)

### Quantum-specific element

PQC parameter sets are still evolving (Falcon, HQC mentioned; NIST rounds
continue). Unlike classical algorithms with decades of stability, PQC
parameter-set agility will be a live requirement post-deployment.

---

## 3. Findings

### QS05-OBS-001 - Entry quality assessment (positive)

**Section:** Description, Prevention, Scenarios

**Observation:** QS05 is the strongest entry reviewed so far in this
workspace. Distinctive features:

- Explicitly frames agility as a governance control, not only a technical
  property
- Provides a named metric (cMTTR)
- Cross-references another active entry by number (capped by CBOM
  visibility, QS04)
- Includes a governance-focused attack scenario (Scenario #3: no
  accountable owner watching triggers)

**Why it matters:** This entry's quality should be preserved. Any findings
from this rapid audit are precision-level and boundary-level, not
structural.

**Evidence required:** None. This is an assessment observation.

**Cross-entry overlap:** None. This is a strength.

**Financial-services relevance:** Indirect - the governance framing
(owner, policy, metric) aligns with regulated-sector expectations.

**Internal Review Priority:** Low (positive assessment)

**Disposition:** Note only

---

### QS05-OBS-002 - cMTTR is named but not operationally defined

**Section:** Prevention item 8

**Observation:** "Track cryptographic time-to-rotate (cMTTR) as the primary
metric, capped by the share of the estate visible in the CBOM (QS04)."

The entry does not define:

- Whether cMTTR is measured per system, per algorithm, per parameter set,
  or per estate
- Whether "time-to-rotate" is wall-clock time from trigger to verified
  completion, or an average
- What the "cap" mechanism is - does it inflation-adjust the metric by
  CBOM coverage, or provide a floor for reporting?
- Whether the metric excludes systems outside CBOM visibility or flags
  them separately

**Why it matters:** cMTTR is proposed as a governance-critical metric.
Without an operational definition, it cannot be independently assessed,
benchmarked, or audited.

**Evidence required:** Compare with NIST CSWP 39upd1 (Considerations for
Achieving Crypto Agility) to determine whether cMTTR is operationally
defined there. If not, this may be a substantive contribution opportunity.

**Cross-entry overlap:** QS04 (CBOM scope defines the denominator)

**Financial-services relevance:** High - cMTTR is exactly the kind of
metric that regulated-sector boards and supervisors look for.

**Internal Review Priority:** High

**Disposition:** Needs research

---

### QS05-OBS-003 - QS05 <-> QS06 boundary pressure in Scenario #2

**Section:** Scenario #2

**Observation:** Scenario #2 describes: abstraction layer exists, rotation
never tested, migration day, embedded client pins classical algorithm
identifier, PQC negotiation silently fails, client continues on classical
crypto.

This is partially an agility failure (untested path), partially a
migration execution failure (client-side pinning defeats negotiation), and
partially a fallback failure (silent downgrade).

**Why it matters:** Where does "agility failure" end and "insecure
migration / hybrid misuse" (QS06) begin? Both entries could legitimately
claim this scenario.

**Evidence required:** Read QS06 to see how it treats pinning and silent
fallback.

**Cross-entry overlap:** QS05 <-> QS06

**Financial-services relevance:** Medium - depends on QS06 boundary
resolution.

**Internal Review Priority:** High

**Disposition:** Needs research - deferred until QS06 audit

---

### QS05-OBS-004 - Procurement "demonstrable replacement" is undefined

**Section:** Prevention item 5

**Observation:** "new contracts should require PQC support and
demonstrable algorithm replacement on a defined timescale."

Two terms are unclear:

- "Demonstrable" - via what evidence? Vendor CBOM? Independent test?
  Certification?
- "Defined timescale" - how defined? By the vendor, by the buyer, or by
  regulation?

**Why it matters:** Procurement is a foundational agility lever, but the
entry leaves the operational definition open. Without it, "demonstrable
replacement" is a contract term that cannot be enforced.

**Evidence required:** None obvious. This is a definitional gap.

**Cross-entry overlap:** QS07 (supplier management), QSxx candidate
(Insecure Quantum Software Supply Chain)

**Financial-services relevance:** High - procurement clauses are a primary
control surface for regulated entities.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research

---

### QS05-OBS-005 - Symmetric agility coverage

**Section:** Description, Common Examples item 5

**Observation:** The entry has one paragraph noting that symmetric
primitives are "more quantum-resilient, but 'quantum is only a public-key
problem' must not be read as 'symmetric needs no work'": AES key sizes,
hash strengths, MAC lengths, KDFs all need review end-to-end.

But the entry's agility framing - abstraction layer, negotiable protocols,
cMTTR - is predominantly public-key agility. Symmetric primitives have
different agility profiles:

- Key-size changes often need only re-keying plus KDF update, not an
  abstraction layer change
- Algorithm swaps (AES to another block cipher) are rare
- Hash and KDF agility may live in different layers (password hashing,
  HKDF)

**Why it matters:** If symmetric agility is a real concern, it should be
developed. If it is context, the entry should say so. Currently it is a
single paragraph with no development.

**Evidence required:** NIST CSWP 39upd1 symmetric coverage.

**Cross-entry overlap:** None obvious.

**Financial-services relevance:** Low-Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - verify CSWP 39upd1 coverage

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS05-OBS-001 | Entry quality (positive) | Low | Note |
| QS05-OBS-002 | cMTTR operationalization | High | Needs research |
| QS05-OBS-003 | QS05 <-> QS06 boundary pressure | High | Needs research |
| QS05-OBS-004 | Procurement demonstrability | Medium-High | Needs research |
| QS05-OBS-005 | Symmetric agility coverage | Medium | Needs research |

Total: 5 findings (rapid audit scope, not count-targeted).

---

## 4. Cross-Entry Boundary Check

### QS04 <-> QS05

**Working boundary:**

QS04 focuses on cryptographic visibility, discovery, inventory, and
dependency context. QS05 focuses on the organisation's ability to change
cryptographic mechanisms safely and operationally, including governance.

QS04 can provide important inputs to QS05 (cMTTR is CBOM-bounded), but
QS05 is not simply a consumer of QS04 output. Some agility blockers are
visible without complete inventory (for example, hard-coded OIDs).

**Current status:** Provisional

---

### QS05 <-> QS06

**Working boundary:**

QS05 covers the ability and governance to change cryptography safely.
QS06 covers the security correctness of the migration or change itself -
including hybrid construction, fallback / downgrade, negotiation, and
implementation misuse.

Scenario #2 creates boundary pressure: an untested rotation path that
silently fails on pinned clients is partly agility failure and partly
migration / fallback failure. Resolution depends on reading QS06.

**Current status:** Provisional - needs QS06 read

---

### QS05 <-> QS07

**Working boundary:**

QS05 covers system and process-level agility. QS07 covers hardware-root
constraints that limit agility (firmware-locked primitives, non-updatable
trust anchors).

QS05 mentions "embedded devices with no tested path to receive firmware
updates that change cryptographic primitives". This touches QS07
territory. Resolution depends on reading QS07.

**Current status:** Provisional

---

## 5. Open Questions

### Q1

Is cMTTR already operationally defined in NIST CSWP 39upd1, or is QS05
introducing a new metric? If CSWP 39upd1 defines it, QS05 should cite the
definition. If not, QS05's framing is the primary source and should be
more precise.

### Q2

QS05 explicitly cross-references QS04 in the metric definition. Does QS04
cross-reference QS05 in the same way? If not, the reference is one-way
and should be balanced.

### Q3

Scenario #2: agility failure or migration failure? This determines which
entry owns the corresponding countermeasure.

### Q4

"Symmetric primitives are more quantum-resilient" - is this an accepted
technical position requiring citation (for example, Grover's algorithm
quadratic speedup implies doubling symmetric key sizes), or is it a
contextual statement?

---

## 6. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | Partial - cMTTR definition |
| Evidence complexity | No - references are current and strong |
| Cross-entry complexity | Partial - QS06 boundary |
| Actionability / evidence question | Yes - cMTTR, procurement demonstrability |
| Potential coherent contribution | Possibly - cMTTR operationalization |
| Financial-services relevance requiring further work | Possibly - procurement and governance angle |

### Decision

DEEP DIVE OPTIONAL / DEPENDS ON CROSS-ENTRY REVIEW

### Rationale

QS05 is the strongest entry reviewed so far. Findings are precision-level
and boundary-level, not structural. The cMTTR operationalization question
is the single most substantive potential contribution, but it needs to be
checked against NIST CSWP 39upd1 to determine whether it is genuinely a
gap or only under-cited in QS05.

---

## 7. Recommendation

NO DEEP DIVE at this time, with a deferred checkpoint after QS06 audit
and CSWP 39upd1 review.

QS05 is already well-constructed. The best contributions from this entry,
if any, will be targeted clarifications (cMTTR operationalization; QS05
<-> QS06 boundary) rather than a full revision.

Move on to QS06 rapid audit with two carry-forward questions:

- Scenario #2 boundary (QS05 <-> QS06)
- cMTTR definition check against CSWP 39upd1

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** Deferred - pending QS06 audit and CSWP 39upd1
review