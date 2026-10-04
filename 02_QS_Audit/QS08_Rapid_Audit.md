# QS08 - Rapid Audit

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

- Platform surface vs migration surface distinction
- Research-driven vs standards-driven entry character
- "Isolation as claim requiring evidence" model
- Provider evidence framework
- DORA Article 28 scope precision
- Financial-services relevance (proprietary optimisation on quantum
  cloud)
- Cross-entry relationship with migration-surface entries

Note: QS08 is the first platform-surface entry reviewed in this workspace.
The character is different from QS01-QS07 (migration surface). Cross-entry
pressure with migration-surface entries is expected to be minimal.

---

## 2. Entry Summary

### Risk

Cloud-based quantum platforms increasingly host workloads from multiple
tenants on shared QPUs, allocating qubits from a shared processor to
different tenants concurrently or in rapid succession, and claiming
isolation between them. Recent peer-reviewed research shows that
isolation is weaker than it appears.

Two documented attack classes:

- Crosstalk attacks: quantum crosstalk lets a malicious circuit degrade
  a victim's computation on the same processor (QPU-topology adjacency
  suffices)
- State-leakage attacks: standard reset gates fail to fully clear qubit
  state between consecutively executed circuits, leaking information
  across tenant boundaries

### Primary failure modes

- Sensitive workloads run on shared (multi-tenant) QPUs rather than
  dedicated allocations
- Documented isolation guarantees unsupported by evidence
- Confidential inputs or outputs executed adjacent to untrusted tenants
- Reliance on standard reset gates that leave residual state observable
  by the next tenant
- Treating shared-QPU isolation as a default property rather than a
  claim requiring evidence

### Primary actors

- Quantum cloud platform providers
- Tenant organisations running sensitive workloads
- Malicious co-tenants
- Third-party risk and procurement functions (DORA Article 28 context)

### Main controls

- Dedicated QPU allocation for sensitive workloads where available
- Circuit design to minimise information value (split sensitive
  computations, randomise parameter mappings, avoid hardcoded sensitive
  constants)
- Documented isolation evidence from providers
- Treat shared-QPU output as observable until proven otherwise
- Track ongoing QPU-isolation research (NDSS, CCS, Usenix Security,
  ISLPED)

### Quantum-specific element

This is the first entry in the OWASP Top 10 that addresses the security
of quantum computing platforms themselves (as opposed to the migration
to post-quantum cryptography). The failure modes are specific to
quantum hardware (crosstalk, qubit reset insufficiency) and are not
transferable to classical cloud environments.

---

## 3. Findings

### QS08-OBS-001 - Entry quality and character assessment

**Section:** All sections

**Observation:** QS08 is well-constructed and has a distinct character
from migration-surface entries:

- Research-driven (cites peer-reviewed NDSS 2025, CCS 2023, ISLPED 2020
  papers) rather than standards-driven
- Explicit framing that isolation is a claim requiring evidence, not a
  default property
