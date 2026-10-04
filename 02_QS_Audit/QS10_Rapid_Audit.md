# QS10 - Rapid Audit

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

- Platform surface (third and final platform-surface entry)
- Research-driven character (Xu et al., CCS 2023)
- Explicit threat-model discipline (demonstrated vs future risk)
- Physical-access threat model vs remote tenant distinction
- Provider side-channel disclosure framework
- FIPS 140-3 and Common Criteria partial coverage
- Workload-level mitigation trade-offs
- QS08 and QS09 integration as platform-surface evidence model
- Financial-services relevance (regulated quantum cloud use)

Note: QS10 is the last active entry in the landscape (migration surface
QS01-QS07, platform surface QS08-QS10). After QS10, remaining work is
QSxx candidates and cross-entry boundary review.

---

## 2. Entry Summary

### Risk

Quantum computers depend on extensive classical control infrastructure -
signal generators, arbitrary waveform generators, mixers, FPGAs,
controller electronics, and control software - to translate circuits
into pulses that operate a QPU. Classical control signals can leak
information about the workload.

Xu et al. (CCS 2023) demonstrated timing, energy, and power-trace
attacks that identify circuits and circuit properties. Under the
strongest per-channel trace model, an attacker can reconstruct the
sequence of non-virtual gates.

The demonstrated threat model assumes physical access to the controller
(malicious data-centre insider). The authors state controller power data
is not currently exposed by cloud providers and describe a remote
extension as future risk. This is evidence of a controller-physical-
access and insider threat, not evidence that an ordinary remote tenant
can perform the attack today.

### Primary failure modes

- Controller electronics or their power, EM, or timing signals accessible
  to unauthorised personnel
- Controller telemetry and diagnostic traces collected or retained
  without access controls proportionate to the sensitivity of the
  workloads they describe
- Job-management, calibration, and controller-administration roles not
  separated or audited
- Providers do not document physical-access assumptions, telemetry
  exposure, or side-channel resistance of their control infrastructure
- Proprietary circuit structure or sensitive inputs/parameters encoded
  in circuit elements submitted without accounting for controller-side
  information leakage

### Primary actors

- Quantum platform providers (controller infrastructure)
- Malicious data-centre insiders (demonstrated threat)
- Future remote tenants (hypothetical, not demonstrated)
- Regulated entities consuming quantum platform services
- Third-party assurance / audit functions

### Main controls

- Restrict, monitor, audit physical access to controller electronics
- Minimise collection of controller power and timing telemetry; isolate
  monitoring interfaces; protect retained traces
- Enforce least privilege and role separation (job management,
  calibration, controller admin, telemetry access)
- Require providers to state their side-channel threat model and
  disclose controls protecting the controller plane
- Evaluate workload-level mitigations (duration / energy equalisation,
  logically equivalent circuit transformations) - noting trade-offs
- Avoid encoding sensitive values in circuit structure where possible

### Quantum-specific element

The failure modes are specific to quantum control infrastructure
(pulse-level operations, controller power signatures) and are not
transferable to classical computing without significant adaptation. The
threat model is unusually well-scoped: the demonstrated attack requires
physical access, and the entry does not overreach into remote-tenant
claims.

---

## 3. Findings

### QS10-OBS-001 - Entry quality and threat-model discipline (positive)

**Section:** Description, both Scenarios, Reference Links

**Observation:** QS10 is the most threat-model-disciplined entry
reviewed in this landscape. Distinctive features:

- Explicit distinction between demonstrated threat (physical insider)
  and future risk (remote extension)
- Explicit statement that "controller power data is not currently
  exposed by cloud providers"
