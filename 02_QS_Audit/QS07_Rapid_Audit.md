# QS07 - Rapid Audit

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

- Hardware-root constraints for PQC migration
- Longevity vs migration deadline mismatch
- Concrete TCG / UEFI PQC progress (2026)
- HSM / smart card capacity analysis
- Re-anchoring methodology
- Compensating controls framework
- QS06 <-> QS07 boundary (deployment vs hardware support)
- QS04 <-> QS07 boundary (CBOM vs hardware inventory)
- QS03 <-> QS07 boundary (signature trust vs hardware roots)
- Financial-services relevance (HSM, payment terminals, ATM/POS)

---

## 2. Entry Summary

### Risk

Hardware roots of trust are cryptographic anchors burned into silicon,
firmware, or sealed devices: TPM endorsement keys, UEFI Secure Boot
platform keys, smart-card root certificates, HSM device identities,
embedded SSL certificates in IoT devices, signed firmware in vehicles
and industrial controllers.

They are designed to be tamper-resistant and difficult to update - the
opposite of what PQC migration requires - and they have the longest
replacement cycle of any cryptographic asset class.

### Primary failure modes

- No in-place upgrade path for hardware anchors (TPM, UEFI keys, smart
  cards, HSMs, embedded device certificates, signed firmware)
- Device service life crosses PQC deadlines without re-anchoring
  capability
- HSMs and smart cards without capacity for ML-DSA keys (2-4 KB) or
  signatures (2.4-4.5 KB)
- IoT / OT devices treated as out of scope despite hardware-anchored
  cryptography
- Firmware-locked pre-standard PQC implementations
- Compensating control choice not framed (when is segmentation enough
  vs replacement required)

### Primary actors

- Device manufacturers (procurement and design)
- Hardware security module vendors
- Platform owners (TPM, UEFI Secure Boot)
- OT / ICS system owners
- Regulators and sector-specific bodies
- Procurement teams

### Main controls

- Procurement transition: new hardware supports PQC or is crypto-agile
  by design
- Firmware updates introducing PQC trust anchors (where upgrade path
  exists)
- Retirement or compensating-control wraps (network segmentation,
  restricted-lifetime certificates, additional cryptographic layers)
- Supplier engagement on PQC roadmaps during procurement
- Track TCG, UEFI Forum, 3GPP work on PQC adaptations

### Quantum-specific element

Devices in service today will likely outlive any practical PQC deadline.
OT / ICS often run for 15-20 years, so hardware shipped in 2026 will
still be in service in 2041. ML-DSA and SLH-DSA key and signature sizes
have material implications for constrained hardware.

---

## 3. Findings

### QS07-OBS-001 - Entry quality and coverage assessment

**Section:** All sections

**Observation:** QS07 has a distinct and important focus (hardware
anchors) and correctly identifies the longest replacement cycle problem.
However, it is noticeably shorter than QS05 and QS06 (roughly 40 lines
vs 55-61 lines). The entry provides the right framing but lacks the
operational depth that QS05 (cMTTR, governance) and QS06 (three-layer
model) provide.

Specific gaps:

- No framework for choosing between re-anchoring, compensating
  controls, and full replacement
- No methodology for hardware re-anchoring ceremonies
- HSM / smart card capacity analysis only mentions ML-DSA
- Concrete TCG / UEFI PQC progress from 2026 is not cited

**Why it matters:** This is a real entry with a real risk, but it is
thinner than its peers. The gaps are not fatal but they invite
clarification and possible contribution.

**Evidence required:** None. Assessment observation.

**Cross-entry overlap:** None directly.

**Financial-services relevance:** High - HSM, payment terminals, ATM,
POS, and bank smart cards all fall under this entry.

**Internal Review Priority:** Low (positive context for other findings)

**Disposition:** Note only

---

### QS07-OBS-002 - TCG TPM 2.0 v185 PQC support under-cited

**Section:** Prevention item 5, Reference Links

**Observation:** The entry states "Track Trusted Computing Group, UEFI
Forum, and 3GPP work on PQC adaptations of hardware-anchored standards."
This is correct but does not acknowledge the concrete progress already
made.

TPM 2.0 v185 (Trusted Computing Group) added PQC support for ML-KEM and
ML-DSA, including Attestation Keys. TCG PTP 1.07 mandates ML-DSA support
in relevant PC-client TPM profiles. This was already noted in the QS03
audit (QS03-OBS-028).

Without citing this concrete progress, QS07 may unintentionally imply
TPMs are inherently classical-only, which is no longer accurate for
current specifications.

