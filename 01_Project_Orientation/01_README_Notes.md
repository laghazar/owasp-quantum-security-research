# OWASP Quantum Security Project — README Notes

## 1. Project Identity

### Project name

OWASP Quantum Security Project

### Project type

Official OWASP community project.

### Purpose

My understanding is that the project is intended to translate quantum-era security risks into practical security guidance that organisations can use today.

The project positions itself as practical, vendor-neutral, risk-based, systematic, and actionable rather than hype-driven.

The stated problem is that security teams currently lack:

* a concise and prioritised view of quantum security risks;
* a widely adopted threat model for quantum platforms;
* an integrated treatment of organisational readiness and quantum-platform security.

The project therefore attempts to connect research, industry, and practitioners through a common security framework.

### Current status

The project is currently in the bootstrap phase.

The OWASP Top 10 for Quantum Security Risks is at draft v0.1 and is explicitly open for community input.

The v0.1 list is described as a starting point rather than a finished or permanently fixed list.

### Project leads

* John Sotiropoulos
* Roy Barkay

### License

Project content is released under the Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0) license.

---

## 2. Quantum Security Top 10 Structure

### Overall structure

The current project divides the Quantum Security Top 10 into two major surfaces:

1. Migration surface
2. Platform surface

### Migration Surface

The migration surface addresses organisations whose existing classical cryptography must be replaced with post-quantum cryptographic equivalents.

The current README describes QS01–QS07 as belonging to this surface.

The migration surface therefore appears to focus primarily on organisational exposure, cryptographic transition, migration readiness, implementation, and related security risks.

### Platform Surface

The platform surface addresses organisations running workloads on quantum computing platforms.

The current README assigns QS08–QS10 to this surface.

This surface therefore appears to focus more directly on the security of quantum-computing environments, including workload isolation, toolchains, and platform-level attack surfaces.

### Current entries shown in the README

| ID   | Risk                                    | Primary anchor                                             |
| ---- | --------------------------------------- | ---------------------------------------------------------- |
| QS01 | Harvest-Now-Decrypt-Later Exposure      | Mosca's inequality; EU Roadmap end-2030; NCSC 2031; NSM-10 |
| QS03 | Vulnerable Signatures and Code-Signing  | NSA CNSA 2.0 by 2030; CRA Annex I                          |
| QS04 | Absent Cryptographic Inventory and CBOM | NCSC 2028; EU Roadmap end-2026                             |
| QS05 | Crypto-Agility Failures                 | NIS2 Article 21(2)(h); IETF PQUIP/TLS WG                   |
| QS06 | Insecure Migration and Hybrid Misuse    | EU Roadmap end-2030 standalone-classical prohibition       |
| QS07 | Hardware Roots of Trust                 | NCSC 2028 milestone; CRA Annex IV                          |
| QS08 | QPU Tenant Isolation Failures           | Choudhury et al. NDSS 2025; Xu et al. CCS 2023             |
| QS09 | Toolchain and Compiler Compromise       | Suresh et al. HASP 2021; Chu et al. ICASSP 2023            |
| QS10 | Side-Channel and Control-Plane Exposure | Xu et al. CCS 2023                                         |

### Important restructuring note

The README contains a specific note about candidate restructuring discussed during Sprint 1.

According to that note:

* QS01 and QS02 were discussed as being merged into a single Harvest-Now-Decrypt-Later entry covering both in-transit and at-rest confidentiality exposure under Mosca's inequality.
* QS02's signature and credential-lifetime content was moved into QS03.
* This was described as freeing a slot.
* The README explicitly states that this does not mean a specific replacement entry had already been decided.

Therefore, I should not interpret the current absence of QS02 as an indication that the project has simply forgotten QS02. It reflects an explicitly documented restructuring discussion.

I should also not assume that a future replacement entry has already been selected.

---

## 3. Project Philosophy

### What the project is trying to achieve

My understanding is that the project is trying to make quantum security actionable for today's defenders.

The emphasis is not only on explaining why quantum computing may create future cryptographic problems, but on identifying concrete security risks and readiness activities that organisations can start addressing now.

The project connects two dimensions:

1. Risks associated with the transition from classical cryptography to post-quantum cryptography.
2. Risks associated with the emergence of quantum-computing platforms and their supporting ecosystems.

### What the project values

The README explicitly emphasises:

* Practical and immediate guidance
* Systematic and risk-based analysis
* Actionable and evidence-grounded content
* Vendor neutrality
* Collaboration across research, industry, and practitioners
* Open and transparent peer review

The project also describes itself as expert-backed and community-driven, with project-lead sign-off.

---

## 4. Contribution Model

### Pull Requests

A Pull Request is appropriate when the proposed contribution is concrete enough to modify or add project content.

The README describes a workflow in which a contributor can:

1. Clone the repository.
2. Create a contribution branch.
3. Edit or add content under `quantum-top-10/`.
4. Commit and push the changes.
5. Open a Pull Request against `main`.

New or revised material should be grounded in:

* published standards;
* regulation;
* peer-reviewed research.

The project also requires contributions to remain vendor-neutral.

### Issues

An Issue is more appropriate when the idea is not yet a concrete edit or requires discussion first.

The README gives examples including:

* suggesting a candidate risk;
* flagging an error;
* questioning the selection;
* questioning the ordering;
* starting a broader discussion.

Therefore, my initial understanding is:

**Issue = discussion / question / candidate idea / feedback**

