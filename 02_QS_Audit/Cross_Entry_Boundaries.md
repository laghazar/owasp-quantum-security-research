# Cross-Entry Boundary Review

## 1. Scope & Method

This document consolidates the cross-entry boundary status across the
OWASP Quantum Security landscape after all 9 active entries and 4
candidate entries have been reviewed.

Boundary status is tracked at three internal levels (see
REVIEW_METHODOLOGY.md):

- **Provisional** - one or both sides not independently reviewed
- **Established within current review** - both sides reviewed and a
  working boundary documented
- **Revalidated after full landscape review** - both sides reviewed
  and the boundary re-checked against the full active and candidate
  landscape

None of these statuses means OWASP has confirmed, endorsed, or adopted
the boundary.

All boundaries below are internal research artifacts. They document the
analyst's working understanding of the scope boundary between entries.
They do not modify OWASP content.

---

## 2. Landscape Overview

### Migration surface

| Entry | Title |
|---|---|
| QS01 | Harvest-Now-Decrypt-Later Exposure |
| QS03 | Vulnerable Signatures and Code-Signing |
| QS04 | Cryptographic Discovery and Inventory Gaps |
| QS05 | Crypto-Agility Failures |
| QS06 | Insecure Migration and Hybrid Misuse |
| QS07 | Hardware Roots of Trust |

### Platform surface

| Entry | Title | Layer |
|---|---|---|
| QS09 | Toolchain and Compiler Compromise | Toolchain |
| QS08 | QPU Tenant Isolation Failures | Execution |
| QS10 | Side-Channel and Control-Plane Exposure | Infrastructure |

### Candidates (Pre-Sprint 0)

| Candidate | Recommendation |
|---|---|
| Compliance Obligations | DO NOT ADOPT (standalone) |
| Insecure Quantum Software Supply Chain | STRONG ADOPT |
| Misdirected Quantum Countermeasures | STRONG ADOPT |
| Unverifiable Quantum Execution and Result Assurance | STRONG ADOPT |

---

## 3. Boundary Status Matrix

### Migration-surface internal boundaries

| Boundary | Status | Rationale |
|---|---|---|
| QS01 <-> QS03 | Established | Confidentiality vs integrity |
| QS01 <-> QS04 | Established | Risk vs inventory foundation |
| QS01 <-> QS05 | Established | Exposure vs agility |
| QS01 <-> QS06 | Established | Downstream HNDL vs migration execution |
| QS01 <-> QS07 | Established | Data exposure vs hardware constraints |
| QS03 <-> QS04 | Established | Signature trust vs inventory foundation |
| QS03 <-> QS05 | Established | Signature vs agility |
| QS03 <-> QS06 | Established | Signature vs migration execution |
| QS03 <-> QS07 | Established | Signature trust vs hardware anchors |
| QS04 <-> QS05 | Established | Inventory vs ability to change |
| QS04 <-> QS06 | Established | Inventory vs migration execution |
| QS04 <-> QS07 | Established | Inventory vs hardware constraints |
| QS05 <-> QS06 | Established | Capability vs safe execution |
| QS05 <-> QS07 | Established | Agility vs hardware limits |
| QS06 <-> QS07 | Established | Migration vs hardware support |

### Platform-surface internal boundaries

| Boundary | Status | Rationale |
|---|---|---|
| QS08 <-> QS09 | Established | Execution layer vs toolchain layer |
| QS08 <-> QS10 | Established | Logical isolation vs physical infrastructure |
| QS09 <-> QS10 | Established | Integrity vs physical side channels |

### Cross-surface boundaries

| Boundary | Status | Rationale |
|---|---|---|
| QS01-QS07 <-> QS08-QS10 | Independent | Migration surface vs platform surface; different threat models |

### Candidate boundaries

| Boundary | Status | Rationale |
|---|---|---|
| Insecure Supply Chain <-> QS09 | Established | Self-delineated (upstream vs toolchain) |
| Unverifiable Execution <-> QS08/QS09/QS10 | Established | Self-delineated (execution assurance vs isolation/toolchain/side-channel) |
| Misdirected Countermeasures <-> QS04/QS05 | Established | Referenced in candidate; control surface in QS04/QS05 |
| Compliance Obligations <-> all entries | Overlap noted | Every entry has Standards and Regulatory Mapping; candidate duplicates |

---

## 4. Migration-Surface Boundaries (Detailed)

### QS01 <-> QS03

**Working boundary:** QS01 covers confidentiality exposure (data
collected today can be decrypted later). QS03 covers authenticity and
integrity exposure (signatures become forgeable).

