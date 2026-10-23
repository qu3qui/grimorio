---
name: milestone-release
description: Close a milestone of a personal project — analyze git history since the last tag, propose the SemVer version, update CHANGELOG.md, draft GitHub release notes, find stale docs (user manual, architecture, README), and draft the milestone retro. Tags, pushes and publishes only after explicit confirmation.
disable-model-invocation: true
---

# Milestone release (Phase 6)

## 1. Collect facts

```bash
git fetch --tags
git describe --tags --abbrev=0            # last tag (none → first release)
git log <last-tag>..HEAD --oneline --no-merges
git diff --stat <last-tag>..HEAD
```

- Check the working tree is clean and you're on an up-to-date `main`; stop and report if not.
- If `gh` is available, check CI status of `main`: `gh run list --branch main --limit 1`.
- Group commits by Conventional Commit type; extract task keys (e.g. `PAN-12`).

## 2. Propose the version

SemVer rules from `guide/11-git-and-release.md` of the Grimorio repo:

- Before 1.0.0: any `feat` → bump minor; only `fix`/others → bump patch.
- From 1.0.0: `BREAKING CHANGE`/`!` → major; `feat` → minor; else patch.

Ask the user to confirm the version and the milestone name.

## 3. CHANGELOG

- Move `## [Unreleased]` entries into `## [X.Y.Z] - YYYY-MM-DD` (Keep a Changelog sections: Added, Changed, Deprecated, Removed, Fixed, Security).
- Cross-check against the commits: list user-visible commits that have **no** changelog entry and propose entries written for users (not developers).
- Leave a fresh empty `## [Unreleased]` section on top.

## 4. Docs staleness check

- If user-visible features changed but `docs/user-manual.md` wasn't modified since the last tag → list which sections likely need updates.
- If new modules/dependencies appeared but `docs/architecture.md` wasn't touched → flag it.
- Update the version line in `docs/user-manual.md` and the README *Status* section.

## 5. Release notes

Write `.workflow/release/vX.Y.Z.md` (git-ignored): one-paragraph summary → highlights (placeholders for screenshots) → this version's CHANGELOG section → known issues.

## 6. Retro draft

Ask the user to paste from Notion: milestone dates (planned/actual), task counts (done / moved out), median cycle time, average throughput. Then draft the retro following `templates/notion/milestone-retro.md`: facts table, observations from the git history (e.g. long-lived branches, many fix commits after features), and 1–3 suggested actions. The user edits and pastes it into Notion.

## 7. Ship (only after explicit confirmation)

Commit `docs: release vX.Y.Z` (or open a PR if `main` is protected), then after merge:

```bash
git tag -a vX.Y.Z -m "vX.Y.Z — <milestone name>"
git push origin vX.Y.Z
gh release create vX.Y.Z --title "vX.Y.Z — <milestone name>" --notes-file .workflow/release/vX.Y.Z.md
```

## Report

Version, CHANGELOG diff summary, stale docs, release notes path, retro draft, and the Notion updates to make (milestone *Done*, *Release* URL, plan next milestone).
