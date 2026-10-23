# 05 · Phase 4 — Planning

## Goal

Turn features into **milestones** with dates and dependencies, and break **only the next milestone** into Ready tasks.
This phase repeats at the start of every milestone.

## Inputs

- Features with MoSCoW (Notion), design and architecture docs.

## Milestone pattern

| Milestone | Version | Content |
|---|---|---|
| **M0 · Walking skeleton** | `v0.0.x` | Usually already done in phase 3; track it anyway |
| **M1 · MVP core** | `v0.1.0` | The Must features needed for the main scenario |
| **M2 · MVP complete** | `v0.2.0` … | Remaining Musts, polish, user manual |
| **M3+ · Shoulds** | `v0.3.0` … | One milestone per coherent group of Shoulds |
| **v1.0.0** | `v1.0.0` | When you'd recommend it to a friend |

A milestone should take **2–6 weeks** at your pace (5–15 h/week). Longer → split it.

## Steps

1. **Create milestones** in Notion (*Milestones* DB) with version, target dates (start/end), goal sentence and *Blocked by* (dependency).
2. **Assign features** to milestones. Respect technical dependencies (e.g. *Auth* before *Sync*).
3. **Check the timeline view.** Dependencies must point forward in time; adjust dates.
4. **Break down the next milestone** into tasks (`/task-breakdown` per feature):
   - Each task is size **XS (< 1h), S (1–2h), M (half day)**. **L** means *split it*.
   - Vertical slices over layers: *"Add item with name + quantity (UI → DB)"* beats *"Create items table"*.
   - Include Chore/Docs tasks: user manual section, tests, ADR.
   - Unknowns become **Spikes** with a time box.
5. **Refine to Ready.** Move tasks that meet the Definition of Ready to *Ready* and order them by priority.
6. **Complex feature?** Write a spec first (`/feature-spec` → `docs/specs/<feature>.md`) and link it.

### Definition of Ready (DoR)

A task can enter *Ready* when:

- [ ] Title is *verb + object* and the *why* is written.
- [ ] Acceptance criteria are testable.
- [ ] Size ≤ M.
- [ ] Design link present (if it touches UI).
- [ ] Dependencies are Done or not blocking.

## Deliverables

- Milestones with dates, versions and dependencies (timeline view).
- All features assigned; next milestone's tasks created and ≥ 5 tasks in *Ready*.

## Exit gate

- [ ] Next milestone's tasks exist and meet DoR.
- [ ] Timeline consistent (no dependency pointing backwards).
- [ ] Project *Phase* → **Build**.

## Where it lives

Notion (Milestones, Features, Tasks). Specs in repo.

## How Claude helps

`/task-breakdown` reads a feature (or its spec + design notes) and produces tasks in the [task template](../templates/notion/task.md) format plus a CSV you can import into the Tasks DB.