**Why it matters:** The narrative should be "existing deployed TPM
generations may constrain migration; current specifications
increasingly incorporate PQC mechanisms", not "TPMs cannot support PQC".

**Evidence required:** TCG TPM 2.0 v185 specification, TCG PTP 1.07.

**Cross-entry overlap:** QS03-OBS-028 already established this.

**Financial-services relevance:** High - HSM and TPM vendors are
relevant to bank infrastructure.

**Internal Review Priority:** High

**Disposition:** Needs research - correction of framing

---

### QS07-OBS-003 - UEFI Secure Boot PQC direction under-cited

**Section:** Common Example #1, Reference Links

**Observation:** The entry mentions "UEFI keys" and lists "UEFI Forum
Secure Boot evolution" in the Standards and Regulatory Mapping section,
but does not reference the UEFI Forum's actual PQC work (2026 planning
related to Secure Boot, ML-KEM / ML-DSA / SLH-DSA, and firmware
authentication).

This is the same pattern as QS03-OBS-029, where the QS03 audit noted
the UEFI PQC direction should be explicitly referenced.

**Why it matters:** Similar to TPM - the narrative should reflect that
the UEFI ecosystem is moving toward PQC, with the constraint being
deployed-device capability rather than UEFI specification capability.

**Evidence required:** UEFI Forum PQC work (2026).

**Cross-entry overlap:** QS03-OBS-029 already established this.

**Financial-services relevance:** Medium-High - bank endpoint device
firmware is often UEFI Secure Boot anchored.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - correction of framing

---

### QS07-OBS-004 - HSM / smart card capacity analysis is incomplete

**Section:** Description, Common Example #3

**Observation:** The entry states HSMs and smart cards may lack
"capacity to hold ML-DSA keys (typically 2-4 KB) or produce ML-DSA
signatures (2.4-4.5 KB)." This is correct but incomplete:

- SLH-DSA signatures are 7-49 KB depending on parameter set - much
  larger than ML-DSA
- The entry does not distinguish soft HSMs (upgradeable) from
  hardware HSMs (constrained)
- HSM vendor PQC roadmaps (Thales, Entrust, Utimaco, AWS CloudHSM) are
  not referenced
- Some 2025-2026 HSMs already claim crypto-agility, but the entry does
  not address this

**Why it matters:** The capacity analysis is a strong point but it
should be more complete. Financial-services procurement decisions
depend on this level of specificity.

**Evidence required:** HSM vendor roadmaps, SLH-DSA signature size
specification, ML-DSA / SLH-DSA parameter set size table.

**Cross-entry overlap:** QS07 overlaps with financial-services
procurement (see QS04 procurement requirements).

**Financial-services relevance:** Very High - HSM capacity is a direct
procurement concern.

**Internal Review Priority:** High

**Disposition:** Needs research - extension

---

### QS07-OBS-005 - Hardware re-anchoring methodology is absent

**Section:** Prevention item 2

**Observation:** Prevention item 2 says "For existing devices with
upgrade paths, plan and test firmware updates that introduce PQC trust
anchors before existing trust is compromised." This is correct but
underdeveloped.

The entry does not address:

- What is the cryptographic ceremony for re-anchoring a TPM or Secure
  Boot key?
- How does a transition architecture look (cross-signing, dual-anchor,
  staged migration)?
- What are the failure modes of re-anchoring (bricking devices, loss
  of trust chain, incompatibility with existing verifiers)?
- How is re-anchoring verified?

**Why it matters:** Re-anchoring is a technically hard problem and it
is the difference between "we plan to migrate" and "we have a plan
that works". This is arguably the most actionable gap in the entry.

**Evidence required:** TCG firmware update guidance, UEFI capsule
update specification, vendor re-anchoring documentation.

**Cross-entry overlap:** QS07 <-> QS06 (migration execution),
QS07 <-> QS03 (trust anchor rotation).

**Financial-services relevance:** Very High - HSM and TPM re-anchoring
ceremonies are a regulated-sector concern.

**Internal Review Priority:** High

**Disposition:** Needs research - potentially a contribution candidate

---

### QS07-OBS-006 - Compensating controls listed but not framed

**Section:** Prevention item 3

**Observation:** Prevention item 3 lists "retirement or
compensating-control wraps (network segmentation, restricted-lifetime
certificates above the hardware anchor, additional cryptographic
layers)." These are valid options but the entry provides no framework
for choosing among them.

Open questions not addressed:

- When is network segmentation sufficient vs when is replacement
  required?
- What lifetime is "restricted" for a compensating-control certificate?
- Do additional cryptographic layers solve the HNDL problem or only
  shift it?
