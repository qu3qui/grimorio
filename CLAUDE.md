# CLAUDE.md — Grimorio

Grimorio defines the personal project workflow (guide + templates + Claude skills). It contains no application code.

## Layout

- `guide/` — numbered chapters; `00-overview.md` is the entry point. Phase chapters follow the same section order:
  Goal · Inputs · Steps · Deliverables · Exit gate · Where it lives · How Claude helps.
- `templates/notion/` — Notion page templates (Markdown) + `notion-setup.md` + CSV seeds.
- `templates/repo/` — files copied verbatim into new project repos. Placeholders use `{{UPPER_SNAKE}}`.
- `templates/quality/<stack>/` — per-stack lint/format/type/test configs and CI job snippets.
- `claude/skills/<name>/SKILL.md` — Claude Code skills; installed via `claude/install.sh` (symlinks). Skills with large or outward-facing effects set `disable-model-invocation: true`.
- `templates/workspace/CLAUDE.md` — copied to the folder holding all projects (e.g. `~/proyectos/`).
- `examples/pantry/` — worked example; must stay consistent with the templates.

## Conventions

- Everything is written in **English**.
- Keep templates and guide in sync: if you change a template's sections, update the guide chapter and the example.
- Placeholders: `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`, `{{PROJECT_PREFIX}}`, `{{ONE_LINE_PITCH}}`, `{{GITHUB_REPO}}`, `{{NOTION_PROJECT_URL}}`, `{{PENPOT_URL}}`, `{{STACK}}`, `{{YEAR}}`, `{{DATE}}`, and stack commands `{{CMD_INSTALL}}`, `{{CMD_RUN}}`, `{{CMD_TEST}}`, `{{CMD_LINT}}`, `{{CMD_FORMAT}}`, `{{CMD_TYPECHECK}}` (values in each `templates/quality/<stack>/README.md`). Add new ones to this list. `${{ … }}` in GitHub Actions files is not a placeholder.
- Generated, uncommitted output in project repos goes to `.workflow/` (git-ignored): `tasks/` from `/task-breakdown`, `release/` from `/milestone-release`.
- Task IDs look like `PAN-12` (project prefix + Notion unique ID).
- Record notable workflow changes in `CHANGELOG.md`.