**Why distinct:** Different protected property, different attack
model (passive vs active), different remediation (re-encrypt vs
re-sign/re-issue).

**Status:** Established within current review.

**Rationale:** Both entries reviewed in depth. Working boundary is
documented and stable.

### QS01 <-> QS04

**Working boundary:** QS04 provides the cryptographic visibility and
inventory foundation that QS01 uses to identify HNDL-exposed data.
QS01 identifies the risk; QS04 provides the data foundation.

**Why distinct:** QS04 is a capability entry (what cryptography
exists); QS01 is a risk entry (what exposure results).

**Status:** Established within current review.

### QS01 <-> QS05

**Working boundary:** QS01 covers confidentiality HNDL exposure.
QS05 covers the ability to change cryptography safely when migration
is required.

**Why distinct:** QS01 asks "is the data exposed?"; QS05 asks "can
the exposure be remediated?"

**Status:** Established within current review.

### QS01 <-> QS06

**Working boundary:** QS01 covers HNDL data exposure. QS06 covers
migration execution failures that can enable HNDL exposure (a session
downgraded to classical today is harvested today).

**Why distinct:** QS06 owns the deployment failure that enables the
downgrade. QS01 owns the downstream confidentiality exposure.

**Status:** Established within current review. QS06 Scenario #1
explicitly acknowledges the QS01 relationship.

### QS01 <-> QS07

**Working boundary:** QS01 covers data confidentiality HNDL exposure.
QS07 covers hardware-root constraints that can lock in classical
protection for data whose confidentiality lifetime extends past the
PQC deadline.

**Why distinct:** QS07 owns the hardware capability question; QS01
owns the resulting HNDL exposure.

**Status:** Established within current review (both reviewed;
boundary stable).

### QS03 <-> QS04

**Working boundary:** QS04 provides the cryptographic inventory that
QS03 uses to identify signature and trust exposures. QS03 identifies
the risk; QS04 provides the data foundation.

**Status:** Established within current review.

### QS03 <-> QS05

**Working boundary:** QS03 covers signature and trust exposure. QS05
covers the ability to change signing and trust mechanisms safely.

**Why distinct:** Different protected property (integrity vs ability
to change), different remediation (re-sign/re-issue vs agility
enablement).

**Status:** Established within current review.

### QS03 <-> QS06

**Working boundary:** QS03 covers signature trust exposure. QS06
covers migration execution failures that could affect hybrid signature
deployment (Composite ML-DSA, dual signatures).

**Why distinct:** QS03 owns the signature risk; QS06 owns the
deployment safety of the migration.

**Status:** Established within current review.

### QS03 <-> QS07

**Working boundary:** QS03 covers signature trust exposure. QS07
covers hardware-root constraints (TPM, UEFI) that QS03 already
identified in its TPM 2.0 v185 and UEFI PQC findings.

**Why distinct:** QS03 identifies the trust exposure; QS07 owns the
hardware migration constraint.

**Status:** Established within current review. Cross-reference from
QS03-OBS-028 (TPM) and QS03-OBS-029 (UEFI) confirmed.

### QS04 <-> QS05

**Working boundary:** QS04 provides cryptographic visibility and
inventory. QS05 covers the ability to change cryptographic mechanisms
safely and operationally.

QS04 provides important inputs to QS05 (cMTTR is CBOM-bounded), but
QS05 is not simply a consumer of QS04 output. Some agility blockers
are visible without complete inventory (e.g., hard-coded OIDs).

**Status:** Established within current review.

### QS04 <-> QS06

**Working boundary:** QS04 covers inventory and CBOM. QS06 covers
migration execution. QS04 provides the artifact discovery that QS06
uses to plan migration.

**Why distinct:** QS04 is a visibility capability; QS06 is an
execution risk.

**Status:** Established within current review.

### QS04 <-> QS07

**Working boundary:** QS04 covers cryptographic inventory including
hardware-backed crypto assets. QS07 covers the migration constraints
of hardware-rooted cryptography.

QS04 owns: "is the hardware root recorded in the inventory?"
QS07 owns: "can that hardware root be migrated or re-anchored?"

**Status:** Established within current review.

### QS05 <-> QS06

**Working boundary:** QS05 covers the capability and governance to
change cryptography safely. QS06 covers the security correctness of
the migration or hybrid deployment.

QS05 owns: has the rotation path been tested? Is there an accountable
owner? Is the agility measurable?
QS06 owns: what does the endpoint do when negotiation fails? Is the
fallback conformant? Is the fallback policy enforced?

**Status:** Established within current review. Resolved by QS06-OBS-002
after QS05-OBS-003 identified boundary pressure.

