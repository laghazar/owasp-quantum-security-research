# QS09 - Rapid Audit

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

- Platform surface (second platform-surface entry after QS08)
- Research-driven character (multiple peer-reviewed papers 2021-2025)
- Three attack classes (compiler, config, pulse-level)
- Submitted-to-dispatch-to-result integrity chain
- Provider-assertion vs independent-proof distinction
- SLSA and RFC 9334 (RATS) applicability
- DORA Articles 28-44 scope precision
- CRA Annex I applicability qualification
- Financial-services relevance (regulated use of quantum platform
  services)

Note: QS09 is technically the densest entry reviewed so far. The
integrity-chain concept (submitted -> transformed -> dispatch -> result)
is a novel operational framing that may be a distinct contribution
candidate.

---

## 2. Entry Summary

### Risk

A submitted quantum job is not just a circuit - it flows through a
compiler, transpiler, and pulse-level scheduler before reaching
hardware, and each layer is a potential point of compromise. Quantum
software stacks compose high-level frameworks (Qiskit, Cirq, PennyLane),
transpilers, optimising compilers, pulse-level schedulers, and hardware
configuration files.

Three attack classes are documented:

- **Compiler compromise**: circuit theft via compromised compilers
  (Suresh et al., HASP 2021). Circuits encode data hardcoded as
  parameters, so theft of the circuit is theft of both the algorithm
  and its inputs.
- **Configuration manipulation**: QTrojan (Chu et al., 2023). Adversaries
  stealthily disable data encoding inside a circuit by manipulating
  hardware configuration files disguised as routine pulse calibrations.
- **Pulse-level interface abuse**: Xu and Szefer (IEEE S&P 2025). No
  compromised component needed - the interface between a circuit's
  gate-level description and its pulse-level implementation is not
  validated. Malicious custom gate definitions (qubit plunder, qubit
  block, qubit reorder, timing/frequency/phase/waveform mismatch).

Additionally, the entry addresses a fourth concern that spans all
three: integrity continuity across transformation and dispatch. A
stable user-facing job identifier alone does not establish that the
submitted circuit and parameters remain integrity-linked to:

- the security-relevant transformed artifact dispatched for execution
- the platform-reported backend and execution context
- the returned result record

### Primary failure modes

- Toolchains composed of multiple open-source and vendor components
  with limited integrity verification between stages
- Circuits encoding sensitive data as hardcoded parameters
- Calibration and pulse-configuration pipelines with weak
  authentication or no change auditing
- Production toolchains that auto-update without integrity verification
- Pulse and hardware configuration files treated as routine rather
  than sensitive operations surface
- Stable job identifiers without integrity-protected linkage across
  the transformation chain
- Custom gate definitions imported from shared libraries whose pulse
  behaviour is never checked against gate-level specification
- SDKs that accept pulse-level definitions without validating them
  against declared gate semantics

### Primary actors

- Quantum platform providers (toolchain, scheduler, calibration)
- Malicious co-tenants or supply-chain adversaries
- Tenant organisations running IP-sensitive workloads
- Third-party toolchain and library maintainers
- Regulated entities consuming quantum platform services (DORA context)

### Main controls

- Software supply-chain hygiene for quantum toolchains (signed
  releases, verified dependencies, reproducible builds)
- Pin specific versions of compilers and transpilers; no auto-update
- Restrict and audit hardware configuration and pulse calibration
- Provider transparency on toolchain integrity controls
- Integrity-protected provenance binding submitted job -> transformed
  artifact -> dispatch context -> result record
- Content digests, authenticated references, or verifiable commitments
  for artifacts that cannot be disclosed
- Dispatch-boundary verification of the exact artifact against declared
  policy
- Authenticated result records that distinguish provider assertion
  from independent proof
- Pulse-level validation against gate-level specification
- Treat custom gate definitions as untrusted input

### Quantum-specific element

The failure modes are specific to quantum toolchains: circuit-as-data
encoding, pulse-level gate semantics, qubit topology and calibration
state, and the transformation chain between high-level framework and
hardware dispatch. These are not transferable to classical software
supply chains without adaptation.

