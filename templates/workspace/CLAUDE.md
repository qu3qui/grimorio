# Personal projects

<!--
Copy this file to the folder that contains all your projects (e.g. ~/proyectos/CLAUDE.md).
Claude Code loads every CLAUDE.md from the current directory up to the root, so this file
applies to every project inside that folder. Keep it short: it is loaded in every session.
Replace ~/grimorio if you cloned the Grimorio repo somewhere else.
-->

Every project in this folder follows the personal project workflow defined in `~/grimorio`.
Entry point: `~/grimorio/guide/00-overview.md` — read the relevant chapter when a phase-specific question comes up; don't load the whole guide.

## Working rules

- A project without `docs/project-brief.md` or its own `CLAUDE.md` hasn't been bootstrapped: suggest running `/project-bootstrap` (manual-only skill — the user runs it).
- Use the workflow skills in their phase: `/project-brief` (discovery), `/adr` (decisions), `/feature-spec` and `/task-breakdown` (planning), `/milestone-release` (release — manual-only).
- The project's own `CLAUDE.md` and `docs/` take precedence over this file for project-specific rules.
- Task keys look like `PAN-12`; branches, commits and PRs carry them.
- Respect each project's non-goals in `docs/project-brief.md`; don't add unrequested features.

## Language

- Reply to me in Spanish.
- Write code, commit messages and all project documentation in English.