- How are compensating controls audited and evidenced?

**Why it matters:** Compensating controls are often accepted in
regulated environments when direct remediation is infeasible. Without
a framework, the entry leaves this to reader judgment, which is
unreliable in practice.

**Evidence required:** NIST SP 800-53 compensating controls framework,
sector-specific guidance (DORA, NIS2) on residual risk treatment.

**Cross-entry overlap:** Cross-cutting with QS04 (residual risk), QS05
(governance), and regulatory compliance.

**Financial-services relevance:** Very High - compensating controls are
an audit and supervisory topic.

**Internal Review Priority:** Medium-High

**Disposition:** Needs research - extension

---

### QS07-OBS-007 - Standards and Regulatory Mapping TODO (pattern)

**Section:** Standards and Regulatory Mapping

**Observation:** Same pattern as QS03-OBS-019, QS04-OBS-039,
QS05-OBS-006, QS06-OBS-006. The section carries the same TODO comment
and includes NIS2, DORA, CRA references without scope qualification.

Specific to QS07: the EU CRA Annex IV critical product categories are
referenced (smart-card and smart-meter gateways) but the applicability
of CRA to hardware roots of trust is not developed.

**Why it matters:** This is the fifth instance of the same pattern. At
this point the pattern should be resolved as a landscape-wide pass
rather than per-entry.

**Evidence required:** None - pattern observation.

**Cross-entry overlap:** QS03, QS04, QS05, QS06 - same pattern.

**Financial-services relevance:** Medium.

**Internal Review Priority:** Medium

**Disposition:** Needs research - cross-entry pattern

---

### Findings Summary

| ID | Finding | Internal Review Priority | Disposition |
|---|---|---|---|
| QS07-OBS-001 | Entry quality assessment (context) | Low | Note |
| QS07-OBS-002 | TCG TPM 2.0 v185 PQC support under-cited | High | Needs research |
| QS07-OBS-003 | UEFI Secure Boot PQC direction under-cited | Medium-High | Needs research |
| QS07-OBS-004 | HSM / smart card capacity analysis incomplete | High | Needs research |
| QS07-OBS-005 | Hardware re-anchoring methodology absent | High | Needs research |
| QS07-OBS-006 | Compensating controls not framed | Medium-High | Needs research |
| QS07-OBS-007 | Standards and Regulatory Mapping TODO | Medium | Needs research |

Total: 7 findings (rapid audit scope).

---

## 4. Carry-Forward Resolutions

### QS06-OBS-003 / "Configured but unobserved" verification axis

**Question:** Does QS07 own hardware-level verification of the
"configured but unobserved" concern?

**Resolution:** Partially. QS07 owns the hardware capability question
("can this hardware actually support PQC?"). QS06 owns the protocol-
level verification question ("is hybrid actually negotiated?"). These
are separate layers.

For hardware: verification means confirming that the deployed hardware
supports PQC (via attestation, firmware version query, or vendor
evidence). This is distinct from protocol negotiation monitoring, which
QS06 covers.

**Boundary:** QS06 <-> QS07 ownership is complementary, not conflicting.

---

### QS06-OBS-005 / Pre-standard Kyber or Dilithium lifecycle

**Question:** Does QS07 own hardware-locked pre-standard PQC
implementations?

**Resolution:** Extended. QS07 adds a hardware-specific dimension to
QS06-OBS-005. Where pre-standard PQC is firmware-locked or silicon-
fused, remediation may require replacement rather than update. This
extends the QS06 lifecycle observation into the hardware-root
territory.

QS07 should address this explicitly.

**Boundary:** QS07 owns the hardware-constrained case; QS06 owns the
software / protocol case.

---

### QS05 cMTTR Question

**Already resolved in QS06 audit.** NIST CSWP 39upd1 does not define
cMTTR specifically but provides a compatible maturity framework.
QS07 does not add new evidence on this question.

---

## 5. Cross-Entry Boundary Check

### QS04 <-> QS07

**Working boundary:** QS04 covers cryptographic discovery, inventory,
and CBOM, including hardware-backed crypto assets. QS07 covers the
specific migration constraints of hardware-rooted cryptography.

QS04 owns: "is the hardware root recorded in the inventory, with its
algorithm, custody, and lifecycle?"

QS07 owns: "can that hardware root be migrated, re-anchored, or must
it be replaced?"

**Current status:** Provisional

---

### QS06 <-> QS07

