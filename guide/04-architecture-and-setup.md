# 04 · Phase 3 — Architecture & setup

## Goal

Choose the stack and structure deliberately, write it down, and stand up a **walking skeleton**:
the thinnest runnable version of the app with quality tooling and CI already green.

## Inputs

- `docs/project-brief.md` (constraints, non-functional needs).
- `docs/design.md` (screens → data and operations).

## Steps

1. **Non-functional requirements (NFRs).** Short list: platforms, offline, auth, data volume, performance, privacy, hosting budget, backups.
2. **Domain model.** From the screens, list entities, their fields and relationships. Draw an ER diagram in Mermaid.
3. **Stack decision → ADRs.** For each significant choice (framework, database, hosting, auth, state management) write an ADR with `/adr`.
   Prefer boring, well-documented tech unless *learning X* is an explicit project goal (then say so in the ADR).
4. **C4 diagrams in Mermaid.**
   - *Level 1 – Context:* the app, its user, external systems (APIs, auth provider…).
   - *Level 2 – Containers:* frontend, backend/API, database, workers, third-party services.
   Level 3 (components) only for complex containers.
5. **Project structure.** Describe folders/modules and the dependency rule (e.g. *UI → application → domain; domain depends on nothing*).
6. **Walking skeleton.**
   - Scaffold the app with the chosen stack.
   - Add the quality preset from [`templates/quality/<stack>/`](../templates/quality/) and the shared pre-commit hooks ([chapter 12](12-code-quality.md)).
   - CI workflow: lint, type-check, test, build ([`ci.yml`](../templates/repo/.github/workflows/ci.yml)).
   - One trivial end-to-end path (e.g. a screen that reads from the DB) + one test.
   - Enable branch protection on `main` (require CI).
   - If deployable: deploy it once (preview environment is fine).
7. **Update `CLAUDE.md`** with stack, commands (run, test, lint) and architecture rules.

## Deliverables

- `docs/architecture.md` from the [architecture template](../templates/repo/docs/architecture.md).
- ADRs in `docs/adr/` (at least: stack, data storage, hosting/deploy).
- Walking skeleton on `main` with CI green.
- `CLAUDE.md` filled.

## Exit gate

- [ ] NFRs listed; data model and C4 L1/L2 diagrams committed.
- [ ] Key ADRs *Accepted*.
- [ ] `pre-commit run --all-files` passes locally.
- [ ] CI green on `main`; branch protection on.
- [ ] Project *Phase* → **Planning**.

## Where it lives

Repo (`docs/architecture.md`, `docs/adr/`, `CLAUDE.md`, code). Notion: link to architecture doc on the project page.

## How Claude helps

- Paste brief + screen inventory: *"Propose a domain model (Mermaid ER) and two stack options with trade-offs."*
- `/adr` to record each decision.
- Ask Claude to scaffold the walking skeleton and wire the quality preset and CI.
