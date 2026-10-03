# OWASP Quantum Security Project — Charter Notes

## 1. Purpose

### What problem does the project exist to solve?

My understanding is that the OWASP Quantum Security Project exists to provide structured, vendor-neutral guidance for security risks introduced by advancing quantum computing capability.

The project is not limited to explaining quantum computing or post-quantum cryptography at a theoretical level. Its stated purpose is to help practitioners understand, assess, and remediate quantum-era security risk in a practical way.

The initial central deliverable is an OWASP Top 10 for Quantum Security Risks, supported by threat modeling and practical mitigation guidance for quantum computing platforms and hybrid quantum-classical architectures.

### What does the project intend to produce?

The charter describes two complementary work tracks:

1. Quantum Security Risks and Readiness
2. Quantum Platform Threat Modeling

The first track is the primary Year 1 focus and is intended to produce the OWASP Top 10 for Quantum Security Risks, mitigation guidance aligned with recognised guidance, and an open-source Quantum Readiness Assessment Assistant.

The second track focuses on threat models, reference architectures, attack-surface mapping, and secure-design guidance for quantum computing platforms and hybrid quantum-classical architectures.

---

## 2. Target Audience

### Primary audience

The charter identifies the following as the primary audience:

* Security architects
* Application and platform developers
* Cryptography engineers
* Organisational risk owners

These stakeholders are expected to prepare for quantum-capable adversaries today and for quantum-computing platform deployment in the future.

### Secondary stakeholders

The charter also identifies broader stakeholders, including:

* Researchers
* Regulators
* Compliance officers
* Procurement teams
* End users
* Citizen developers
* Platform operators

This indicates that the project is intentionally broader than a cryptography-only initiative.

### Why this matters

The inclusion of organisational risk owners as part of the primary audience is particularly important.

My interpretation is that the project is expected to be useful not only for designing or implementing cryptographic controls, but also for making organisational decisions about quantum security risk.

This creates a potential connection between quantum security and broader risk-management activities such as:

* ownership;
* prioritisation;
* remediation;
* readiness assessment;
* governance;
* risk evidence.

I should not yet assume that every one of these topics belongs inside every individual Quantum Security entry. Their exact placement needs to be investigated through the entry content, mitigation guidance, and readiness work.

---

## 3. Goals

### Goal 1 — Establish a foundation for organisational quantum-security risk assessment

The charter states that the project aims to provide a foundation for organisations to assess and remediate quantum security risk.

My understanding is that the Top 10 should therefore function as more than a list of technical concerns. It should help organisations identify meaningful areas of exposure and understand how those exposures can be addressed.

### Goal 2 — Support secure quantum-platform design and operation

The project also aims to help builders design and operate quantum platforms securely and safely.

This expands the scope beyond classical cryptographic migration to platform-level concerns involving quantum and hybrid architectures.

### Goal 3 — Make quantum readiness operational

The charter explicitly describes an open-source Quantum Readiness Assessment Assistant as part of the primary Year 1 track.

My interpretation is that the project wants to move from descriptive awareness toward practical assessment and action.

This may eventually create an important relationship between:

**Top 10 risk → assessment question → evidence → remediation → readiness measurement**

I should investigate that relationship later rather than assume that it is already fully defined.

---

## 4. Scope

### Included areas

The charter describes quantum-era exposure as broader than the risks normally covered by previous OWASP Top 10 lists.

The scope includes both:

1. Present-day data and cryptographic exposure
2. Emerging platform-level security concerns

Examples explicitly mentioned include:

* Harvest-Now-Decrypt-Later exposure
* Long-lived sensitive data
* Crypto-agility failures
* Algorithm and key-lifecycle dependencies
* Digital-signature considerations
* Symmetric-cryptography considerations
* Trust boundaries in quantum and hybrid architectures
* Quantum-platform attack surfaces
* Control-plane concerns
* Architectural impact of quantum capability on AI pipelines and autonomous systems

### Present-day quantum security exposure

My interpretation is that the project deliberately treats quantum security as a current security-planning problem, even when the triggering quantum capability may be future-oriented.

This is important because some risks depend on the long lifetime of data, infrastructure, credentials, algorithms, or systems rather than on a quantum computer already being capable of breaking them today.

### Emerging platform concerns

The project also considers risks arising from actual quantum-platform environments.

This includes:

