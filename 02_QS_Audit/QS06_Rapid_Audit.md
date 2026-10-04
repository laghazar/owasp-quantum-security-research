# QS06 - Rapid Audit

## 1. Scope & Method

Reviewed:

- Description
- Common Examples of Vulnerability
- How to Prevent
- Example Attack Scenarios
- Reference Links
- Standards and Regulatory Mapping

This is a rapid landscape review, not a forensic reference or regulatory
audit.

Special focus:

- Construction risk
- Negotiation / deployment risk
- Implementation risk
- QS05 boundary (carry-forward from QS05-OBS-003)
- QS01 HNDL relationship (fallback downstream exposure)
- Standardized vs custom hybrid constructions
- Fallback and downgrade behaviour
- Operational verification of hybrid deployment
- NIST CSWP 39upd1 targeted read for QS05 cMTTR question

---

## 2. Entry Summary

### Risk

Hybrid cryptography is the practical migration pattern: a construction that
combines a classical algorithm with a PQC algorithm so that breaking the
combination requires breaking both. The risks of getting hybrid wrong
concentrate in three distinct layers that are often conflated:

- Construction risk (custom combiners vs standardised ones)
- Negotiation and deployment risk (configuration, operations, fallback
  behaviour)
- Implementation risk (timing side channels, compiler-introduced leaks,
  pre-standard drafts)

### Primary failure modes

- Custom hybrid combiners that discard the defence-in-depth property
  (selection or XOR instead of KDF over both inputs)
- Endpoint fallback logic that answers a failed hybrid handshake with a
  fresh classical-only attempt (non-conformant TLS 1.3 behaviour)
- Hybrid enabled in configuration but never verified as negotiated in
  production
- Middlebox and fragmentation pressure leading operators to disable hybrid
  to restore service
- Pre-standard Kyber / Dilithium drafts still in production after ML-KEM
  and ML-DSA superseded them
- PQC implementation flaws (KyberSlash timing leak, Clangover compiler
  optimisation)
- Hybrid treated as a destination rather than an interim state

### Primary actors

- Protocol implementers (construction correctness)
- Operators (deployment, fallback policy, middlebox configuration)
- Security architects (monitoring, verification, migration lifecycle)
- Application teams (client fallback logic in applications)
- Regulators (standalone-classical prohibition after 2030 for high-risk
  cases)

### Main controls

- Adopt standard named hybrid groups via maintained libraries
  (X25519MLKEM768, SecP256r1MLKEM768, SecP384r1MLKEM1024)
- Where custom combiners are unavoidable, KDF over both inputs
- Monitor negotiated group in production, alert on classical-only
  handshakes
- Test fallback behaviour explicitly (fail closed where policy requires)
- Pilot for handshake size and middlebox behaviour before rollout
- Use validated constant-time implementations, not reference code
- Track PQC implementation advisories
- Verify ML-KEM / ML-DSA parameter sets, not pre-standard drafts
- Record hybrid deployments as a transitional inventory
- Plan pure-PQC replacement ahead of regulatory deadlines

### Quantum-specific element

Hybrid is an interim state rather than a destination. PQC parameter sets are
still evolving, and pre-standard draft implementations are dangerous.
Standalone quantum-vulnerable public-key cryptography is prohibited after
2030 for high-risk use cases under the EU roadmap.

---

## 3. Findings

### QS06-OBS-001 - Entry quality and analytical model (positive)

**Section:** Description, all sections

**Observation:** QS06 is the strongest entry reviewed so far for analytical
clarity. Distinctive features:

- Explicit three-layer model (construction / negotiation-deployment /
  implementation) that resists conflation
- Precise distinction between in-handshake tampering (resistant under
  RFC 8446) and endpoint fallback behaviour (the actual exposure)
- Explicit framing of hybrid as interim rather than destination
- Governance-relevant axis: "configured but unobserved is indistinguishable
  from not working"