- Two well-defined attack classes (crosstalk, state-leakage)
- Concrete financial-services example (Scenario #1)
- Notes explicitly that no formal standard yet covers QPU tenant
  isolation

**Why it matters:** This entry's character should be preserved. It sits
outside the standards-driven structure of migration-surface entries and
benefits from explicit acknowledgment that it is research-driven.

**Evidence required:** None. Assessment observation.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Medium-High (proprietary optimisation
on quantum cloud).

**Internal Review Priority:** Low (positive context)

**Disposition:** Note only

---

### QS08-OBS-002 - Platform surface vs migration surface boundary not defined

**Section:** Description, whole entry

**Observation:** QS08 is explicitly a platform surface entry. The
REVIEW_METHODOLOGY.md file already notes that the current active
landscape separates migration surface (QS01-QS07) from platform surface
(QS08-QS10). However, the entry itself does not define the boundary
between these two surfaces.

Open questions:

- Do migration-surface entries (QS01-QS07) ever interact with
  platform-surface entries?
- Are platform-surface entries in the same threat-model category or a
  different category?
- Should migration guidance for QS08 be part of the migration roadmap,
  or is it a separate capability?

**Why it matters:** As more platform-surface entries are reviewed
(QS09, QS10), a clear boundary model between the two surfaces will
prevent scope creep and clarify reader expectations.

**Evidence required:** Verify whether the OWASP README defines the two
surfaces explicitly.

**Cross-entry overlap:** QS08, QS09, QS10 (all platform surface).

**Financial-services relevance:** Low directly, but relevant for
organisations with both migration and platform interests.

**Internal Review Priority:** Medium

**Disposition:** Needs research - boundary definition

---

### QS08-OBS-003 - "Isolation as claim requiring evidence" - no framework

**Section:** Description, Prevention item 3

**Observation:** The entry states that organisations must "treat
shared-QPU isolation as a security claim requiring evidence, not a
default property", and Prevention item 3 says "Require documented
isolation evidence from providers: post-execution qubit reset
verification, neighbour-isolation policies, scheduling constraints."

This is a strong framing but does not define what constitutes
sufficient evidence. Open questions:

- What does "post-execution qubit reset verification" look like as a
  provider deliverable?
- Is there a minimum evidence set for a QPU platform to be considered
  acceptable for a given workload class?
- How does the evidence need to be independently validated?
- What is the difference between a provider assertion and verified
  evidence?

**Why it matters:** The core contribution of this entry is the framing
that isolation is a claim requiring evidence. Without a framework for
what evidence suffices, the framing is difficult to operationalise.

**Evidence required:** Research papers, provider documentation,
emerging evidence standards.

**Cross-entry overlap:** QS08 independence, but relevant to QS07
(hardware evidence) as well.

**Financial-services relevance:** High - DORA Article 28 third-party
risk expectations require evidenced platform claims.

**Internal Review Priority:** High

**Disposition:** Needs research - potential contribution candidate

---

### QS08-OBS-004 - DORA Article 28 scope precision

**Section:** Reference Links, Standards and Regulatory Mapping

**Observation:** The entry cites DORA Article 28 as "Third-party ICT
risk expectation that platform claims are evidenced." This is broadly
correct but under-precise:

- DORA Article 28 concerns ICT third-party risk management, not
  specifically evidence requirements for platform claims
- The connection between DORA Article 28 and QPU isolation evidence is
  inferential, not explicit
- Other DORA articles (e.g., Article 30 on contractual arrangements)
  may be more directly relevant for evidence collection

**Why it matters:** Regulatory precision. The QS01-QS07 audits have
consistently applied a scope-qualification discipline to regulatory
references. QS08 should follow the same discipline.

**Evidence required:** DORA Regulation (EU) 2022/2554, Articles 28 and
30.

**Cross-entry overlap:** QS01, QS03, QS04, QS06, QS07 all cite DORA
with scope qualification.

**Financial-services relevance:** High.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - scope qualification

---

### QS08-OBS-005 - Shared-QPU output observability - no decision model

**Section:** Prevention item 4

**Observation:** Prevention item 4 states "Treat shared-QPU output as
observable by other tenants until proven otherwise; do not pass it
through trust boundaries that depend on confidentiality."

This is a strong precaution but does not provide a decision model:

- What is the criterion for "proven otherwise"?
- Does the observability claim apply to outputs, inputs, or both?
- How does this interact with the "output is only the measurement of
  a circuit" assumption?
- Can a tenant use cryptographic blinding or masking as an alternative
  to dedicated QPU allocation?

**Why it matters:** This is the operational consequence of the entry's
core finding. Without a decision model, the guidance is hard to apply
in practice.

**Evidence required:** Research on circuit input/output observability
in multi-tenant QPUs, cryptographic blinding techniques for quantum
workloads.

**Cross-entry overlap:** None directly, but conceptually related to
QS05 (crypto-agility for workload confidentiality).

**Financial-services relevance:** High - proprietary optimisation
circuits on shared quantum cloud are a real use case.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - extension

---

### QS08-OBS-006 - Research citations current but no standards-track progress noted

**Section:** Reference Links, Standards and Regulatory Mapping

**Observation:** The entry cites current research (NDSS 2025, CCS 2023,
ISLPED 2020) and correctly notes "No formal standard yet covers QPU
tenant isolation. NIST and NCSC have not published guidance on quantum
platform security."

However, the entry does not track evolving workstreams that may lead
to standards:

- NIST PQC Standardization track does not cover platform security, but
  NIST NCCoE has done quantum platform work
- ISO/IEC JTC 1 SC 27 work on quantum-safe security may include
  platform scope
- Cloud Security Alliance, ETSI, and other bodies may be developing
  relevant guidance

**Why it matters:** A "no standard exists yet" entry should ideally
track the emerging workstreams that will inform the standard, so that
readers know what to watch.

**Evidence required:** Confirm current standards-body activity on
quantum platform security.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** Low-Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - extension

---

### QS08-OBS-007 - Standards and Regulatory Mapping TODO (pattern)

**Section:** Standards and Regulatory Mapping

**Observation:** Same pattern as QS03-OBS-019, QS04-OBS-039,
QS05-OBS-006, QS06-OBS-006, QS07-OBS-007. The section carries the same
TODO comment.

QS08-specific: "No formal standard yet covers QPU tenant isolation" is
stated but the future Standards and Regulatory Mapping section is
minimal. The entry does not distinguish between (a) standards that
exist, (b) standards under development, and (c) gaps where no standard
exists.

**Why it matters:** Sixth instance of the same pattern. The TODO
resolution is now a clear landscape-wide consistency item.

**Evidence required:** None - pattern observation.

**Cross-entry overlap:** QS03, QS04, QS05, QS06, QS07 - same pattern.

**Financial-services relevance:** Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - cross-entry pattern

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS08-OBS-001 | Entry quality and character assessment (positive) | Low | Note |
| QS08-OBS-002 | Platform surface vs migration surface boundary | Medium | Needs research |
| QS08-OBS-003 | Isolation evidence framework missing | High | Needs research |
| QS08-OBS-004 | DORA Article 28 scope precision | Medium-High | Needs research |
| QS08-OBS-005 | Shared-QPU output observability decision model | Medium-High | Needs research |
| QS08-OBS-006 | Standards-track progress not tracked | Medium | Needs research |
| QS08-OBS-007 | Standards and Regulatory Mapping TODO | Medium | Needs research |

Total: 7 findings (rapid audit scope).

---

## 4. Carry-Forward Resolutions

### QS07 boundary carry-forward

**Question:** Does QS08 relate to the migration-surface carry-forwards
from QS06 and QS07?

**Resolution:** No. QS08 is a platform-surface entry, separate from the
migration chain QS01 -> QS04 -> QS05 -> QS06 -> QS07. No direct
carry-forward exists.

**Note:** The migration-surface carry-forwards (QS06-OBS-003, QS06-OBS-005,
and the QS07 hardware re-anchoring contribution candidate) remain
pending on their own track.

---

### QS05 cMTTR Question

**Already resolved in QS06 audit.** NIST CSWP 39upd1 does not define
cMTTR specifically. QS08 does not add new evidence.

---

### Platform surface note

**This is the first platform-surface entry reviewed.** No carry-forward
from migration-surface entries applies. The platform surface has its
own threat model (multi-tenant quantum cloud) that is distinct from the
migration surface.

---

## 5. Cross-Entry Boundary Check

### QS07 <-> QS08

**Working boundary:** QS07 covers hardware roots of trust in migration
context. QS08 covers multi-tenant QPU isolation in platform context.

These entries do not overlap. QS07 is about hardware anchors that must
be migrated or replaced. QS08 is about the security properties of
quantum cloud platforms.

**Current status:** Independent

---

### QS08 <-> QS09

**Working boundary:** QS08 covers tenant isolation (multi-tenancy).
QS09 covers toolchain and compiler compromise (software supply chain
for quantum workloads).

Both are platform surface. QS08 concerns the QPU layer; QS09 concerns
the toolchain layer above it.

**Current status:** Provisional - needs QS09 read

---

### QS08 <-> QS10

**Working boundary:** QS08 covers tenant isolation (logical
separations). QS10 covers side-channel and control-plane exposure
(physical / infrastructure).

QS08 and QS10 both address information leakage in quantum platforms
but from different layers (tenant-boundary isolation vs control-plane
side channels).

**Current status:** Provisional - needs QS10 read

---

### QS08 <-> QS01

**Working boundary:** QS01 covers HNDL exposure in data collection.
QS08 covers confidential workload exposure in quantum cloud platforms.

These entries are in different threat models (classical vs quantum
computing platform). No direct overlap.

**Current status:** Independent

---

## 6. Open Questions

### Q1

What evidence should a financial-services organisation require from a
QPU provider to substantiate isolation claims? Is there a minimum
evidence set that is defensible to a regulator?

### Q2

Can cryptographic techniques (circuit blinding, input masking) provide
an alternative to dedicated QPU allocation for sensitive workloads,
and does the entry adequately address this option?

### Q3

Is the "isolation as claim requiring evidence" framing applicable to
classical cloud providers as well, or is it specific to quantum
platforms? If general, does this create a cross-cutting observation
that spans QS08 and other entries?

### Q4

How should the platform surface boundary be represented in
REVIEW_METHODOLOGY.md? The current three-surface model (migration,
platform) works for the landscape, but a more explicit boundary model
may be needed.

---

## 7. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | Yes - isolation evidence framework |
| Evidence complexity | Yes - research-driven, no standards yet |
| Cross-entry complexity | Partial - platform surface boundary |
| Actionability / evidence question | Yes - evidence framework for DORA Article 28 |
| Potential coherent contribution | Yes - isolation evidence framework |
| Financial-services relevance requiring further work | Yes - proprietary optimisation on quantum cloud |

### Decision

DEEP DIVE OPTIONAL - focused on the isolation evidence framework and
DORA Article 28 alignment.

### Rationale

QS08 is well-constructed and is the first entry reviewed that is
research-driven rather than standards-driven. This is a strength.

The strongest contribution candidate is the isolation evidence
framework (QS08-OBS-003). This is a novel framing that would benefit
from:
- A structured evidence model (what constitutes sufficient evidence of
  QPU isolation?)
- An alignment with DORA Article 28 third-party risk expectations
- A decision model for shared-QPU output observability (QS08-OBS-005)

The financial-services angle is strong because proprietary optimisation
on quantum cloud is a real emerging use case, and DORA Article 28
creates a clear evidence expectation.

**However:** The deep dive should focus narrowly on the evidence
framework, not broaden into quantum platform security generally.

---

## 8. Recommendation

DEEP DIVE OPTIONAL - focused on isolation evidence framework.

Recommended focus if deep dive proceeds:

- Structured evidence model for QPU tenant isolation (provider
  deliverables, independent validation, verification methodology)
- Alignment with DORA Article 28 third-party risk expectations
- Decision model for shared-QPU output observability
  (cryptographic blinding vs dedicated allocation)
- Platform surface boundary definition (QS08-QS10 vs QS01-QS07)

Carry-forward to later full-landscape review:

- Whether the "isolation as claim requiring evidence" framing is
  applicable beyond quantum platforms (cross-cutting observation)
- Whether platform-surface entries need a distinct treatment in
  REVIEW_METHODOLOGY.md
- Whether the Standards and Regulatory Mapping TODO should be resolved
  as a landscape-wide pass

Move on to QS09 rapid audit with cross-entry focus on the platform
surface (QS08-QS10) and the toolchain layer above the QPU.

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** DEEP DIVE OPTIONAL (isolation evidence framework)
**Carry-forward:** First platform-surface entry reviewed; no migration-
surface carry-forward applies; platform surface boundary definition is
a candidate cross-entry observation