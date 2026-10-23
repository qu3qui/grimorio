<!-- Title: Conventional Commit format with the task key, e.g. "feat(items): add expiry alerts (PAN-12)". It becomes the squash commit. -->

## Task
<!-- Notion link + key -->
{{PROJECT_PREFIX}}-

## What & why
<!-- What changed and why. Link spec/ADR if relevant. -->

## How to test

1. …

## Screenshots
<!-- UI changes: before/after. Delete if not applicable. -->

## Definition of Done

- [ ] Acceptance criteria met and verified manually
- [ ] Tests added/updated; CI green (lint, types, tests + coverage, build)
- [ ] No new warnings; no `TODO` without a task key
- [ ] `docs/user-manual.md` updated (if user-visible)
- [ ] `docs/architecture.md` / ADR updated (if structure or a key decision changed)
- [ ] `CHANGELOG.md` *Unreleased* entry (if user-visible)
- [ ] Self-reviewed the diff on GitHub + ran `/code-review`
