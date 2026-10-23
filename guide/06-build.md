# 06 · Phase 5 — Build

## Goal

Flow tasks from *Ready* to *Done* with small PRs, automatic quality checks and up-to-date docs.

## Kanban

| Column | Meaning | Limit | Entry rule |
|---|---|---|---|
| **Backlog** | Captured, not refined | — | Anything |
| **Ready** | Refined, can be started | keep 5–10 | Meets **DoR** |
| **In Progress** | Being worked on | **2** | Branch created, *Started* date set |
| **Review/Test** | PR open, self-review / manual test | **2** | CI green |
| **Done** | Merged and verified | — | Meets **DoD**, *Completed* date set |

**Pull, don't push:** finish what's in Review/Test before starting something new. If In Progress is full, help a stuck task (unblock, split, or spike) instead of starting another.
**Blocked?** Set the *Blocked* checkbox and write why in the task — don't move it back.

## Working a task

1. Take the top task from *Ready*, move it to *In Progress* (sets *Started*).
2. Create a branch: `feat/PAN-12-expiry-alerts` (see [chapter 11](11-git-and-release.md)). Paste it into the task's *Branch* field.
3. Work in small commits (Conventional Commits, include the ID). Pre-commit hooks format, lint and scan for secrets.
4. If you made a decision you'd need to explain later → `/adr`.
5. If behavior visible to the user changed → update `docs/user-manual.md` in the same PR.
6. Open the PR with the [PR template](../templates/repo/.github/pull_request_template.md). Move the task to *Review/Test*, paste the PR URL.
7. Self-review the diff (wait at least a few minutes, read it like someone else's code) and run `/code-review` in Claude Code.
8. Test manually against the acceptance criteria.
9. Squash-merge when CI is green. Move the task to *Done* (sets *Completed*).

### Definition of Done (DoD)

- [ ] All acceptance criteria met and manually verified.
- [ ] Tests added/updated; CI green (lint, types, tests, coverage threshold, build).
- [ ] No new warnings; no `TODO` without a linked task.
- [ ] Docs updated: user manual (if user-visible), architecture/ADR (if structure changed), `CLAUDE.md` (if commands changed).
- [ ] `CHANGELOG.md` *Unreleased* entry added (if user-visible).
- [ ] PR merged, branch deleted.

## Bugs

- Found while building the *current* task → fix in the same PR if small; otherwise create a Bug task.
- Found later → Bug task from the [bug template](../templates/notion/bug.md) with repro steps. Priority P1 bugs jump to the top of Ready.
- Every bug fix includes a regression test.

## Deliverables

- Merged PRs, each linked to a task.
- Specs/ADRs as needed. Docs updated per DoD.

## Exit gate (per task)

Definition of Done met.

## How Claude helps

- Start a session with: *"Work on PAN-12"* + paste the task. `CLAUDE.md` gives Claude the project context.
- `/code-review` before merging; `/simplify` for cleanups.
- `/adr` and `/feature-spec` as needed.
