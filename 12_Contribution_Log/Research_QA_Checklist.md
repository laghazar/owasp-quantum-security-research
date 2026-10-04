# Research QA Checklist

Pre-submission gate for OWASP contributions.

This checklist must be passed by any finding before it is carried into an
OWASP Issue, Pull Request, or other external communication. It is also
used as a self-review checklist during internal research, but its
mandatory use is at the pre-submission boundary.

---

## Content

- [ ] Fact / interpretation / hypothesis distinguished
- [ ] No unsupported absolute claims (e.g. "the single most common blocker")
- [ ] No accidental OWASP attribution (no implication of endorsement)
- [ ] Internal priority labels clearly marked as internal
- [ ] No "novel contribution" claim without prior-art review
- [ ] Qualitative models are not presented as validated quantitative formulas

## Evidence

- [ ] Primary source identified for each substantive claim
- [ ] The source supports the exact claim (not a paraphrase of a paraphrase)
- [ ] Source scope / jurisdiction verified
- [ ] Publication status verified (final / draft / guidance / roadmap)
- [ ] No stale draft presented as final
- [ ] No document number or date unverified in citation

## Technical

- [ ] Terminology precise (e.g. discovery vs inventory vs CBOM)
- [ ] Attack scenarios technically coherent end-to-end
- [ ] Cryptographic assumptions correctly stated
- [ ] Quantum assumptions explicit (what capability, what threat model)
- [ ] No conflation of adjacent properties (confidentiality vs integrity)
- [ ] No conflation of adjacent mechanisms (key establishment vs key transport)

## Regulatory

- [ ] Regulation vs directive vs standard vs guidance vs roadmap distinguished
- [ ] Jurisdiction identified
- [ ] Article / section verified where cited
- [ ] No universal claim built from a sector-specific or national source
- [ ] No claim that a regulation mandates something it does not mandate

## Cross-entry

- [ ] Overlap checked against all active entries
- [ ] Overlap checked against all QSxx candidates
- [ ] Boundary status assigned (Provisional / Established / Revalidated)
- [ ] No duplicate risk proposed under a different name
- [ ] Cross-references are two-way and consistent

## Submission

- [ ] Proposed text matches the evidence
- [ ] Issue and PR tell the same story
- [ ] No internal-only priority carried into the OWASP submission
- [ ] No confidential, proprietary, or non-public organisational information
- [ ] Final source verification complete
- [ ] Markdown encoding verified as UTF-8 without BOM
- [ ] No placeholder text (TODO, TBD, [insert], etc.)
- [ ] No em-dash or unicode corruption from paste

---

## How to use

1. Before drafting an Issue or PR, run through this checklist for the
   finding(s) being proposed.
2. If any item fails, fix it before drafting.
3. Note the checklist result in `12_Contribution_Log/Contribution_Master_Log.md`
   under the finding's row.
4. For aggregated submissions (multiple findings in one PR), the checklist
   must be passed by every finding in the submission.

---

## Failure handling

If a checklist item cannot be passed:

- **Content / Evidence / Regulatory:** the finding is not submission-ready.
  Either gather additional evidence, narrow the claim, or move the finding
  to Discussion / Research.
- **Technical:** correct the technical statement before submission.
- **Cross-entry:** re-check boundary and either adjust the finding scope
  or cross-reference to the correct entry.
- **Submission:** correct the submission artifact before sending.

---

## Status tracking

| Finding ID | Content | Evidence | Technical | Regulatory | Cross-entry | Submission | Ready |
|---|---|---|---|---|---|---|---|
| (example) QS01-OBS-003 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |