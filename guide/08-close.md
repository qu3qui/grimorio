# 08 · Phase 7 — Close / Maintain

## Goal

End projects **on purpose**. Every project finishes in one of three explicit states — never "abandoned in Build".

## When

- The goals in the brief are met, **or**
- You've lost interest / found a better alternative, **or**
- Another project needs the *Build* slot.

## End states

| Status | Meaning | Minimum care |
|---|---|---|
| **Shipped – Maintenance** | In use; only bugs and small improvements | Dependabot PRs monthly, P1 bugs only |
| **Paused** | Will come back; nothing in progress | Write a "where I left off" note |
| **Archived** | Done or abandoned | Archive repo (read-only) |

## Steps

1. **Final retro (30 min)** using the [milestone retro template](../templates/notion/milestone-retro.md) with a *whole project* lens: did it meet the success metrics in the brief? What would you do differently?
2. **Handover note to future you** in `README.md` → *Status* section: current state, how to run it, known issues, next ideas.
3. **Clean the board.** Close or move every open task (Backlog → keep as *Could* ideas in the feature list).
4. **Set the project status** in Notion and the repo (README badge/section; archive repo if Archived).
5. **Feed the workflow.** Anything learned about the process → edit this repo and add a `CHANGELOG.md` entry here.

## Deliverables

- Final retro, README status section, project status in Notion.

## Maintenance mode routine (monthly, 15 min)

- Merge or close Dependabot PRs (CI must be green).
- Triage new bugs.
- Check the deploy is alive / backups exist.