**Working boundary:** QS06 covers the security correctness of hybrid
deployment (construction, negotiation, fallback, implementation). QS07
covers hardware-root constraints that limit PQC migration, including
the availability of PQC-capable hardware and firmware.

QS06 owns: "is the hybrid deployment secure at the protocol and
implementation layer?"

QS07 owns: "can the underlying hardware actually support PQC?"

**Current status:** Provisional

---

### QS07 <-> QS03

**Working boundary:** QS03 covers signature and trust exposure. QS07
covers hardware-root constraints that limit signature-migration
options.

QS03 owns: "what is the signature trust exposure?"

QS07 owns: "can the hardware-anchored signing capability be migrated?"

**Current status:** Provisional - QS03 already established TPM 2.0
v185 and UEFI PQC direction as findings.

---

### QS07 <-> QS01

**Working boundary:** QS01 covers confidentiality HNDL exposure. QS07
covers hardware-anchored cryptography that may protect data at rest
or in transit but cannot be migrated.

A hardware root that cannot be re-anchored may lock in classical
protection for data whose confidentiality lifetime extends past the
PQC deadline. This creates a hardware-specific HNDL exposure.

**Current status:** Provisional

---

## 6. Open Questions

### Q1

What is the framework for choosing between (a) re-anchoring via
firmware update, (b) compensating controls, and (c) full replacement?
Currently the entry lists options without decision criteria.

### Q2

How does hardware re-anchoring interact with existing verifiers? Cross-
signing, dual-anchor, and staged migration have different trust
implications and different failure modes.

### Q3

What does "crypto-agile hardware" mean in practice for TPM, HSM, and
smart card procurement? The entry mentions it as a requirement but does
not define it.

### Q4

Does the EU CRA Annex IV critical product categories list create a
PQC-specific requirement for smart cards and smart meter gateways, or
is it a general product-security obligation?

---

## 7. Deep-Dive Trigger Assessment

| Trigger | Yes / No |
|---|---|
| Material ambiguity | Partial - compensating controls framing |
| Evidence complexity | Partial - TCG and UEFI PQC progress exists but not cited |
| Cross-entry complexity | Yes - overlaps QS03, QS04, QS06 |
| Actionability / evidence question | Yes - hardware re-anchoring methodology |
| Potential coherent contribution | Yes - re-anchoring framework, HSM capacity analysis, compensating control framework |
| Financial-services relevance requiring further work | Yes - HSM, ATM/POS, smart cards, payment terminals |

### Decision

DEEP DIVE OPTIONAL - focused on hardware re-anchoring methodology and
compensating controls framework.

### Rationale

QS07 is thinner than QS05 and QS06 and has three substantive gaps:
(a) hardware re-anchoring methodology, (b) HSM / smart card capacity
analysis, (c) compensating controls framing. These are not structural
problems but they are real contribution opportunities.

The financial-services angle is especially strong because HSMs, ATM/POS
firmware, smart cards, and payment terminals all sit within the
regulated perimeter.

**However:** The deep dive should only proceed if there is a coherent
contribution thesis that spans QS03 (TPM/UEFI progress), QS04 (hardware
inventory), and QS07 (migration constraints). A QS07-only deep dive
may under-deliver.

---

## 8. Recommendation

DEEP DIVE OPTIONAL - conditional on cross-entry framing.

Recommended focus if deep dive proceeds:

- Hardware re-anchoring methodology (from firmware update to ceremony)
- HSM / smart card capacity decision framework (ML-DSA vs SLH-DSA,
  soft vs hardware, vendor roadmap inclusion)
- Compensating controls framework (segmentation, restricted-lifetime
  certs, layered crypto) with decision criteria
- Concrete TCG / UEFI PQC progress citations to correct the "cannot be
  upgraded" narrative

Carry-forward to later full-landscape review:

- Whether hardware re-anchoring methodology should be a cross-entry
  contribution spanning QS03 / QS04 / QS07
- Whether compensating controls framing should be a landscape-wide
  pattern (applies to QS04 residual risk, QS06 downgrade, and QS07
  migration)
- Whether Standards and Regulatory Mapping TODO resolution should be
  a landscape-wide pass

Move on to QS08 rapid audit with cross-entry focus on platform-surface
entries (QS08-QS10) and the boundary between migration and platform
surfaces.

---

**Reviewed:** 2026-10-04
**Scope:** Rapid landscape review
**Status:** Complete (rapid)
**Deep-dive decision:** DEEP DIVE OPTIONAL (financial-services focused)
**Carry-forward:** QS06-OBS-003 and QS06-OBS-005 partially resolved;
hardware re-anchoring methodology is a candidate cross-entry
contributionս