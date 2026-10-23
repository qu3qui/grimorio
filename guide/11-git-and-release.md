# 11 · Git & release conventions

## Branching (GitHub flow)

- `main` is always releasable and protected (CI required, no direct pushes — even for you).
- One short-lived branch per task: `<type>/<ID>-<slug>`

| Task type | Branch prefix | Example |
|---|---|---|
| Feature task | `feat/` | `feat/PAN-12-expiry-alerts` |
| Bug | `fix/` | `fix/PAN-31-negative-quantity` |
| Chore | `chore/` | `chore/PAN-40-bump-deps` |
| Docs | `docs/` | `docs/PAN-22-manual-shopping-list` |
| Spike | `spike/` | `spike/PAN-8-barcode-libs` (usually not merged) |

- Merge with **squash**; the squash commit message follows Conventional Commits. Delete the branch after merge.

## Conventional Commits

```text
<type>(<scope>): <summary in imperative, lowercase> (<ID>)

[optional body: why, not what]

[optional footer: BREAKING CHANGE: …]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.

Examples:

```text
feat(items): add expiry date alerts (PAN-12)
fix(inventory): prevent negative quantities (PAN-31)
docs(manual): document shopping list export (PAN-22)
```

Enforced by the **conventional-pre-commit** hook at the `commit-msg` stage ([chapter 12](12-code-quality.md)).

## Pull requests

- Title = the squash commit message.
- Body = [PR template](../templates/repo/.github/pull_request_template.md): task link, what/why, how to test, screenshots, DoD checklist.
- Keep PRs < ~400 changed lines. Bigger → the task was too big.

## Versioning — SemVer

`MAJOR.MINOR.PATCH`

- Before `1.0.0`: `0.MINOR.PATCH` — each milestone with new features bumps **MINOR**; fix-only releases bump **PATCH**. Breaking changes are allowed.
- From `1.0.0`: breaking change → MAJOR, new feature → MINOR, fix → PATCH.
- Tags: `vX.Y.Z` (annotated).

## CHANGELOG

[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) format, written for **users**, not developers.

- Add an entry under `## [Unreleased]` in the same PR as the change (part of DoD).
- Sections: *Added, Changed, Deprecated, Removed, Fixed, Security*.
- On release, rename *Unreleased* to the version and date.

## Release notes

GitHub Release per tag. Structure: one-paragraph summary → highlights (with screenshots) → full changelog section → known issues.
