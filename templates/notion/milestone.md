<!--
Notion template for the Milestones database.
Defaults: Status = Not started, Health = On track.
Required properties: Project, Version, Dates (start → end), Blocked by (if any).
-->
---

## Goal
<!-- One sentence: what is true for the user when this milestone ships? -->

## Scope

**In:** features linked in the *Features* property.
**Out (explicitly):**

- …

## Exit criteria

- [ ] All linked features *Done* (or moved out, noted below)
- [ ] CI green on `main`, tag `vX.Y.Z` pushed, GitHub Release published
- [ ] `CHANGELOG.md` section written
- [ ] `docs/user-manual.md` updated for new/changed behavior
- [ ] Deployed and main scenario smoke-tested (if applicable)
- [ ] Retro filed (Reviews → Milestone retro)

## Risks / dependencies

- …

## Scope changes log

| Date | Change | Why |
|---|---|---|
|  |  |  |

## Tasks
<!-- Linked view: Tasks filtered by Milestone → contains → this page, board by Status -->