**Pull Request = sufficiently concrete change**

### Alternative submission mechanism

During the bootstrap phase, the project also provides submission forms for:

* candidate risks and feedback;
* proposed work areas and topics.

This indicates that the project currently allows contribution through both GitHub-native and lightweight community-submission mechanisms.

---

## 5. Community and Working Model

### Community calls

The project runs a biweekly community call.

Current README information:

* Frequency: every two weeks
* Day: Monday
* Time: 17:30–18:30
* Time zone: London / Europe-London
* Start date: 3 August 2026
* Additional calls may be scheduled as work develops

Presentation decks for community calls are published in the project's `calls/` directory.

### Governance / review model

The README describes the project as:

* expert-backed;
* community-driven;
* open to transparent peer review;
* subject to project-lead sign-off.

Additional working-group and entry leads may be added as the project matures.

---

## 6. Project Tracks

### Track 1 — Primary, Year One

Focus:

Quantum security risks and organisational readiness.

Key deliverables:

* OWASP Top 10 for Quantum Security Risks
* mitigation guidance
* Quantum Readiness Assessment Assistant

### Track 2 — Parallel

Focus:

Quantum platform threat modeling.

Key deliverables:

* threat models;
* reference architectures;
* attack-surface mapping;
* secure-design guidance for quantum platforms.

### My interpretation

The project is not limited to a static Top 10 list.

The Top 10 appears to be one component of a broader ecosystem that includes:

* risk identification;
* mitigation;
* organisational readiness;
* assessment;
* quantum-platform threat modeling.

This may become important later when assessing whether an individual QS entry is intended to stand alone or as part of a larger readiness methodology.

---

## 7. Standards, Research and Evidence

### What the README establishes

The project expects new or revised content to be grounded in published standards, regulation, or peer-reviewed research.

The README references recognised sources including:

* NIST;
* UK NCSC;
* EU institutions;
* NSA;
* IETF;
* relevant academic research.

### My interpretation

A contribution should not be based only on personal opinion or an intuitive security concern.

A stronger contribution should follow a chain such as:

**Observation → Evidence → Analysis → Proposed change**

The listed primary anchors for the QS entries are useful starting points, but I should not assume that the listed anchors represent the complete evidence base for an entry.

---

## 8. Important Observations

### Observation 1 — The Top 10 is explicitly provisional

The project repeatedly frames v0.1 as a starting point rather than a final list.

This means the current structure should be treated as a working draft open to revision.

### Observation 2 — The project separates migration risk from platform risk

The migration/platform split appears to establish a significant conceptual boundary.

This distinction may become important when analysing overlap between entries.

### Observation 3 — The project combines technical and organisational perspectives

The stated gaps include both technical quantum-platform threat modeling and organisational readiness.

This suggests that the intended audience and usefulness of the project extend beyond cryptography engineers alone.

### Observation 4 — The project explicitly values actionable guidance

The README does not position the project as purely academic research.

Its stated goal is to help defenders act on quantum risk today.

This suggests that practical controls, implementation considerations, evidence, and readiness may be relevant when assessing the usefulness of individual entries.

### Observation 5 — The current entry list is still subject to restructuring

The QS01/QS02 restructuring note is explicit evidence that the Top 10 structure is still evolving.

Therefore, current IDs and boundaries should be rechecked before making any substantive claim about final scope.

### Observation 6 — Each entry has a primary anchor

The README provides at least one primary anchor for each current listed entry.

This suggests that the project expects risks to be connected to recognised standards, guidance, or research rather than presented without supporting foundations.

---

## 9. Questions Raised

### Question 1

How are the boundaries between the migration-surface entries defined when multiple risks can arise from the same PQC transition?

### Question 2

How does the project distinguish a quantum-specific security risk from an existing classical-security problem that becomes more important in the quantum era?

### Question 3

How much organisational governance and risk-management detail is expected inside individual QS entries versus future readiness or mitigation guidance?

### Question 4

How are the primary anchors selected for each entry, and are they intended to be representative references or the principal evidence base?

### Question 5

How will the project decide whether the final Top 10 should contain ten migration/platform risks in the same current structure?

### Question 6

How will the project maintain consistency between the individual entry content and the broader Quantum Readiness Assessment Assistant?

### Question 7

What is the intended relationship between the Top 10, mitigation guidance, and the future broader readiness methodology?

### Question 8

How should sector-specific requirements, such as financial-services governance and third-party risk, be incorporated without making the core Top 10 overly sector-specific?

---

## 10. What I Should Not Assume Yet

* The current v0.1 structure is not necessarily the final Top 10 structure.
* The absence of QS02 from the current table does not by itself indicate an error; the README documents a restructuring discussion.
* A proposed replacement for the freed QS slot has not been identified as final in the README.
* The primary anchor listed for a QS entry is not necessarily its complete evidence or standards mapping.
* A potential lack of a control or governance detail in an entry is not automatically a confirmed gap.
* A technical security issue does not automatically imply that the OWASP entry should be expanded; scope and intended audience need to be understood first.
* Financial-services relevance does not by itself justify changing a generic OWASP entry.
* My practitioner experience should be treated as contextual insight, not as evidence about the state of the wider industry.
* The project being open to community input does not mean that every proposed change will be accepted.
* A research observation should not become a formal Issue or Pull Request until sufficient evidence has been collected.
* The current Top 10 should be reviewed against the current repository state before making contribution decisions because the project is actively evolving.