---
name: project-bootstrap
description: Bootstrap a new (or existing) personal software project repo from the Grimorio templates — docs (brief, design, architecture, ADRs, specs, user manual), CLAUDE.md, CHANGELOG, PR template, CI, Dependabot, pre-commit and the stack's code-quality preset. Use when the user starts a new project or wants to retrofit an existing repo to the workflow.
disable-model-invocation: true
---

# Project bootstrap

Populate a project repository from the personal workflow templates and fill every placeholder.

## Locate the Grimorio repo

This skill is symlinked from `grimorio/claude/skills/project-bootstrap/`. Resolve the Grimorio root with:

```bash
WORKFLOW_DIR="$(cd "$(dirname "$(realpath "<this skill's base directory>/SKILL.md")")/../../.." && pwd)"
```

Templates: `$WORKFLOW_DIR/templates/repo/` and `$WORKFLOW_DIR/templates/quality/<stack>/`.

## 1. Gather inputs

Target directory = the argument if given, otherwise the current working directory. Inspect it first (`ls -la`, `git status`) — note whether it is empty, a fresh repo or an existing project.

Ask the user (one AskUserQuestion round where possible) for anything not already known:

| Placeholder | Question / rule |
|---|---|
| `{{PROJECT_NAME}}` | Human name, e.g. *Pantry* |
| `{{PROJECT_SLUG}}` | kebab-case; default from the directory name |
| `{{PROJECT_PREFIX}}` | 3 uppercase letters, must match the Notion project *Prefix* |
| `{{ONE_LINE_PITCH}}` | One sentence |
| `{{GITHUB_REPO}}` | `owner/repo`; try `git remote get-url origin` first |
| `{{STACK}}` | Short description, e.g. "Flutter 3 + Supabase" |
| Quality preset | `python`, `typescript`, `flutter`, or `none` (list the folders in `templates/quality/`) |
| `{{NOTION_PROJECT_URL}}` | Notion project page URL, or `TBD` |
| `{{PENPOT_URL}}` | Penpot project URL, or `TBD` |
| `{{DATE}}` / `{{YEAR}}` | Today (`date +%F`, `date +%Y`) — don't ask |
| `{{CMD_*}}` | From the preset's `README.md` table; for `none`, ask or use `TBD` |

## 2. Copy templates

- Copy everything in `templates/repo/` **including dotfiles** (`.github/`, `.editorconfig`, `.gitignore`, `.pre-commit-config.yaml`) into the target.
- **Never overwrite** an existing file silently. For each conflict (common when retrofitting: `README.md`, `.gitignore`, `CHANGELOG.md`), show the user and either merge (append the template's sections) or skip — ask.
- Create `docs/specs/` and `docs/adr/` even if empty of new files.

## 3. Apply the quality preset (unless `none`)

From `templates/quality/<stack>/`, following that folder's `README.md`:

1. Copy/merge the config files (merge `*.snippet.*` and `package.scripts.json` into the existing files rather than copying them).
2. Append `pre-commit-hooks.yaml` under `repos:` in `.pre-commit-config.yaml` (after the `# --- stack hooks` marker).
3. Replace `.github/workflows/ci.yml` with the preset's `ci.yml`.
4. Append the preset's Dependabot entry to `.github/dependabot.yml`.
5. Append the stack's standard ignores to `.gitignore` (e.g. GitHub's gitignore template for the language).
Don't install dependencies or scaffold the app framework unless the user asks — that is phase 3 (walking skeleton).

## 4. Fill placeholders

Replace every `{{UPPER_SNAKE}}` placeholder in the copied files. Then verify none remain:

```bash
grep -rnE '\{\{[A-Z_]+\}\}' --exclude-dir=.git . || echo "no placeholders left"
```

(`${{ … }}` in GitHub Actions files is expected and is not a placeholder.)

## 5. Git and hooks

- `git init -b main` if not a repo.
- If `pre-commit` is installed: `pre-commit install --hook-type pre-commit --hook-type commit-msg`, then `pre-commit autoupdate`. Otherwise tell the user to `brew install pre-commit`.
- Don't commit or push unless the user asks. Suggest the first commit message: `chore: bootstrap project from workflow templates`.

## 6. Report

Summarize: files created/merged/skipped, preset applied, any `TBD` values, and the next steps:

1. Set the Notion project *Repo* URL (and *Prefix* = `{{PROJECT_PREFIX}}`).
2. Run `/project-brief` (phase 1 — Discovery).
3. After the walking skeleton exists: `pre-commit run --all-files` and enable branch protection on `main` (require CI).