- Concrete attack scenario (Scenario #1) that describes a well-defined
  post-handshake fallback attack

**Why it matters:** This entry's structure should be preserved. Rapid audit
findings are precision-level and boundary-level, not structural.

**Evidence required:** None. Assessment observation.

**Cross-entry overlap:** None directly. The three-layer model is a strength.

**Financial-services relevance:** Indirect - the operational and governance
framing aligns with regulated-sector expectations.

**Internal Review Priority:** Low (positive assessment)

**Disposition:** Note only

---

### QS06-OBS-002 - Fallback semantics distinction is strong but creates QS05 boundary pressure

**Section:** Description paragraph 3, Common Example #1 and #2,
Scenario #1

**Observation:** QS06 explicitly distinguishes:

- In-handshake tampering (resistant - transcript authentication)
- Endpoint fallback that retries classical-only (the actual exposure)
- Non-conformant TLS 1.3 behaviour (standard client does not retract
  offered groups)

This is precise and technically correct. But it also redefines what
constitutes the "fallback failure". In QS05 Scenario #2, the fallback was
framed as an agility failure (untested rotation path). In QS06, it is
framed as a deployment / migration failure (non-conformant fallback
behaviour).

Both framings are legitimate but they describe the same underlying
scenario from different angles. Resolution: QS05 owns the capability
question (was the rotation path ever tested?), QS06 owns the execution
question (what does the endpoint do when negotiation fails?).

**Why it matters:** This resolves QS05-OBS-003. The two entries are
complementary, not conflicting.

**Evidence required:** None - this is a boundary clarification.

**Cross-entry overlap:** QS05 Scenario #2 <-> QS06 Scenario #1

**Financial-services relevance:** Medium - relevant wherever hybrid TLS
is being deployed in regulated environments.

**Internal Review Priority:** High

**Disposition:** Resolves QS05-OBS-003

---

### QS06-OBS-003 - "Configured but unobserved" as an operational verification axis

**Section:** Description paragraph 3, Common Example #3,
Prevention item 2

**Observation:** The entry states: "hybrid that is configured but
unobserved is indistinguishable from hybrid that is not working."

This is a strong operational observation and could be developed further.
The implicit lifecycle is:

    Configured
       ->
    Supported
       ->
    Negotiable
       ->
    Successfully negotiated
       ->
    Continuously monitored

QS06 covers the middle of this chain well (monitoring the negotiated
group). But the entry does not explicitly address:

- How often negotiation should be sampled
- Whether the observation should be per-session, per-connection, or
  per-estate
- What threshold of classical-only handshakes should trigger an alert
- How the "configured but unobserved" risk interacts with QS04's CBOM
  visibility boundary

**Why it matters:** This is a coherent operational verification problem.
It sits between QS04 (inventory) and QS06 (execution) and could be a
contribution candidate.

**Evidence required:** None obvious - definitional gap.

**Cross-entry overlap:** QS04 (visibility boundary), QS05 (measurement
methodology - cMTTR)

**Financial-services relevance:** High - continuous monitoring is a
supervisory expectation.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research

---

### QS06-OBS-004 - Middlebox / operator pressure as a governance failure mode

**Section:** Description paragraph 3, Common Example #4,
Prevention item 4, Scenario #3

**Observation:** QS06 describes an incident-pressure failure mode:
larger PQC handshakes are fragmented or dropped by middleboxes, operators
disable hybrid to restore service, and the change is never revisited.

Scenario #3 describes this well: "the estate is recorded as migrated, and
an attacker harvests traffic from a segment that reverted to classical
key exchange months earlier."

This is a governance failure (emergency change never reviewed) more than
a technical failure. The entry frames it as an operational risk.

**Why it matters:** This failure mode is structurally similar to QS05
Scenario #3 (no accountable owner watching triggers). It suggests a
cross-entry pattern: silent long-term exposures caused by short-term
operational decisions that are never reconciled with the security
posture.

**Evidence required:** None - definitional observation.

**Cross-entry overlap:** QS05 Scenario #3 (governance / silent exposure)

**Financial-services relevance:** High - emergency rollback decisions
under availability pressure are common in regulated environments.

**Internal Review Priority:** Medium

**Disposition:** Needs research - possibly a cross-entry observation

---

### QS06-OBS-005 - Pre-standard Kyber / Dilithium lifecycle handling overlaps QS04

**Section:** Common Example #7, Prevention item 6

**Observation:** QS06 warns that deployments still running pre-standard
Kyber or Dilithium drafts are running superseded algorithms, and that
weak parameter selection (ML-KEM-512 where ML-KEM-768 is required) is a
risk.

This is technically correct but the ownership boundary is not fully
clear. Pre-standard drafts are an inventory problem (they should be
recorded as superseded in the CBOM, per QS04) and a migration problem
(they should be replaced, per QS06).

QS06 handles the "should be replaced" aspect. QS04 handles "should be
recorded correctly in inventory". The interface between them is not
explicit.

**Why it matters:** This is a boundary observation, not a
recommendation. The two entries should cross-reference each other.

**Evidence required:** Verify whether QS04 mentions pre-standard PQC
drafts in its inventory scope.

**Cross-entry overlap:** QS04 (inventory of superseded algorithms)

**Financial-services relevance:** Medium - depends on QS04 boundary.

**Internal Review Priority:** Medium

**Disposition:** Needs research

---

### QS06-OBS-006 - Standards and Regulatory Mapping TODO unresolved

**Section:** Standards and Regulatory Mapping

**Observation:** Same pattern as QS03, QS04, QS05 - the Standards and
Regulatory Mapping section carries the same TODO comment:

"TODO: This section is carried over from the source document and is not
part of _template.md. Confirm whether to keep it in the final entry
format, and verify each standard/citation."

NIS2 and DORA references appear in this section without scope
qualification.

**Why it matters:** Consistency - this is the same structural issue
already identified in QS03-OBS-019, QS04-OBS-039, and the QS05 rapid
audit. The QS landscape would benefit from a consistent resolution.

**Evidence required:** None - pattern observation.

**Cross-entry overlap:** QS03, QS04, QS05 - same pattern.

**Financial-services relevance:** Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - cross-entry pattern

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS06-OBS-001 | Entry quality (positive) | Low | Note |
| QS06-OBS-002 | Fallback semantics QS05 boundary | High | Resolves QS05-OBS-003 |
| QS06-OBS-003 | "Configured but unobserved" verification axis | Medium-High | Needs research |
| QS06-OBS-004 | Middlebox / operator governance failure mode | Medium | Needs research |
| QS06-OBS-005 | Pre-standard Kyber / Dilithium lifecycle overlap | Medium | Needs research |
| QS06-OBS-006 | Standards and Regulatory Mapping TODO | Medium | Needs research |

Total: 6 findings (rapid audit scope, not count-targeted).

---

## 4. Carry-Forward Resolutions

### QS05-OBS-003 / QS05-QS06 Boundary

**Question:** Does the current QS06 scope fully define the boundary
between crypto-agility failure and migration/deployment failure when an
endpoint fails hybrid negotiation and retries classically?

**QS05 interpretation:** Untested rotation path is an agility failure.
The abstraction layer existed but was never exercised.

**QS06 interpretation:** Endpoint fallback behaviour that retries
classical-only is a migration / deployment failure. Standard TLS 1.3
does not retract offered groups, so the fallback is a non-conformant
endpoint behaviour.

**Current resolution:** Resolved - complementary, not conflicting.

- QS05 owns the capability question (was the rotation path ever
  tested? Is there an accountable owner? Is the agility measurable?)
- QS06 owns the execution question (what does the endpoint do when
  negotiation fails? Is the fallback conformant? Is fallback policy
  enforced?)

Both entries could legitimately reference the same scenario from their
respective angles. Cross-reference is appropriate but duplication is not
necessary.

**Evidence:** QS05 Scenario #2, QS06 Scenario #1, RFC 8446 Section 4.1.3
and transcript authentication, QS06 Prevention item 3 (test fallback
behaviour).

---

### QS05 cMTTR Question

**Question:** Does NIST CSWP 39upd1 provide an operational definition or
standardised measurement model equivalent to the cMTTR concept used in
QS05?

**Finding:** NIST CSWP 39upd1 does not define cMTTR specifically. The
final CSWP 39upd1 (29 June 2026) addresses crypto agility through:

- Section 5 (strategic plan for managing organisations' crypto risks):
  references "crypto agility KPIs" and mentions "time, cost, and ease to
  migrate" as KPI dimensions, but does not define a specific metric
- Section 6.5 (Maturity Assessment for Crypto Agility): introduces a
  four-tier maturity model adapted from the NIST Cybersecurity
  Framework, with tiers Partial / Risk-Informed / Repeatable / Adaptive
- Tier 4 (Adaptive) explicitly states that "crypto agility is monitored,
  measured, and reported to executives as part of the risk register"

**Impact on QS05:** The QS05 cMTTR concept is consistent with but more
granular than NIST CSWP 39upd1. NIST provides the maturity framework
and the KPI concept but does not define a specific metric like cMTTR.

**Implication:**

- QS05's cMTTR is not contradicting NIST - it is a more specific
  operationalisation than NIST provides
- This is potentially a substantive contribution opportunity (a metric
  that operationalises NIST's KPI framing)
- However, the framing should be adjusted: cMTTR should be presented as
  an operational metric consistent with NIST CSWP 39upd1's maturity
  model, not as a novel metric

**Recommendation for QS05:** Update QS05-OBS-002 disposition to reflect
that NIST does not define cMTTR but provides a compatible maturity
framework. The QS05 cMTTR framing may need a cross-reference to NIST
CSWP 39upd1 for context.

---

## 5. Cross-Entry Boundary Check

### QS04 <-> QS05

**Working boundary:** QS04 focuses on cryptographic visibility,
discovery, inventory, and dependency context. QS05 focuses on the
capability and governance required to change cryptographic mechanisms
safely.

**Current status:** Established within current review

---

### QS05 <-> QS06

**Working boundary:** QS05 focuses on the capability and governance to
change cryptographic mechanisms safely. QS06 focuses on the security
correctness of the migration or hybrid deployment.

QS05 owns: has the rotation path been tested? Is there an accountable
owner? Is the agility measurable?

QS06 owns: what does the endpoint do when negotiation fails? Is the
fallback conformant? Is the fallback policy enforced?

**Current status:** Established within current review - resolved by
QS06-OBS-002

---

### QS06 <-> QS01

**Working boundary:** A session downgraded today is a session harvested
today. QS06 owns the migration / deployment failure that enables the
downgrade. QS01 owns the confidentiality HNDL exposure that follows.

QS06 Scenario #1 explicitly acknowledges this relationship: "The
attacker records that session for decryption once a CRQC exists."

**Current status:** Provisional - cross-reference confirmed but full
boundary not yet drafted

---

### QS06 <-> QS07

**Working boundary:** QS06 covers hybrid deployment at the protocol /
endpoint layer. QS07 covers hardware-root constraints that limit
cryptographic migration, including PQC-capable hardware availability.

QS06 mentions PQC handshake size as a deployment challenge. QS07
territory includes hardware acceleration for PQC and firmware support
for PQC parameter sets.

**Current status:** Provisional

---

## 6. Open Questions

### Q1

Does the "configured but unobserved" axis (QS06-OBS-003) represent a
distinct contribution, or is it adequately covered by QS04 CBOM
visibility plus QS06 monitoring guidance? Resolution requires reading
QS04's coverage of continuous verification.

### Q2

Should the "silent operational decision never revisited" pattern
(QS06-OBS-004, parallel to QS05 Scenario #3) be treated as a cross-entry
observation, or does each entry own its own version?

### Q3

Where should pre-standard Kyber / Dilithium draft handling live - QS04
(inventory of superseded algorithms) or QS06 (replacement requirement)?
Currently each entry handles a piece.

### Q4

Should the Standards and Regulatory Mapping TODO resolution be done per-
entry or as a landscape-wide consistency pass? The same pattern appears
in QS03, QS04, QS05, QS06.

---

## 7. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | No - entry is clear |
| Evidence complexity | Partial - KyberSlash, Clangover, RFC 9945/9954 need verification |
| Cross-entry complexity | Yes - QS05 boundary resolved but QS01/QS07 boundaries open |
| Actionability / evidence question | Partial - "configured but unobserved" verification gap |
| Potential coherent contribution | Partial - cMTTR cross-reference, monitoring methodology |
| Financial-services relevance requiring further work | Partial |

### Decision

DEEP DIVE OPTIONAL / DEPENDS ON CROSS-ENTRY REVIEW

### Rationale

QS06 is a well-constructed entry. The three-layer analytical model is
strong. Findings are precision-level and boundary-level, not structural.

The most substantive item is the resolved QS05 boundary - it does not
require deep dive because both entries already treat their respective
aspects. The cMTTR observation from QS05 is now clarified (NIST does not
define cMTTR specifically), which reduces the QS05 deep-dive pressure.

QS06 itself does not present a compelling deep-dive trigger at the
rapid audit level. However, the interaction between QS04 (inventory),
QS05 (agility), and QS06 (deployment) suggests that a cross-entry
"operational verification methodology" could be a contribution candidate
if developed across all three entries rather than within QS06 alone.

---

## 8. Recommendation

NO DEEP DIVE for QS06 at this time.

QS06 is already well-constructed. Its findings are precision-level,
boundary-level, and cross-entry-level rather than structural.

Carry-forward to later full-landscape review:

- Whether an "operational verification methodology" contribution
  spanning QS04 / QS05 / QS06 is warranted
- Whether the "silent operational decision never revisited" pattern is a
  cross-entry observation
- Whether the Standards and Regulatory Mapping TODO should be resolved
  per-entry or as a landscape-wide pass

Move on to QS07 rapid audit with cross-entry focus on the QS06 <-> QS07
boundary (hardware-root constraints for hybrid deployment).

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** NO DEEP DIVE - well-constructed entry
**Carry-forward:** QS05-OBS-003 resolved; QS05 cMTTR clarified (NIST
does not define cMTTR); QS06 <-> QS01, QS06 <-> QS07 boundaries
provisional