* trust boundaries;
* platform attack surfaces;
* control planes;
* quantum/hybrid architectures;
* secure operation and design.

This appears to be the conceptual basis for the second project track.

---

## 5. Scope Boundary: Migration vs Platform

The charter supports a conceptual distinction between two broad categories of work.

### Migration-related security

This concerns organisations transitioning from existing classical cryptographic systems toward post-quantum approaches.

Potential themes include:

* cryptographic exposure;
* cryptographic dependencies;
* algorithm lifecycle;
* key lifecycle;
* crypto-agility;
* migration security.

### Platform-related security

This concerns environments in which quantum workloads are executed.

Potential themes include:

* trust boundaries;
* control planes;
* platform attack surfaces;
* isolation;
* hybrid architectures;
* secure platform design.

### Open boundary question

The existence of two tracks does not automatically define perfectly isolated boundaries between all individual risks.

I need to investigate how the project decides whether a problem belongs to:

* organisational migration risk;
* cryptographic implementation risk;
* platform security;
* supply-chain/toolchain security;
* or more than one of these.

This will be particularly relevant when analysing possible overlap between QS04, QS05, QS06, QS07, QS09, and QS10.

---

## 6. Relationship to Other OWASP Top 10 Lists

The charter explicitly recognises that quantum-era risks may resemble vulnerability classes already represented in other OWASP Top 10 projects.

Examples mentioned include:

* cryptographic failures;
* insecure design;
* supply-chain risk.

However, the stated intention is not to reproduce generic guidance.

Instead, the project aims to explain how conventional security problems may have different implications under a quantum threat model and how traditional remediation approaches may need to be adapted for:

* post-quantum security;
* quantum-capable adversaries;
* quantum-platform deployments.

### My interpretation

This creates an important contribution test:

A proposed change should ideally demonstrate some meaningful quantum-specific implication rather than simply restating an existing classical-security recommendation.

Therefore, when analysing a QS entry, I should ask:

> What makes this problem specifically relevant to the quantum-era threat model?

rather than only asking:

> Is this a known cybersecurity problem?

---

## 7. Relationship to Standards and Guidance

The charter states that the primary Year 1 mitigation guidance is intended to align with recognised guidance from:

* NIST
* UK NCSC
* EU institutions

The broader project also emphasises recognised guidance rather than speculative research.

### My interpretation

Standards and recognised guidance are therefore expected to act as important anchors for the project.

However, I should distinguish between:

* a source used to support a risk;
* a source used to define a control;
* a source used to define a migration milestone;
* a source used for regulatory relevance.

These may not be interchangeable.

This distinction will be useful later for the standards/regulation research section.

---

## 8. Risk-Based Approach

### What does risk-based mean in this context?

My interpretation is that the project aims to prioritise quantum-security concerns based on their practical security significance rather than simply listing every possible quantum-related problem.

The charter states that the project is intended to provide an actionable framework for assessing issues with a clear bearing on security and safety.

### Questions for later investigation

I need to determine:

* How is risk significance determined?
* Are likelihood and impact explicitly considered?
* Is prioritisation methodology documented?
* How are organisations expected to assess their own exposure?
* Is there a difference between technical severity and organisational priority?
* How are long-term and uncertain quantum risks treated?

I should not assume answers to these questions yet.

---

## 9. Practical and Actionable Guidance

### What does practical mean?

My understanding is that the project wants guidance that security practitioners can use rather than purely conceptual discussion.

The charter repeatedly emphasises:

* actionable guidance;
* practical guidance;
* concise guidance;
* practical solutions;
* clarity;
* secure and robust evolution of systems.

### Potential implication

A useful entry may therefore need to help a practitioner answer questions such as:

* What should I look for?
* What systems or assets are affected?
* What should I change?
* What evidence demonstrates that the risk is being addressed?
* How do I know whether the organisation is ready?

These are research questions at this stage, not claims about what the current entries already provide.

---

## 10. Vendor Neutrality

The charter identifies the work as vendor-neutral.

### My interpretation

The project should focus on:

* security properties;
* risks;
* controls;
* architectures;
* standards;
* practices;
* evidence.

It should not make guidance dependent on a specific commercial vendor or product.

### Practical research implication

When collecting evidence, I should prefer:

1. Primary standards and official guidance
2. Peer-reviewed research
3. Technical evidence
4. Recognised industry bodies

Vendor material may provide useful context, but it should not normally be the sole foundation for a material security claim.

---