### QS05 <-> QS07

**Working boundary:** QS05 covers system and process-level agility.
QS07 covers hardware-root constraints that limit agility
(firmware-locked primitives, non-updatable trust anchors).

QS05 mentions embedded devices without tested firmware update paths.
QS07 owns the hardware constraint.

**Status:** Established within current review.

### QS06 <-> QS07

**Working boundary:** QS06 covers hybrid deployment at the protocol
and endpoint layer. QS07 covers hardware-root constraints that limit
cryptographic migration.

QS06 owns: is the hybrid deployment secure at the protocol layer?
QS07 owns: can the underlying hardware actually support PQC?

**Status:** Established within current review.

---

## 5. Platform-Surface Boundaries (Detailed)

### QS08 <-> QS09

**Working boundary:** QS08 covers multi-tenant QPU isolation
(execution layer). QS09 covers toolchain and compiler integrity
(application / compiler layer).

Different layers of the same platform surface. QS08 fails when the
execution environment leaks across tenants. QS09 fails when the
transformation pipeline is compromised or the artifact identity is
lost.

**Status:** Established within current review.

### QS08 <-> QS10

**Working boundary:** QS08 covers multi-tenant QPU isolation (logical
separation in execution layer). QS10 covers controller-side
side-channel exposure (physical access and telemetry in infrastructure
layer).

Both concern information leakage in shared platforms but from
different layers.

**Status:** Established within current review.

### QS09 <-> QS10

**Working boundary:** QS09 covers toolchain and dispatch pipeline
integrity. QS10 covers physical infrastructure confidentiality.

QS09 concerns correctness and integrity of workload transformation.
QS10 concerns confidentiality of the workload through physical side
channels.

**Status:** Established within current review.

### Platform-surface three-layer model

The three platform-surface entries form a coherent three-layer stack:

    Quantum application layer
       |
       v
    QS09 - Toolchain layer
       (compiler, transpiler, scheduler, dispatch, result record)
       |
       v
    QS08 - Execution layer
       (QPU multi-tenancy, tenant isolation, qubit reset)
       |
       v
    QS10 - Infrastructure layer
       (controller electronics, physical access, telemetry)

This three-layer model is documented in REVIEW_METHODOLOGY.md.

---

## 6. Cross-Surface Boundaries

### Migration surface (QS01-QS07) <-> Platform surface (QS08-QS10)

**Working boundary:** The two surfaces address different threat
models:

- **Migration surface:** transitioning from classical to post-quantum
  cryptography. Concerns confidentiality, integrity, agility,
  hardware constraints, migration execution.
- **Platform surface:** securing quantum computing platforms (QPU,
  toolchain, control infrastructure) for tenants consuming them.
  Concerns isolation, integrity of transformation, physical side
  channels.

There is no direct boundary overlap between the two surfaces. Each
addresses a distinct class of risk.

**Shared pattern:** Both surfaces include a provider-evidence
requirement:

- Migration surface: cryptographic inventory from providers (QS04),
  migration roadmaps from PKI/signing vendors (QS03)
- Platform surface: tenant isolation evidence (QS08), toolchain
  integrity evidence (QS09), side-channel disclosure (QS10)

This shared pattern is a cross-entry contribution candidate (unified
provider evidence model).

**Status:** Independent (different threat models, no direct overlap).

---

## 7. Candidate Boundaries (Detailed)

### Insecure Quantum Software Supply Chain <-> QS09

**Working boundary:** The candidate is self-delineated from QS09:

- QS09 addresses whether the quantum transformation and execution
  toolchain can be trusted
- The candidate addresses whether the software and artifacts entering
  that toolchain can be trusted in the first place
- A trusted compiler cannot compensate for a compromised dependency,
  build process, CI/CD pipeline, or artifact

**Status:** Established within current review. Self-delineated by
candidate; confirmed by QS09 review.

### Unverifiable Quantum Execution and Result Assurance <-> QS08, QS09, QS10

**Working boundary:** The candidate is self-delineated from all three
platform-surface entries:

- QS08 addresses harm from co-tenants
- QS09 addresses compromise of toolchain components
- QS10 addresses confidentiality leakage through the control plane
- The candidate addresses what evidence permits independent appraisal
  of the underlying execution and returned result

**Status:** Established within current review. Self-delineated by
candidate; confirmed by platform-surface review.

### Misdirected Quantum Countermeasures <-> QS04, QS05

**Working boundary:** The candidate references QS04 (inventory as the
control that detects misdirected spend) and QS05 (procurement
requirements for agility). The candidate does not duplicate these
entries; it describes a failure mode that QS04 and QS05 controls would
detect or prevent.

