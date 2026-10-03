# OWASP Quantum Security Project — Sprint Plan Notes

## 1. Document Identity

### Document

Sprint Plan and Project Timeline — OWASP Top 10 for Quantum Security Risks (2026)

### Current release

v0.1 draft

### Target publication

Week commencing 26 October 2026

### Status

Draft for community discussion

---

## 2. My Understanding of the Overall Plan

The sprint plan describes a controlled progression from the initial v0.1 bootstrap draft toward a community-validated v1.

The important principle is that the v0.1 list is not treated as final or permanent.

Entries can be:

* challenged;
* revised;
* merged;
* replaced;
* dropped.

This means the current content should be treated as an evolving working set rather than an established final taxonomy.

---

## 3. Two Surfaces

### Migration Surface

QS01–QS07 are described as covering the cryptographic transition from classical cryptography toward post-quantum cryptography.

My understanding is that this surface primarily addresses organisational and technical risks associated with the migration process.

### Platform Surface

QS08–QS10 are described as covering quantum platforms and hybrid quantum-classical systems.

My understanding is that this surface focuses more heavily on the security of quantum-computing environments and their supporting infrastructure.

### Question

How are boundaries between individual risks maintained when a single real-world security problem may touch migration, implementation, supply chain, and platform concerns?

---

## 4. Timeline

| Phase        | Dates                       | Objective                       | Main Output                                        |
| ------------ | --------------------------- | ------------------------------- | -------------------------------------------------- |
| Pre-Sprint 0 | 20 Jul – 3 Aug 2026         | Generative sprint and formation | Templates, proposals, initial feedback             |
| Sprint 1     | 3 – 17 Aug 2026             | Community review and voting     | Ranked proposals, candidate Top 10 (v0.2)          |
| Sprint 2     | 17 Aug – 7 Sep 2026         | Development                     | Ten fully developed entries (v0.3)                 |
| Sprint 3     | 7 – 21 Sep 2026             | Refinement                      | Refined entries (v0.4)                             |
| Sprint 4     | 21 Sep – 5 Oct 2026         | Public review                   | Release candidate (v0.5), external review feedback |
| Sprint 5     | 5 – 12 Oct 2026             | Final review and editorial      | Publication-ready release candidate (v0.6)         |
| Handoff      | 12 Oct 2026                 | Production                      | Layout, design and launch communications           |
| Publication  | Week commencing 26 Oct 2026 | Release                         | OWASP Top 10 for Quantum Security Risks v1         |

---

## 5. Pre-Sprint 0 — Generative Sprint

### Objective

Open the floor and determine the possible shape of the list.

### Activities

The plan describes this stage as the period for:

* circulating the entry template;
* establishing the evidence and anchor convention;
* opening new-entry proposals;
* accepting feedback on existing entries;
* recruiting contributors;
* sharing the sprint plan with the community.

### Contribution mechanism

The plan distinguishes between:

* new entry proposals;
* structured feedback on existing entries;
* less-formed feedback and discussion.

New or concrete changes can be proposed through Pull Requests.

Less-formed questions or feedback can be raised through Issues.

### My interpretation

This stage established the open contribution mechanism.

An important principle is that contributors did not need to be formal entry leads or working-group members in order to participate.

---

## 6. Sprint 1 — Community Review and Voting

### Dates

3 – 17 August 2026

### Objective

Rank the field and converge on a candidate list.

### Activities

The plan describes:

* community voting on proposed entries;
* internal review by the core group;
* consideration of voting signal;
* consideration of evidence quality;
* consideration of scope overlap;
* consideration of coverage across both surfaces;
* formulation of the candidate Top 10;
* opening of entry-lead applications.

### Important insight

The project did not describe ranking as a pure popularity contest.

The voting signal was considered together with:

* evidence quality;
* scope overlap;
* coverage balance.

### Research question

How were evidence quality, scope overlap, and surface coverage actually assessed when the candidate list was formed?

---

## 7. Sprint 2 — Development

### Dates

17 August – 7 September 2026

### Objective