- Both Scenarios include explicit caveats ("under the demonstrated
  threat model; remote tenant access is not assumed")
- FIPS 140-3 and Common Criteria are cited as "partial conceptual
  coverage" rather than as direct applicability
- Standards and Regulatory Mapping section explicitly states no formal
  standard covers this

This is a case study in how to scope a threat without overreach.

**Why it matters:** This entry's discipline should be preserved. It
contrasts with entries that risk overstating threat models, and its
approach could be a positive reference for future revisions.

**Evidence required:** None. Assessment observation.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Indirect - the discipline model is
relevant for regulated environment claims.

**Internal Review Priority:** Low (positive context)

**Disposition:** Note only

---

### QS10-OBS-002 - Provider side-channel disclosure framework is missing

**Section:** Common Example #4, Prevention item 4

**Observation:** Prevention item 4 states "Require providers to state
their side-channel threat model and disclose which physical and logical
controls protect the controller plane."

This is a strong requirement but does not provide a framework for what
constitutes adequate disclosure:

- What is the minimum disclosure set for a provider's side-channel
  threat model?
- Are there disclosure levels (e.g., analogous to FedRAMP transparency
  or Common Criteria protection profiles)?
- How would a customer verify that a provider's disclosure is
  complete and accurate?
- Does this disclosure interact with DORA Article 30 contractual
  arrangements (as in QS09's provider evidence model)?

**Why it matters:** This is the operational core of the entry's
guidance. Without a disclosure framework, the guidance cannot be
applied or audited consistently.

**Evidence required:** Provider attestation frameworks (FedRAMP, Common
Criteria protection profiles), DORA Article 30 alignment.

**Cross-entry overlap:** QS08 (provider isolation evidence), QS09
(provider assertion vs independent proof).

**Financial-services relevance:** High - regulated entities need a
defensible disclosure framework for supervisory purposes.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - contribution candidate if integrated
with QS08/QS09

---

### QS10-OBS-003 - Physical-access threat vs future remote-tenant threat - transition model absent

**Section:** Description, both Scenarios

**Observation:** The entry correctly frames the demonstrated threat as
physical-access-only and the remote extension as future risk. However,
the entry does not provide a model for:

- What would need to change for the remote-tenant threat to become
  real?
- Are there early-warning indicators that a provider is approaching
  this threshold?
- How should organisations monitor for this transition?
- What is the expected timeframe for this transition, if any?

This is a legitimate gap: the threat is currently narrow but the
boundary may shift, and organisations would benefit from knowing what
to watch.

**Why it matters:** Without a transition model, the entry provides a
snapshot of current exposure but not a way to anticipate change. This
is a real operational gap for organisations making 5-10 year
investment decisions on quantum cloud use.

**Evidence required:** Research on remote side-channel extension,
provider telemetry exposure roadmaps.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Medium - long-term investment
decisions.

**Internal Review Priority:** Medium

**Disposition:** Needs research - extension

---

### QS10-OBS-004 - Workload-level mitigation trade-offs noted but not modeled

**Section:** Prevention item 5

**Observation:** Prevention item 5 states "Evaluate workload-level
mitigations described by Xu et al. where appropriate, including
duration or energy equalisation and logically equivalent circuit
transformations. Test the security, fidelity, and performance
trade-offs: the paper notes that a defence against one metric may not
resist combined side channels."

This is accurate and correctly cautious. However, the entry does not
provide a decision model for:

- When duration equalisation is appropriate vs circuit transformation
- How to test against combined side channels
- What fidelity / performance cost is acceptable for different
  workload classes
- Whether workload-level mitigation is preferable to workload-level
  isolation or to workload-level non-submission

**Why it matters:** Workload-level mitigation is one of three response
options (alongside physical access control and provider disclosure
requirements). Without decision criteria, the guidance is not
actionable for practitioners choosing among them.

**Evidence required:** Xu et al. full text, follow-up research on
combined side-channel defenses.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Medium - trade-offs matter for
regulated proprietary workloads.

**Internal Review Priority:** Medium

**Disposition:** Needs research - extension

---

### QS10-OBS-005 - FIPS 140-3 and Common Criteria partial coverage correctly noted but not operationalized

**Section:** Reference Links, Standards and Regulatory Mapping

**Observation:** The entry correctly states that FIPS 140-3 provides
"partial conceptual coverage" and Common Criteria provides a "general
security-evaluation framework" without quantum-controller-specific
protection profiles. This is accurate and appropriately scoped.

However, the entry does not address:

- Whether quantum controller protection profiles are under development
  in any standards body
- Whether a FIPS 140-3 module validation covers any part of a QPU
  controller
- Whether Common Criteria protection profiles could be extended to
  quantum controllers
- What an organisation should ask a provider about FIPS 140-3 or
  Common Criteria certification for quantum controllers

**Why it matters:** FIPS 140-3 and Common Criteria are the standards a
regulated entity would naturally look for. The entry correctly notes
their partial coverage but does not guide the reader on how to use
what exists while waiting for quantum-specific profiles.

**Evidence required:** NIST CMVP current scope, Common Criteria
protection profile catalog.

**Cross-entry overlap:** QS07 (hardware roots, FIPS 140-3 relevance to
HSMs).

**Financial-services relevance:** Medium-High - regulated entities
expect FIPS 140-3 or Common Criteria evidence.

**Internal Review Priority:** Medium

**Disposition:** Needs research - extension

---

### QS10-OBS-006 - Standards and Regulatory Mapping TODO (pattern) - eighth instance

**Section:** Standards and Regulatory Mapping

**Observation:** Same pattern as QS03-OBS-019, QS04-OBS-039,
QS05-OBS-006, QS06-OBS-006, QS07-OBS-007, QS08-OBS-007, QS09-OBS-007.
The section carries the same TODO comment.

QS10-specific: the Standards and Regulatory Mapping section is the
shortest of any entry (three sentences). It correctly notes no formal
standard covers quantum-controller side channels, correctly scopes
FIPS 140-3 and Common Criteria as partial, but does not address DORA,
NIS2, or CRA applicability.

This is a notable difference from QS08 (DORA Article 28) and QS09
(DORA Articles 28-44 and CRA Annex I). QS10 does not mention any EU
regulatory context.

**Why it matters:** Eighth and final instance of the same pattern.
The landscape-wide TODO resolution can now proceed with a complete
picture: some entries (QS08, QS09) have regulatory context in the TODO
text, others (QS10) do not.

**Evidence required:** None - pattern observation.

**Cross-entry overlap:** QS03, QS04, QS05, QS06, QS07, QS08, QS09 -
same pattern.

**Financial-services relevance:** Medium - regulatory mapping
inconsistency noted.

**Internal Review Priority:** Medium

**Disposition:** Needs research - cross-entry pattern

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS10-OBS-001 | Entry quality and threat-model discipline (positive) | Low | Note |
| QS10-OBS-002 | Provider side-channel disclosure framework missing | Medium-High | Contribution candidate |
| QS10-OBS-003 | Physical-to-remote threat transition model absent | Medium | Needs research |
| QS10-OBS-004 | Workload-level mitigation trade-offs not modeled | Medium | Needs research |
| QS10-OBS-005 | FIPS 140-3 / Common Criteria operationalization | Medium | Needs research |
| QS10-OBS-006 | Standards and Regulatory Mapping TODO (pattern) | Medium | Needs research |

Total: 6 findings (rapid audit scope).

---

## 4. Carry-Forward Resolutions

### QS08 platform surface boundary carry-forward

**Question:** Does QS10 complete the platform-surface layer model?

**Resolution:** Yes. With QS08, QS09, and QS10 all reviewed, the
platform surface is now confirmable as a three-layer stack:

    QS09 - Toolchain layer (compiler, transpiler, scheduler,
                            dispatch, result record)
       ->
    QS08 - Execution layer (QPU multi-tenancy, tenant isolation,
                            qubit reset)
       ->
    QS10 - Infrastructure layer (controller electronics, physical
                                  access, telemetry)

This three-layer model is a distinct finding from the platform-surface
review that should be documented in REVIEW_METHODOLOGY.md.

---

### QS09 integrity chain carry-forward

**Question:** Does QS10 relate to the QS09 integrity-chain contribution
candidate?

**Resolution:** No direct overlap. QS09 addresses integrity (artifact
identity across transformation). QS10 addresses confidentiality
(workload information leakage through physical channels).

They are complementary but distinct:

- QS09: "Was the correct artifact dispatched and returned?"
- QS10: "Did the workload leak information through physical side
  channels?"

Both contribute to a unified platform-surface evidence model but
address different threat properties.

---

### QS08 isolation evidence carry-forward

**Question:** Does QS10 integrate with the QS08 isolation evidence
contribution candidate?

**Resolution:** Yes, structurally. Both QS08 and QS10 require
provider-disclosed evidence for platform security properties:

- QS08: provider evidence for tenant isolation
- QS10: provider disclosure of side-channel threat model and controls

A unified platform-surface provider evidence model could span QS08,
QS09, and QS10 - each contributing a layer-specific evidence
requirement.

---

### QS05 cMTTR Question

**Already resolved in QS06 audit.** QS10 does not add new evidence.

---

### Migration-surface carry-forwards

**Not applicable to QS10** (platform surface is a separate track).

---

## 5. Cross-Entry Boundary Check

### QS08 <-> QS10

**Working boundary:** QS08 covers multi-tenant QPU isolation (logical
separation in the execution layer). QS10 covers controller-side
side-channel exposure (physical access and telemetry in the
infrastructure layer).

Both concern information leakage in shared platforms but from different
layers:

- QS08: tenant-to-tenant leakage via crosstalk and qubit reset
- QS10: insider-to-workload leakage via controller telemetry

**Current status:** Established within current review - different
layers, complementary

---

### QS09 <-> QS10

**Working boundary:** QS09 covers toolchain and dispatch pipeline
integrity. QS10 covers physical infrastructure confidentiality.

QS09 concerns correctness and integrity of the workload transformation.
QS10 concerns confidentiality of the workload through physical side
channels.

**Current status:** Established within current review - different
properties, complementary

---

### QS10 <-> QS07

**Working boundary:** QS07 covers hardware roots of trust in migration
context (TPM, UEFI, HSM). QS10 covers physical side-channel exposure
in quantum platform context.

Both involve hardware but with distinct scopes. QS07 is about
cryptographic anchors that need migration. QS10 is about physical
properties of quantum control infrastructure.

**Current status:** Independent

---

### QS10 <-> QS01

**Working boundary:** QS01 covers confidentiality HNDL exposure in
classical data collection. QS10 covers confidentiality exposure of
quantum workloads through physical side channels.

Different threat models (classical data vs quantum workload), different
exposure mechanisms (cryptographic vs physical). No direct overlap.

**Current status:** Independent

---

## 6. Open Questions

### Q1

What is the minimum provider side-channel disclosure that a regulated
entity should require for quantum cloud use? Is this a contractual
requirement (DORA Article 30), a procurement requirement, or both?

### Q2

What early-warning indicators would suggest that the remote-tenant
side-channel threat is becoming real, and how should organisations
monitor for this transition?

### Q3

Should the unified platform-surface provider evidence model (spanning
QS08, QS09, QS10) be developed as a cross-entry contribution, or should
each entry retain its own provider evidence framework?

### Q4

How should REVIEW_METHODOLOGY.md represent the three-layer platform
surface model now that QS08, QS09, and QS10 are all reviewed?

---

## 7. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | No - entry is clear and disciplined |
| Evidence complexity | No - well-cited (Xu et al., CCS 2023) |
| Cross-entry complexity | Yes - platform surface three-layer model |
| Actionability / evidence question | Yes - provider disclosure framework |
| Potential coherent contribution | Partial - provider disclosure framework integrated with QS08/QS09 |
| Financial-services relevance requiring further work | Yes - regulated quantum cloud use |

### Decision

DEEP DIVE OPTIONAL - but should be pursued as a cross-entry contribution
rather than a QS10-only deep dive.

### Rationale

QS10 in isolation does not warrant a standalone deep dive. The entry is
well-scoped and disciplined, and its findings are precision-level and
extension-level rather than structural.

However, QS10 is the third and final entry in a coherent platform-
surface cluster (QS08, QS09, QS10) that collectively points to a
**unified platform-surface provider evidence model** as a cross-entry
contribution candidate. Each entry contributes a distinct evidence
requirement:

- QS08: provider evidence for tenant isolation
- QS09: provider evidence for toolchain integrity and integrity-linked
  result records
- QS10: provider disclosure of side-channel threat model and physical
  controls

The deep dive should therefore be a **cross-entry platform-surface
contribution** rather than a QS10-specific deep dive.

---

## 8. Recommendation

NO QS10-SPECIFIC DEEP DIVE. Instead, note a cross-entry contribution
candidate: unified platform-surface provider evidence model spanning
QS08, QS09, and QS10.

Recommended cross-entry contribution focus:

- Structured platform-surface provider evidence framework
- QS08 (tenant isolation evidence) + QS09 (integrity chain evidence) +
  QS10 (side-channel disclosure) as three layers of a unified model
- Alignment with DORA Articles 28-44 and CRA Annex I
- Three-layer platform surface representation in REVIEW_METHODOLOGY.md

Carry-forward to full-landscape review:

- Platform-surface three-layer model should be documented in
  REVIEW_METHODOLOGY.md (toolchain / execution / infrastructure)
- Standards and Regulatory Mapping TODO resolution should now proceed
  as a landscape-wide pass (8 instances confirmed)
- Cross-entry contribution candidates at landscape level:
  - QS09 integrity chain (integrity)
  - QS08 + QS10 provider evidence (confidentiality / isolation)
  - QS04 + QS05 + QS06 operational verification methodology
  - QS07 hardware re-anchoring methodology
  - QS04 + QS05 + QS06 + QS07 migration lifecycle

Next: QSxx candidate audit (4 candidates).

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** NO QS10-SPECIFIC DEEP DIVE - cross-entry
platform-surface provider evidence model preferred
**Carry-forward:** Platform-surface three-layer model confirmed;
unified provider evidence model identified as cross-entry contribution
candidate; all 9 active entries (QS01, QS03-QS10) now reviewed