**Status:** Established within current review. Self-referenced by
candidate.

### Compliance Obligations <-> all entries

**Working boundary:** The candidate overlaps every active entry's
Standards and Regulatory Mapping section. The candidate does not
present a distinct risk; it presents a compliance-driver framing that
applies to every entry.

**Status:** Overlap noted. Recommend merge into landscape-wide
regulatory framework (see `Landscape_TODO_Resolution_Plan.md`).

---

## 8. Boundary Summary Table (Complete)

| Boundary | Status | Contributing findings |
|---|---|---|
| QS01 <-> QS03 | Established | - |
| QS01 <-> QS04 | Established | - |
| QS01 <-> QS05 | Established | - |
| QS01 <-> QS06 | Established | QS06-OBS-002 (fallback to HNDL) |
| QS01 <-> QS07 | Established | - |
| QS03 <-> QS04 | Established | - |
| QS03 <-> QS05 | Established | - |
| QS03 <-> QS06 | Established | - |
| QS03 <-> QS07 | Established | QS03-OBS-028, QS03-OBS-029 |
| QS04 <-> QS05 | Established | - |
| QS04 <-> QS06 | Established | - |
| QS04 <-> QS07 | Established | - |
| QS05 <-> QS06 | Established | QS05-OBS-003, QS06-OBS-002 |
| QS05 <-> QS07 | Established | - |
| QS06 <-> QS07 | Established | QS06-OBS-003, QS06-OBS-005 |
| QS08 <-> QS09 | Established | - |
| QS08 <-> QS10 | Established | - |
| QS09 <-> QS10 | Established | - |
| Migration <-> Platform | Independent | Different threat models |
| Supply Chain <-> QS09 | Established | Candidate self-delineation |
| Unverifiable <-> QS08/09/10 | Established | Candidate self-delineation |
| Misdirected <-> QS04/QS05 | Established | Candidate self-reference |
| Compliance <-> All | Overlap noted | Candidate overlaps all regulatory mapping |

**Total boundaries tracked:** 23 (15 migration-internal + 3
platform-internal + 1 cross-surface + 4 candidate).

**Status distribution:**
- Established: 20
- Independent: 1
- Overlap noted: 1
- Provisional: 0

No boundaries remain in Provisional status after the full landscape
review.

---

## 9. Open Items

### O1 — Cross-surface provider evidence pattern

The migration surface and platform surface both include
provider-evidence requirements. A unified cross-surface provider
evidence model is a candidate for development as a cross-entry
contribution.

### O2 — Standards and Regulatory Mapping TODO resolution

The landscape-wide TODO resolution plan
(`02_QS_Audit/Landscape_TODO_Resolution_Plan.md`) proposes Option 3
(hybrid per-entry + landscape-wide). This is pending ChatGPT review.

### O3 — Cross-entry contribution candidates

Seven cross-entry contribution candidates were identified during the
rapid audits:

1. QS09 integrity chain (submitted-to-dispatch-to-result)
2. Platform-surface provider evidence model (QS08 + QS09 + QS10)
3. Operational verification methodology (QS04 + QS05 + QS06)
4. Hardware re-anchoring methodology (QS03 + QS04 + QS07)
5. Migration lifecycle model (QS04 + QS05 + QS06 + QS07)
6. cMTTR operationalization (QS05 + NIST CSWP 39upd1)
7. Landscape-wide regulatory framework (all entries)

Priority sequencing of these is a pending decision.

### O4 — Revalidation status

The REVIEW_METHODOLOGY.md defines a "Revalidated after full landscape
review" status. All boundaries are currently at "Established within
current review". The step to Revalidated requires:

- Confirmation against the full active + candidate landscape
- Formal re-check of each boundary

This revalidation step is pending.

---

## 10. Recommendation

All 23 cross-entry boundaries are now documented. No boundary remains
Provisional. The next step is to revalidate the Established boundaries
against the full landscape (including candidates) and elevate them to
"Revalidated after full landscape review" status.

The revalidation should proceed as follows:

1. Confirm each boundary against the corresponding entry's findings
   (already done during rapid audits, but formalized here)
2. Confirm cross-surface and candidate boundaries
3. Update REVIEW_METHODOLOGY.md with revalidated statuses

This is an internal consistency step, not a content change.

---

**Reviewed:** 2026-10-04
**Scope:** Cross-entry boundary review after full landscape audit
**Status:** Complete for 23 boundaries; revalidation to Revalidated
status is the next step
**Dependency:** all 9 active entries and 4 candidate reviews complete