# OWASP Quantum Security Project — Entry Template Notes

## 1. Template Purpose

### What the template is for

My understanding is that `_template.md` provides a common minimum structure for individual Quantum Security entries.

The template is intentionally concise. It defines the minimum content that should be present when describing a quantum-security risk without prescribing a detailed risk-management framework.

### Current template location

`quantum-top-10/_template.md`

---

## 2. Template Structure

The current template contains the following main sections:

1. Vulnerability Name
2. Description
3. Common Examples of Vulnerability
4. How to Prevent
5. Example Attack Scenarios
6. Reference Links

---

## 3. Section-by-Section Understanding

### 3.1 Vulnerability Name

The entry begins with a clear name for the vulnerability/risk.

### My interpretation

The title should identify the security problem itself rather than a specific vendor, technology product, or implementation.

A good title should be sufficiently precise to establish the scope of the entry.

### Research question

How does the project decide the appropriate abstraction level for a risk title?

---

### 3.2 Description

The template asks for a brief description of the vulnerability and its potential effects, including examples such as:

* system compromise;
* data breach;
* other security concerns.

### My interpretation

The description is the entry's conceptual foundation.

It should explain:

* what the vulnerability/risk is;
* why it matters;
* what security consequences may result.

It should not immediately become an implementation checklist.

### Research question

How much threat-model context is expected to appear in the description before moving into examples and prevention?

---

### 3.3 Common Examples of Vulnerability

The template requires concrete examples of the vulnerability.

### My interpretation

This section translates the abstract risk into observable technical or architectural conditions.

This should help a practitioner recognise whether the issue may exist in an actual environment.

Potential questions include:

* What would the vulnerability look like in practice?
* What implementation or architecture patterns create the exposure?
* Can the condition be observed or tested?

### Research question

How should examples balance technical specificity with applicability across different architectures and vendors?

---

### 3.4 How to Prevent

The template asks for prevention steps or strategies that can prevent the vulnerability or mitigate its effects.

### My interpretation

This is the primary action-oriented section.

It suggests that an entry should not stop at describing a risk. It should provide practical mitigation direction.

However, the template does not explicitly define:

* control ownership;
* control evidence;
* metrics;
* accountability;
* risk acceptance;
* third-party assurance;
* implementation maturity.

I should therefore not assume that these are required in every entry.

### Research question

Where are enterprise governance, accountability, metrics, and evidence expected to be addressed if they are not explicitly part of the template?

---

### 3.5 Example Attack Scenarios

The template requires detailed scenarios demonstrating how an attacker could exploit the vulnerability and what could happen as a result.

### My interpretation

This section establishes the causal chain between:

**vulnerability → attacker action → exploitation → security consequence**

A strong attack scenario should therefore help demonstrate why the risk is security-relevant rather than merely describing a technical weakness.

### Research question

What level of attacker capability and quantum capability assumptions should be stated in these scenarios?

---

### 3.6 Reference Links

The template requires supporting references.

### My interpretation

References are intended to provide the evidence foundation for the entry.

The current project guidance states that new or revised content should be grounded in published standards, regulation, or peer-reviewed research.

Therefore, references should not be treated merely as additional reading. They should support the actual claims being made.

### Research questions

* Does each major claim require a source?
* How should authoritative guidance be distinguished from academic evidence?
* How are conflicting sources handled?
* What makes a reference strong enough to anchor a material security claim?

---

## 4. What Is Explicitly in the Template

The current template explicitly defines:

| Dimension                          | Explicitly present? |
| ---------------------------------- | ------------------- |
| Risk/vulnerability description     | Yes                 |
| Examples                           | Yes                 |
| Prevention/mitigation              | Yes                 |
| Attack scenario                    | Yes                 |
| References                         | Yes                 |
| Standards/regulatory mapping       | No                  |
| Ownership                          | No                  |
| Inventory                          | No                  |
| Criticality                        | No                  |
| Third-party risk                   | No                  |
| Governance                         | No                  |
| Evidence requirements              | No                  |
| Metrics                            | No                  |
| Regulatory/contractual obligations | No                  |

### Interpretation

The absence of a dimension from the template does not mean the project considers that dimension unimportant.

It only means that `_template.md` does not explicitly prescribe it as a section.

I therefore need to compare the template with the actual entries before deciding whether a missing field represents:

* intentional scope;
* information handled elsewhere;
* entry-specific extension;
* inconsistency;
* or a genuine documentation gap.

---

## 5. Template vs Current Entries

### Current observation

The main README states that each entry follows a common template consisting of:

* description;
* common examples;
* prevention;
* attack scenarios;
* references;
* standards-and-regulatory mapping.

However, the current `_template.md` itself does not contain a dedicated standards-and-regulatory mapping section.

At least QS05 currently contains such a section.

QS05 explicitly labels that section as content carried over from a source document and states that it is not part of `_template.md`, asking maintainers to confirm whether it should remain and to verify the standards/citations.

### Important distinction

This should currently be recorded as an **observation**, not a confirmed project deficiency.

Possible explanations include:

* the main README describes the effective entry structure while the template has not yet been updated;
* standards/regulatory mapping was added after the template was created;
* the section is intentionally optional;
* the project is in transition;
* the template and entries are temporarily inconsistent.

I need additional evidence before choosing among these explanations.

---

## 6. What the Template Tells Me About the Intended Entry

My current model of an entry is:

**Risk definition**
→ **recognisable examples**
→ **prevention/mitigation**
→ **attack scenario**
→ **evidence**

This is primarily a practitioner-facing security guidance structure.

It is not, by itself, a full enterprise risk-management assessment methodology.

That distinction will be important when later analysing whether questions around:

* ownership;
* metrics;
* governance;
* evidence;
* third-party risk;
* business criticality

belong inside QS04/QS05/QS06 themselves or in broader readiness guidance.

---

## 7. Questions Raised

### Question 1

Why does the current README describe standards-and-regulatory mapping as part of the common entry structure while `_template.md` does not explicitly define that section?

### Question 2

Is the standards-and-regulatory mapping intended to become a standard section for all entries?

### Question 3

If standards/regulatory mapping is part of the effective entry structure, should the canonical template be updated for consistency?

### Question 4

Where should ownership and accountability be represented?

### Question 5

Where should measurable evidence of prevention or remediation be represented?

### Question 6

Where should third-party and supply-chain considerations be represented when they are relevant to a specific risk?

### Question 7

How should business criticality affect a risk entry without turning the Top 10 into a sector-specific risk framework?

### Question 8

How much of the organisational risk-management layer is intended for the future Quantum Readiness Assessment Assistant rather than the Top 10 entries?

---

## 8. What I Should Not Assume Yet

* A section absent from `_template.md` is not automatically missing from the project.
* A section present in one entry is not automatically required for all entries.
* The README's description of the common entry structure and the current template may reflect different stages of document evolution.
* Standards mapping is not automatically equivalent to regulatory compliance.
* Prevention guidance is not automatically a complete control framework.
* A reference link does not automatically prove that every claim in an entry is supported.
* An attack scenario does not automatically establish real-world likelihood.
* Technical severity does not automatically determine organisational priority.
* The entry template does not by itself define how a financial institution should assess quantum-security risk.
* Organisational ownership, metrics, and evidence may belong at a broader project/readiness layer rather than inside each Top 10 entry.