# 13 · AI workflow (Claude Code)

Claude drafts, you decide. Every deliverable Claude produces is reviewed and edited by you before it counts toward a gate.

## Setup

1. On each machine, follow [Setup on a new machine](../README.md#setup-on-a-new-machine): install the skills (`./claude/install.sh`, symlinks into `~/.claude/skills/`), copy the [workspace `CLAUDE.md`](../templates/workspace/CLAUDE.md) to your projects folder, and allow Claude to read this repo (`additionalDirectories`).
2. Every project repo has a `CLAUDE.md` ([template](../templates/repo/CLAUDE.md)) — Claude reads it at the start of each session, together with the workspace `CLAUDE.md` above it. Keep it current: stack, commands, architecture rules, conventions.
3. Optional: connect the Notion MCP server in Claude Code so Claude can read tasks and create them directly instead of producing CSVs.

## Skills by phase

| Phase | Skill / command | Produces |
|---|---|---|
| 0 · Idea | (prompt) devil's advocate on the idea card | Critique, alternatives, smallest useful version |
| 1 · Discovery | **`/project-bootstrap`** | New repo populated from `templates/repo/`, placeholders filled |
| 1 · Discovery | **`/project-brief`** | `docs/project-brief.md` through a guided interview |
| 2 · Design | (prompt) screen inventory + Mermaid flows from the brief | Starting point for Penpot |
| 3 · Architecture | **`/adr`** | Numbered ADR in `docs/adr/` |
| 3 · Architecture | (prompt) domain model + C4 diagrams | Draft `docs/architecture.md` |
| 4 · Planning | **`/feature-spec`** | `docs/specs/<feature>.md` |
| 4 · Planning | **`/task-breakdown`** | Tasks in the task template + Notion-importable CSV |
| 5 · Build | *"Work on PAN-12"* + task text | Implementation on a feature branch |
| 5 · Build | `/code-review`, `/simplify` | Review findings, cleanups |
| 6 · Release | **`/milestone-release`** | Version, CHANGELOG section, release notes, retro draft |

## Working agreements with Claude

- **One task per session/branch.** Paste the task (ID, acceptance criteria, design link). Claude works on `feat/<ID>-slug`.
- **Plan first for M-sized tasks.** Use plan mode; approve the plan before code is written.
- **Claude follows the DoD** — `CLAUDE.md` lists it, so Claude updates tests, docs and CHANGELOG in the same change.
- **Never let Claude bypass hooks** (`--no-verify`) or weaken lint/coverage rules to make CI pass.
- **Decisions stay yours.** Claude can propose ADRs; you set the status to *Accepted*.

## Prompts worth keeping

- *"Read docs/project-brief.md and docs/design.md. List screens, entities and operations. Flag any Must feature without a screen."*
- *"Compare two stack options for this brief against the NFRs in a table, then draft ADR-0002 for the one you recommend."*
- *"Here's the milestone's Done tasks and cycle times. Draft the retro: what slowed me down and one process change."*
