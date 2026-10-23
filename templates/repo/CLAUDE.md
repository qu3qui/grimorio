# CLAUDE.md — {{PROJECT_NAME}}

{{ONE_LINE_PITCH}}

## Project context

- Brief (goals, MVP scope, **non-goals**): `docs/project-brief.md` — respect the non-goals; don't add unrequested features.
- Design: `docs/design.md` (Penpot: {{PENPOT_URL}}) — follow the wireframes and style guide for UI work.
- Architecture: `docs/architecture.md` and decisions in `docs/adr/`.
- Task tracking lives in Notion ({{NOTION_PROJECT_URL}}). Task keys look like `{{PROJECT_PREFIX}}-12`.

## Stack

{{STACK}}

## Commands

- Install: `{{CMD_INSTALL}}`
- Run: `{{CMD_RUN}}`
- Test (with coverage): `{{CMD_TEST}}`
- Lint: `{{CMD_LINT}}`
- Format: `{{CMD_FORMAT}}`
- Type check: `{{CMD_TYPECHECK}}`
- All quality hooks: `pre-commit run --all-files`

## Architecture rules
<!-- Fill in phase 3. E.g.: "UI → application → domain. Domain imports nothing from UI or infrastructure."
     "All DB access goes through repositories in src/infra/." -->
- …

## Conventions

- Branch per task: `<type>/{{PROJECT_PREFIX}}-<n>-<slug>` (`feat`, `fix`, `chore`, `docs`, `spike`).
- Conventional Commits with the task key: `feat(scope): summary ({{PROJECT_PREFIX}}-12)`.
- Never use `--no-verify`, never lower lint rules or the coverage threshold to make CI pass.
- No `TODO` without a task key.

## Definition of Done (apply to every change)

- Acceptance criteria met; tests added/updated; lint, types, tests and build pass.
- User-visible change → update `docs/user-manual.md` and add a `CHANGELOG.md` *Unreleased* entry.
- Structural change → update `docs/architecture.md`; significant decision → new ADR in `docs/adr/`.
- Commands changed → update this file and README.
