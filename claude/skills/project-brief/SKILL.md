---
name: project-brief
description: Run the Discovery phase of the personal project workflow — interview the user section by section and write docs/project-brief.md (problem, users, scenarios, goals and success metrics, alternatives, MoSCoW scope with non-goals, constraints, risks). Use when starting a project after the idea is approved, or when retrofitting an existing project.
---

# Project brief (Phase 1 — Discovery)

Produce `docs/project-brief.md` from the template, through a short interview. You are a critical product partner: keep the MVP small and the non-goals explicit.

## Locate the template

Prefer the project's own `docs/project-brief.md` (created by `/project-bootstrap`). If missing, resolve the Grimorio repo from this skill's real path (`realpath` of this SKILL.md, then up three directories) and use `templates/repo/docs/project-brief.md`.

## Inputs to read first

- The idea card text if the user pastes it (Notion *Ideas*).
- `README.md`, `CLAUDE.md` and — for an existing project — the code structure, to describe what already exists.

## Interview

Go section by section, **one or two questions at a time**. Draft each answer back in the template's wording and let the user correct it before moving on.

1. **Problem** — ask for a concrete recent moment the problem happened. Reject solution-shaped answers ("an app that…") and ask again for the pain.
2. **Users** — primary user (often the user themself — record that), secondary users.
3. **Scenarios** — 2–4, format *When … I want to … so that …*. These will drive the Penpot flows.
4. **Goals & success metrics** — every goal needs an observable signal. Push back on unmeasurable goals.
5. **Alternatives** — suggest 2–3 existing apps/tools you know of; ask why they don't fit. If one fits well, say so honestly.
6. **Scope (MoSCoW)** — collect features, then propose a classification:
   - **Must ≤ 8.** If more, propose which to demote and why.
   - Each Must maps to at least one scenario; flag features that serve no scenario.
   - **Won't ≥ 3.** Suggest likely scope-creep items as candidates (sync, multi-user, notifications, social, AI…).
7. **Constraints** — platforms, offline, data/privacy, budget/hosting, hours per week.
8. **Risks & unknowns** — for each, a mitigation or a time-boxed **Spike** task.
9. **Open questions** — anything unresolved.

## Write

- Fill `docs/project-brief.md`, set *Status: Draft → Approved* only when the user confirms, update *Last updated*.
- Remove template guidance comments in sections that are filled.

## Gate check

End with the phase 1 exit gate as a checklist with ✅/❌:

- Problem, user and scenarios written
- Success metrics observable
- Must list closed (≤ 8) and ≥ 3 non-goals
- Risks have a mitigation or spike

Then output a **Notion features list** (Name · MoSCoW · Scenario) ready to create in the Features database, and remind the user to set the project *Phase = Design* and continue with Penpot (`guide/03-design.md`).