## 11. Organisational Risk Owner Perspective

This is an especially important point for my research.

The charter explicitly lists organisational risk owners among the primary audience.

### My interpretation

A quantum-security framework intended for risk owners may need to connect technical quantum exposure to organisational decision-making.

Potential areas to investigate later include:

* ownership;
* asset criticality;
* business impact;
* remediation priority;
* third-party exposure;
* risk acceptance;
* control evidence;
* metrics;
* regulatory obligations;
* migration readiness.

At this stage, I am treating these as research hypotheses and not as confirmed requirements of individual QS entries.

---

## 12. Governance and Working Philosophy

### Governance

The project describes itself as expert-backed and community-driven, with open and transparent peer review and project-lead sign-off.

Additional working-group and entry leads are expected to be onboarded as the project matures.

### Working philosophy

The charter emphasises:

* clarity;
* practicality;
* actionability;
* recognised guidance;
* vendor neutrality;
* documentation;
* risk and safety relevance.

It also explicitly recognises uncertainty in an emerging field.

### My interpretation

The project is not trying to eliminate uncertainty.

Instead, it appears to aim to provide practitioners with enough structured information to make informed security decisions despite uncertainty.

---

## 13. Important Observations

### Observation 1 — The audience explicitly includes risk owners

The charter does not define the project solely as cryptography or engineering guidance.

Organisational risk owners are part of the primary audience.

This may create a legitimate role for governance, prioritisation, and organisational readiness perspectives.

### Observation 2 — The project has both present-day and future-facing risk

The scope includes current cryptographic exposure as well as emerging quantum-platform risks.

This means that "quantum security" is not being treated exclusively as a distant future problem.

### Observation 3 — Quantum-specific interpretation is important

The project explicitly wants to expand on the implications of existing security concepts under a quantum threat model rather than simply reproduce generic OWASP guidance.

### Observation 4 — The Top 10 is part of a broader ecosystem

The charter connects the Top 10 to:

* mitigation guidance;
* readiness assessment;
* platform threat modeling;
* secure design.

Therefore, a possible gap in one component might be intentionally addressed elsewhere in the project.

### Observation 5 — The project expects actionable output

The charter repeatedly uses practical/actionable language.

Therefore, the eventual usefulness of a contribution should be considered in terms of what practitioners can actually do with it.

---

## 14. Questions Raised

### Question 1

How does the project define and measure quantum-security risk at the organisational level?

### Question 2

What evidence is expected from an organisation to demonstrate that a quantum-security risk has been identified or remediated?

### Question 3

How is the role of organisational risk owners reflected in the actual QS entry structure?

### Question 4

Which organisational topics belong inside individual QS entries, and which belong in future mitigation or readiness guidance?

### Question 5

How does the Quantum Readiness Assessment Assistant relate to the Top 10 entries?

### Question 6

How are technical severity and organisational risk prioritisation expected to interact?

### Question 7

How are overlaps handled between migration-surface risks and platform-surface risks?

### Question 8

How does the project distinguish a genuinely quantum-specific risk from a conventional security weakness whose impact is merely amplified by quantum computing?

### Question 9

How are standards and regulatory requirements expected to be incorporated into individual entries versus broader guidance?

### Question 10

How does the project decide which recognised sources are sufficiently authoritative to support a risk or recommended control?

---

## 15. What I Should Not Assume Yet

* The presence of organisational risk owners in the charter does not mean every QS entry must contain a full GRC methodology.
* The project being risk-based does not automatically mean that it uses a specific risk framework such as NIST RMF, FAIR, ISO 27005, or another methodology.
* The existence of mitigation guidance does not mean all mitigation requirements must appear inside the Top 10 entries.
* The Quantum Readiness Assessment Assistant may provide functionality that is not yet visible in the individual QS entries.
* A topic being mentioned in the charter does not prove that it belongs in the current v0.1 Top 10.
* Similarity to an existing OWASP vulnerability category does not automatically make a quantum-specific entry redundant.
* A missing section in a current entry is not automatically a project deficiency.
* A standards reference in the project is not automatically a regulatory requirement.
* My experience as a financial-services risk practitioner is contextual expertise, not evidence of industry-wide practice.
* Potential financial-services implications must be validated against sector-specific standards, regulation, and credible industry sources.
* The charter describes the intended direction of the working group; it does not by itself prove that every planned deliverable or governance mechanism is already implemented.