---

## 3. Findings

### QS09-OBS-001 - Entry quality and technical density (positive)

**Section:** All sections

**Observation:** QS09 is the most technically dense and operational
entry reviewed so far. Distinctive features:

- Three well-defined attack classes, each with peer-reviewed evidence
- A fourth spanning concern (integrity continuity) that reframes the
  whole entry
- Detailed operational Prevention section (11+ items) that goes beyond
  guidance into engineering specification
- Explicit distinction between provider assertion and independent
  proof
- Correct use of RFC 9334 (RATS) as a generic attestation architecture
- Correct use of SLSA as a generic supply-chain provenance model
- Correct scoping of DORA Articles 28-44 (not just one article)
- Explicit qualification of CRA Annex I applicability

**Why it matters:** This entry's operational depth should be preserved.
Rapid audit findings are precision-level, boundary-level, and
integration-level rather than structural.

**Evidence required:** None. Assessment observation.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** High - regulated entities consuming
quantum platform services.

**Internal Review Priority:** Low (positive context)

**Disposition:** Note only

---

### QS09-OBS-002 - Submitted-to-dispatch-to-result integrity chain is a distinct contribution candidate

**Section:** Description final paragraph, Common Example #6,
Prevention items 6-8, Scenario #3

**Observation:** The entry identifies an integrity-chain problem that
is distinct from the three named attack classes:

"A stable user-facing job identifier alone does not establish that the
submitted circuit and parameters remain integrity-linked to the
security-relevant transformed artifact dispatched for execution, the
platform-reported backend and execution context, and the returned
result record."

This is developed in:

- Prevention item 6 (integrity-protected provenance)
- Prevention item 7 (dispatch-boundary verification)
- Prevention item 8 (authenticated result record)
- Scenario #3 (cache substitution with preserved job identifier)

The chain spans four artifacts:

    Submitted circuit + parameters
       ->
    Security-relevant transformed artifact + toolchain configuration
       ->
    Dispatch artifact + platform context (backend, topology,
       calibration state)
       ->
    Returned result record

The entry explicitly distinguishes provider-generated records from
independent proof. This is epistemically careful and technically
correct.

**Why it matters:** This integrity chain is a coherent operational
framework that is not yet a deployed quantum-platform standard (the
entry notes this explicitly). It has concrete anchors (SLSA, RFC 9334)
and direct applicability to regulated use (DORA Articles 28-44).

**Evidence required:** Confirm whether any provider already implements
end-to-end binding across the full four-artifact chain (not just
identifier preservation).

**Cross-entry overlap:** QS09 platform surface only.

**Financial-services relevance:** High - DORA Articles 28-44 third-party
ICT risk obligations and contractual evidence expectations.

**Internal Review Priority:** High

**Disposition:** Contribution candidate - needs research

---

### QS09-OBS-003 - Provider assertion vs independent proof distinction is strong but underdeveloped

**Section:** Prevention item 8

**Observation:** The entry states:

"Treat a provider-generated record as a provider assertion; do not
represent it as independent proof of physical QPU execution,
computational correctness, or result fidelity."

This distinction is epistemically strong and is arguably the most
important line in the whole entry. It separates:

- What the provider asserts (backend used, job dispatched, result
  returned)
- What the tenant can independently verify (content digests,
  signature verification, dispatch-boundary checks)
- What cannot be independently verified without physical QPU access
  (physical execution, computational fidelity)

However, the entry does not develop this distinction into a model:

- What claims can be independently verified vs only asserted?
- What provider evidence packages could shift assertion into verified?
- How does the RFC 9334 (RATS) Attester / Verifier / Relying Party
  model apply to this distinction?
- What is the trust boundary within which the provider assertion is
  evaluated?

**Why it matters:** This distinction underpins the entry's whole
security model. Developing it into a structured claim-classification
framework would strengthen both the entry and its operational
applicability.

**Evidence required:** RFC 9334 RATS architecture, provider attestation
capabilities.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** High - DORA evidence expectations
depend on this distinction.

