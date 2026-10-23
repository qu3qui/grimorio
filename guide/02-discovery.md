# 02 · Phase 1 — Discovery

## Goal

Turn the idea into a **bounded MVP**: who it's for, what problem it solves, what it must do, and what it explicitly won't do.

## Inputs

- Idea card (Phase 0).
- Repo created and bootstrapped (`/project-bootstrap`) so the brief has a home.

## Steps

1. **Problem & user.** Describe the problem in 2–3 sentences and the primary user (usually you — say so). Add 2–4 concrete scenarios: *"Saturday, before shopping, I want to know what's about to expire."*
2. **Goals & success metrics.** 2–3 goals, each with a measurable signal (*"I open the app ≥ 3×/week for a month"*, *"food waste noted in the app drops"*).
3. **Look around (30 min max).** List 2–3 existing alternatives and why they don't fit. If one fits well — consider not building.
4. **Feature list with MoSCoW.**
   - **Must** — the MVP. If removed, the app doesn't solve the problem.
   - **Should** — next milestone.
   - **Could** — nice to have, unscheduled.
   - **Won't (this time)** — explicit **non-goals**. Write at least 3.
   Keep Musts to ≈ 5–8 features. If more, cut.
5. **Constraints & risks.** Platform (web/mobile), offline needs, budget (free tiers?), data sensitivity, unknowns. Each risk gets a mitigation or a *Spike*.
6. **Register features in Notion.** Create one *Features* entry per Must/Should, with MoSCoW set.

## Deliverables

- `docs/project-brief.md` from the [brief template](../templates/repo/docs/project-brief.md).
- Features in Notion with MoSCoW.

## Exit gate

- [ ] Problem, user and scenarios written.
- [ ] Success metrics are observable.
- [ ] Must list closed (≤ 8) and ≥ 3 non-goals.
- [ ] Risks have a mitigation or spike.
- [ ] Project *Phase* → **Design**.

## Where it lives

Repo: `docs/project-brief.md`. Notion: Features DB, link to the brief on the project page.

## How Claude helps

Run **`/project-brief`**. Claude interviews you one section at a time, pushes back on vague answers and oversized scope, and writes `docs/project-brief.md`.
