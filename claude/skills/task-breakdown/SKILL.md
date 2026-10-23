---
name: task-breakdown
description: Break a feature (or its spec) of a personal project into Notion-ready tasks following the workflow's task template — vertical slices sized XS/S/M with context, scope, Given/When/Then acceptance criteria, design link and technical notes — and export a CSV for "Merge with CSV" into the Notion Tasks database. Use during planning of the next milestone.
---

# Task breakdown

## Inputs

- Feature name, Notion feature text, or a spec path (`docs/specs/<slug>.md`).
- Project prefix and milestone name (from `CLAUDE.md`/README or ask).
- Read the spec, `docs/design.md` (Penpot links per screen), `docs/architecture.md` and the relevant code.

## Task template

Use the body sections of `templates/notion/task.md` from the Grimorio repo (resolve from this skill's real path, three directories up): Context / why · Scope (in/out) · Acceptance criteria · Design · Technical notes. DoR/DoD come from the Notion template itself — don't repeat them.

## Rules

- **Vertical slices:** each task delivers observable behavior through all layers where possible ("Add item with name and quantity", not "Create items table").
- **Size:** XS (< 1 h), S (1–2 h), M (half day). Never L — split it.
- **Title:** verb + object, ≤ 60 characters.
- **Acceptance criteria:** testable; Given/When/Then for behavior; reference spec rules (R1, R2…) if any.
- **Types:** `Feature task`, `Chore`, `Docs`, `Spike` (time-boxed, output is a note/ADR). Include where relevant:
  - a `Docs` task for the user-manual section of the feature,
  - a `Spike` for each unknown that blocks estimation,
  - test-only tasks only if tests don't fit naturally inside the slices.
- **Order** by dependency, then value; set `Priority` P1 for the main-scenario path, P2 otherwise, P3 for polish.
- Aim for 4–12 tasks per feature. More → the feature should be split.

## Output

Write two files in the project (the `.workflow/` folder is git-ignored):

1. `.workflow/tasks/<feature-slug>.md` — every task with its properties line and body, separated by `---`:

   ```markdown
   ## Add expiry date to item form
   **Type:** Feature task · **Priority:** P1 · **Size:** S · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
   **Design:** <penpot link>

   ### Context / why
   …
   ```

2. `.workflow/tasks/<feature-slug>.csv` — header exactly:
   `Title,Type,Status,Priority,Size,Project,Feature,Milestone,Design`
   `Status` = `Backlog`. Relation columns contain the exact Notion page titles. Quote fields containing commas.

If a spec exists, fill its section 9 (*Task breakdown*) table too.

**Notion MCP available?** Offer to create the pages directly in the Tasks database (properties + body) instead of the CSV.

## Report

Table of tasks (title · type · size · priority), total count, any spikes, and import instructions: *Tasks database → ⋯ → Merge with CSV*, then check relations (see `templates/notion/notion-setup.md` §7).