**Internal Review Priority:** High

**Disposition:** Needs research - contribution candidate

---

### QS09-OBS-004 - Three attack classes could be tabulated but current structure is adequate

**Section:** Description, Common Examples

**Observation:** The three named attack classes have different trust
models:

| Class | Compromised component | Trust failure |
|---|---|---|
| Compiler theft | Compiler / transpiler | Integrity of toolchain |
| QTrojan | Configuration file | Integrity of calibration |
| Pulse-level interface | Custom gate definition | Trust of untrusted input |

These classes share the pipeline but differ in the trust boundary that
fails. The entry describes them clearly in prose but does not tabulate
them. A table would help readers distinguish the trust model that each
class exploits.

**Why it matters:** Tabulation is not required for the entry to be
correct, but it would improve clarity and support the "trust boundary"
framing that Prevention item 9 (custom gates as untrusted input)
implies.

**Evidence required:** None. Structural observation.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Indirect.

**Internal Review Priority:** Low-Medium

**Disposition:** Note only - editorial suggestion

---

### QS09-OBS-005 - SLSA and RFC 9334 anchors are correct but not operationalized

**Section:** Reference Links, Prevention items 6-8

**Observation:** The entry correctly cites:

- SLSA as a supply-chain provenance model applicable "in spirit"
- RFC 9334 (RATS) as a generic attestation architecture

Both anchors are accurate but the entry does not operationalize them:

- Which SLSA provenance level is required for a quantum toolchain?
  (SLSA Level 1-4 have progressively stronger integrity properties.)
- How does the RFC 9334 Attester / Verifier / Relying Party model map
  to the QS09 four-artifact chain?
- What is the equivalent of "Attestation Results" for a quantum job
  result?
- Where does the trust boundary lie between provider, tenant, and any
  independent verifier?

**Why it matters:** The generic anchors are correct but the gap between
them and the operational chain is currently filled by the reader's
interpretation. Explicit mapping would make the entry more actionable.

**Evidence required:** SLSA specification, RFC 9334 full text.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Medium-High.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - extension

---

### QS09-OBS-006 - DORA Articles 28-44 scope is accurate but could distinguish Article 30

**Section:** Reference Links, Standards and Regulatory Mapping

**Observation:** The entry cites "EU DORA - Regulation (EU) 2022/2554,
Articles 28-44: Establishes ICT third-party risk-management obligations
relevant when regulated financial entities rely on quantum platform
services."

This is more precise than earlier entries (QS01/QS03 cited Article 9
only; QS04/QS05/QS06/QS07/QS08 cited with varying precision). The
Articles 28-44 scope correctly covers:

- Article 28: General principles of ICT third-party risk
- Article 29: Concentration risk
- Article 30: Contractual arrangements
- Articles 31-44: Oversight framework

However, the entry does not distinguish which articles matter most for
the QS09 integrity chain. For the integrity chain specifically:

- Article 30 (contractual arrangements) directly supports the
  requirement to obtain provider evidence
- Article 28 (general principles) supports the requirement to assess
  the provider's integrity controls

**Why it matters:** The same pattern noted in QS01-OBS-028 (DORA RTS
Article 6) and QS03-OBS-038 (DORA Article 30 emphasis). QS09 should
make the same distinction.

**Evidence required:** DORA Regulation text, Articles 28 and 30.

**Cross-entry overlap:** QS01, QS03, QS04, QS06, QS07, QS08 all cite
DORA.

**Financial-services relevance:** High.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - scope refinement

---

### QS09-OBS-007 - Standards and Regulatory Mapping TODO (pattern) - most detailed of all entries

**Section:** Standards and Regulatory Mapping

**Observation:** Same pattern as QS03-OBS-019, QS04-OBS-039,
QS05-OBS-006, QS06-OBS-006, QS07-OBS-007, QS08-OBS-007. The section
carries the same TODO comment.

However, QS09 has the most detailed TODO text of any entry:

- Explicitly states no formal standard covers end-to-end quantum
  toolchain integrity
- Distinguishes quantum-specific work (Suresh, Chu, Xu) from generic
  frameworks (SLSA, RFC 9334)
- Notes that SLSA and RFC 9334 have "not been adapted to quantum
  stacks"

This is more substantive than the TODOs in other entries, which mostly
just note the pattern. QS09's TODO is close to being a resolved
Standards and Regulatory Mapping section already.

**Why it matters:** Seventh instance of the same pattern, but the
first instance where the TODO text itself contains substantive content.
This raises the question of whether the TODO resolution should be:
(a) integration of the existing text into a formal section, or
(b) a landscape-wide pass.

**Evidence required:** None - pattern observation.

**Cross-entry overlap:** QS03, QS04, QS05, QS06, QS07, QS08 - same
pattern.

**Financial-services relevance:** Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - cross-entry pattern

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS09-OBS-001 | Entry quality (positive) | Low | Note |
| QS09-OBS-002 | Submitted-to-dispatch-to-result integrity chain | High | Contribution candidate |
| QS09-OBS-003 | Provider assertion vs independent proof distinction | High | Needs research |
| QS09-OBS-004 | Three attack classes tabulation suggestion | Low-Medium | Note - editorial |
| QS09-OBS-005 | SLSA and RFC 9334 not operationalized | Medium-High | Needs research |
| QS09-OBS-006 | DORA Articles 28-44 - Article 30 emphasis | Medium-High | Needs research |
| QS09-OBS-007 | Standards and Regulatory Mapping TODO (detailed) | Medium | Needs research |

Total: 7 findings (rapid audit scope).

---

## 4. Carry-Forward Resolutions

### QS08 platform surface boundary carry-forward

**Question:** Does QS09 inform the platform-surface boundary definition
noted in QS08-OBS-002?

**Resolution:** Partially. QS08 is about the QPU layer (tenant
isolation). QS09 is about the toolchain layer (compiler, transpiler,
scheduler). Both are platform surface but operate at different layers
of the stack:

    Quantum application layer       <- QS09 (toolchain)
       ->
    QPU execution layer             <- QS08 (multi-tenancy)
       ->
    Physical / infrastructure       <- QS10 (side channels)

This layer model suggests the platform surface is not a single surface
but a three-layer stack (toolchain / execution / infrastructure).
REVIEW_METHODOLOGY.md may need to reflect this.

**Boundary:** QS08 and QS09 are independent but complementary layers.

---

### QS05 cMTTR Question

**Already resolved in QS06 audit.** NIST CSWP 39upd1 does not define
cMTTR specifically. QS09 does not add new evidence.

---

### QS03 TPM / UEFI carry-forward

**Not applicable.** QS09 is platform surface; QS03 is migration
surface. No cross-reference.

---

### Migration-surface carry-forwards

**Not applicable to QS09** (platform surface is a separate track).

---

## 5. Cross-Entry Boundary Check

### QS08 <-> QS09

**Working boundary:** QS08 covers multi-tenant QPU isolation
(execution layer). QS09 covers toolchain and compiler integrity
(application / compiler layer).

Different layers of the same platform surface. QS08 fails when the
execution environment leaks across tenants. QS09 fails when the
transformation pipeline is compromised or the artifact identity is
lost.

**Current status:** Established within current review - different
layers, complementary

---

### QS09 <-> QS10

**Working boundary:** QS09 covers the toolchain and dispatch pipeline
(software layers). QS10 covers side-channel and control-plane exposure
(physical / infrastructure layers).

QS09 is about integrity of transformation. QS10 is about leakage of
workload information through power, timing, or other physical channels.

**Current status:** Provisional - needs QS10 read

---

### QS09 <-> QS07

**Working boundary:** QS07 covers hardware roots of trust in migration
context (TPM, UEFI, HSM). QS09 covers quantum toolchain integrity in
platform context.

These entries do not overlap directly. QS07 concerns cryptographic
anchors in classical hardware; QS09 concerns quantum software pipelines.
The only potential intersection is if QS07's hardware roots are used to
attest QS09's toolchain integrity (TPM-backed attestation of
compilation environment), but this is not currently in either entry.