Develop the candidate entries in full.

### Activities

The plan describes:

* naming entry leads;
* defining each entry;
* establishing scope boundaries;
* adding current examples;
* providing actionable mitigations;
* anchoring the entries to supporting evidence.

### Important implication

This phase appears to be where the entries move from candidate concepts toward structured substantive content.

### Research question

What level of evidence and completeness was required for an entry to be considered fully developed?

---

## 8. Sprint 3 — Refinement

### Dates

7 – 21 September 2026

### Objective

Bring the set to a consistent standard.

### Activities

The plan describes:

* refining entries for consistency;
* improving clarity;
* strengthening depth of evidence;
* resolving overlap and boundary questions;
* confirming balance across migration and platform surfaces.

### Important implication

Scope overlap and boundary management are explicitly recognised as part of project quality.

This is relevant to my later QS04/QS05/QS06 analysis because apparent overlap may be intentional and may already have been considered during refinement.

### Research question

Which boundaries were difficult enough to require explicit resolution during refinement?

---

## 9. Sprint 4 — Public Review

### Dates

21 September – 5 October 2026

### Objective

Stress-test the list externally before it carries the OWASP name.

### Activities

The plan describes:

* publishing the release candidate for open review;
* inviting structured review from standards organisations;
* inviting national cyber agencies;
* inviting cloud providers;
* inviting quantum hardware and solution providers;
* seeking comments from researchers whose work underpins the platform entries.

### Important principle

The stated objective is external scrutiny, not endorsement.

### My interpretation

The public-review phase is therefore not only a proofreading stage.

It is an opportunity to identify:

* evidence problems;
* scope problems;
* technical inaccuracies;
* missing perspectives;
* weak boundaries;
* unsupported claims.

### Current relevance

As of 3 October 2026, this phase is still open and ends on 5 October 2026.

Therefore, a well-supported observation can still be relevant to the current public-review process.

---

## 10. Sprint 5 — Final Review and Editorial

### Dates

5 – 12 October 2026

### Objective

Verify the evidence base and finalise the document.

### Activities

The plan specifically identifies:

* incorporating external review feedback;
* confirming that every anchor resolves;
* verifying that the underlying work is accurately characterised;
* performing a final editorial pass for consistency, clarity and formatting.

### Important insight

The project explicitly expects references and evidence to be checked before publication.

This makes source verification especially important for any contribution I consider making now.

### Research question

What happens when a material evidence or scope issue is discovered after the public-review window closes but before publication?

---

## 11. Handoff to Production

### Date

12 October 2026

The plan identifies 12 October as the handoff to production for:

* layout;
* design;
* launch communications.

This appears to mark the point at which substantive content work is largely complete.

---

## 12. Publication

### Target

Week commencing 26 October 2026

### Intended output

OWASP Top 10 for Quantum Security Risks v1.

The important distinction is that v1 is intended to be community-validated rather than simply a frozen copy of the original v0.1 draft.

---

## 13. Working Principles

### Principle 1 — v0.1 has no incumbency

The initial entries do not have privileged status.

They compete with new proposals and can be revised, merged, or dropped.

### Principle 2 — Evidence over speculation

The plan states that proposals should be distinguishable by evidence status, including:

* demonstrated;
* emerging;
* theoretical.

This suggests that the evidence level should be visible rather than implied.

### Principle 3 — Both surfaces matter

The migration surface has a larger practitioner community.

The platform surface is identified as having a smaller community, and the plan specifically calls for contributions in areas such as:

* QPU tenant isolation;
* toolchain and compiler security;
* side-channel and control-plane exposure.

### My interpretation

The project is intentionally trying to avoid overrepresenting only the best-known migration topics.

---

## 14. Success Criteria

The v1 list should be:

### Useful to defenders today

The content should have practical value rather than being purely future-oriented.

### Actionable and practical

The material should support real security action.

### Linked and grounded to existing guidance

Risks and recommendations should be connected to credible external evidence and recognised guidance.

---

## 15. Current Project Position — My Interpretation

The project has moved through:

**generative proposal → voting → development → refinement → public review**

and is currently in the public-review stage.

This changes how I should approach contribution work.

At this stage, a useful contribution is likely to be stronger when it:

* identifies a concrete issue;
* is supported by evidence;
* fits the project's intended scope;
* clarifies rather than unnecessarily expands the framework;
* can be acted upon by the project before finalisation.

I should not assume that every interesting research idea can still become a new Top 10 entry at this stage.

---

## 16. Contribution Strategy at the Current Stage

### Potential contribution paths

#### Path A — Evidence correction

Identify an inaccurate, incomplete, outdated, or weakly supported statement and provide authoritative evidence.

#### Path B — Scope or boundary clarification

Identify ambiguity or overlap between entries and provide evidence-based reasoning for clearer boundaries.

#### Path C — Practical control improvement

Identify a place where the guidance could become more actionable while staying within the entry's intended scope.

#### Path D — Standards or regulatory evidence improvement

Identify an important authoritative source or mapping that materially strengthens an existing risk.

#### Path E — New risk proposal

Possible in principle because the project allows revision/replacement, but the current stage means a new risk would need strong justification and clear differentiation from the existing entries.

### My current priority

Before proposing a new risk, I should first understand the existing entries and identify whether the underlying issue is actually a:

* missing risk;
* scope problem;
* evidence problem;
* control problem;
* standards-mapping problem;
* organisational-readiness problem.

---

## 17. Important Observations

### Observation 1

The project explicitly designed its process so that existing v0.1 entries have no guaranteed place in v1.

### Observation 2

Evidence quality is explicitly part of candidate evaluation.

### Observation 3

Scope overlap and boundaries are explicitly recognised as quality concerns.

### Observation 4

The public-review phase is intended to obtain external scrutiny before the OWASP name is attached to the final document.

### Observation 5

The final-review phase includes explicit verification that every anchor resolves and that the underlying work is accurately characterised.

### Observation 6

The timeline suggests that substantive contribution opportunities narrow as the project moves from refinement to final review.

### Observation 7

The project explicitly seeks platform-surface contributions, suggesting that these areas may currently benefit from additional expert input.

---

## 18. Questions Raised

### Question 1

How exactly were the current candidate entries evaluated against evidence quality?

### Question 2

How were overlaps and boundary conflicts between entries resolved?

### Question 3

What threshold distinguishes a demonstrated, emerging, and theoretical risk?

### Question 4

What happens to a strong contribution submitted during public review if it requires broader structural changes?

### Question 5

Which parts of the current entries are considered content-complete versus still open to substantive change?

### Question 6

How is external review feedback prioritised during Sprint 5?

### Question 7

How much change can reasonably be introduced during final review without destabilising the candidate list?

### Question 8

Does the project have a formal process for tracking evidence changes after v0.5?

---

## 19. What I Should Not Assume Yet

* The current v0.5/release-candidate state does not mean that the content is final.
* A current entry surviving earlier voting does not mean that it cannot be changed or removed.
* Public review does not mean that only editorial corrections are acceptable.
* An issue raised during public review will not necessarily result in a change.
* Evidence quality is important, but the exact evaluation methodology is not yet clear from the sprint plan alone.
* A standards reference appearing in an entry does not automatically mean the underlying requirement has been interpreted correctly.
* A scope overlap is not automatically evidence of a defect.
* A new risk being technically valid does not automatically mean it belongs in the final Top 10.
* The existence of a public-review window does not guarantee that maintainers can incorporate every proposal before final publication.
* The sprint timeline should be treated as a project plan and not as proof that every milestone has already been completed unless verified from the repository history.
* The correct research question is not merely "What is missing?" but also "Where is this issue intended to be handled?"

---

## 20. Current Research Position

At the end of this stage, my working model is:

**Project scope**
↓
**Sprint process**
↓
**Current entry set**
↓
**Entry-level evidence and boundaries**
↓
**Observation**
↓
**Research**
↓
**Contribution decision**

I should therefore avoid proposing a change until I have inspected the relevant entry and its supporting evidence.