---
name: feature-spec
description: Write a feature spec (docs/specs/<feature-slug>.md) for a complex feature in a personal project using the workflow template — user stories, acceptance criteria, UX states, data, business rules, technical approach, testing, out of scope. Use when a feature has more than ~5 tasks, non-trivial data or logic, or open questions.
---

# Feature spec

## Inputs

- Feature name (argument) and, if available, the Notion feature text the user pastes.
- Read: `docs/project-brief.md` (scenarios, non-goals), `docs/design.md` (flows, screens), `docs/architecture.md` (domain model, structure), existing `docs/specs/` and `docs/adr/`.
- For existing code: explore the modules the feature will touch.

## Template

`docs/specs/_feature-spec-template.md` in the project. If missing, use `templates/repo/docs/specs/_feature-spec-template.md` from the Grimorio repo (resolve it from this skill's real path, three directories up).

## Steps

1. **Check it's worth a spec.** If the feature is small (≤ 5 tasks, obvious behavior), say so and suggest going straight to `/task-breakdown`.
2. **Draft first, then ask.** Fill everything you can infer from the docs and code. Collect gaps as numbered questions and ask them in one round (AskUserQuestion for choices, free text otherwise).
3. **Acceptance criteria** in Given/When/Then; include empty, error and boundary cases.
4. **Behavior & rules** numbered (R1, R2…) so tasks and tests can reference them.
5. **Respect non-goals.** If the feature drifts into a *Won't* item from the brief, flag it.
6. **Decisions.** If the technical approach involves a significant choice, note "→ ADR" and offer to run `/adr`.
7. Write `docs/specs/<feature-slug>.md` (kebab-case), *Status: Draft*. Leave section 9 (*Task breakdown*) for `/task-breakdown`.

## Report

Path of the spec, open questions remaining, ADRs suggested, and the next step: `/task-breakdown <feature>` and add the spec link to the Notion feature (*Spec* property).