**Current status:** Independent

---

### QS09 <-> QS04

**Working boundary:** QS04 covers cryptographic inventory and CBOM.
QS09 covers quantum toolchain provenance.

These are structurally similar but address different artifacts:

- QS04: cryptographic assets (keys, certificates, algorithms)
- QS09: quantum job artifacts (circuits, transpiled artifacts, results)

The provenance model in QS09 is more developed than the CBOM model in
QS04 for the quantum-specific case. Whether QS04 should reference QS09
for quantum-toolchain inventory is an open question.

**Current status:** Provisional - possible QS04 cross-reference

---

## 6. Open Questions

### Q1

Which articles of DORA specifically support the integrity chain
requirement? Article 30 (contractual arrangements) is the strongest
candidate, but the entry cites Articles 28-44 collectively.

### Q2

Is there a "provider evidence package" model already deployed in any
quantum platform, or is this entirely greenfield?

### Q3

Should SLSA applicability to quantum toolchains be developed as a
separate contribution (mapping SLSA levels to quantum artifact types),
or is it out of scope for the OWASP Top 10?

### Q4

Should the platform surface be represented in REVIEW_METHODOLOGY.md as
a three-layer stack (toolchain / execution / infrastructure) rather
than as a single surface?

---

## 7. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | No - entry is clear and detailed |
| Evidence complexity | Partial - multiple papers, generic standards need mapping |
| Cross-entry complexity | Partial - platform surface boundary |
| Actionability / evidence question | Yes - integrity chain operationalization |
| Potential coherent contribution | Yes - submitted-to-dispatch-to-result integrity chain |
| Financial-services relevance requiring further work | Yes - DORA Articles 28-44 alignment |

### Decision

DEEP DIVE RECOMMENDED - focused on the integrity chain model.

### Rationale

QS09 has the strongest single contribution candidate of any entry
reviewed so far: the submitted-to-dispatch-to-result integrity chain.
This is:

- Novel (not yet a deployed standard, entry says so explicitly)
- Concrete (four artifacts, digest/commitment mechanisms,
  dispatch-boundary checks)
- Anchored (SLSA, RFC 9334 provide generic models)
- Financially relevant (DORA Articles 28-44 evidence expectations)
- Operational (Prevention items 6-8 already provide the framework
  sketch)

A deep dive could develop:

- A formal integrity-chain model with artifact classes and required
  bindings
- A claim-classification framework (independently verifiable vs
  provider-asserted)
- SLSA level mapping for quantum toolchain artifacts
- RFC 9334 RATS role mapping (Attester, Verifier, Relying Party)
- DORA Article 30-specific evidence package
- Integration with QS08 (QPU isolation evidence) as a two-layer
  platform evidence model

---

## 8. Recommendation

DEEP DIVE RECOMMENDED - focused on the submitted-to-dispatch-to-result
integrity chain.

Recommended deep-dive focus:

- Formalize the four-artifact integrity chain
- Develop the provider-assertion vs independent-proof classification
- Map SLSA levels and RFC 9334 RATS roles to the quantum toolchain
- Produce a DORA Article 30-aligned evidence package model
- Integrate with QS08 evidence framework as a unified platform-surface
  evidence model

Carry-forward to later full-landscape review:

- Platform-surface boundary definition as a three-layer stack
  (toolchain / execution / infrastructure)
- Whether QS04 should reference QS09 for quantum-toolchain inventory
- Whether the Standards and Regulatory Mapping TODO should be resolved
  as a landscape-wide pass

Move on to QS10 rapid audit with cross-entry focus on the platform
surface (QS08-QS10) and the physical / infrastructure layer.

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** DEEP DIVE RECOMMENDED - integrity chain model
**Carry-forward:** QS09 has the strongest single contribution candidate
of any entry reviewed so far; platform-surface layer model suggested
for REVIEW_METHODOLOGY.md update; QS04 cross-reference possibility
noted