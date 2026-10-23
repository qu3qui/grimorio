# 07 · Phase 6 — Release (per milestone)

## Goal

Close each milestone with a **versioned, documented release** and a short **retro**, so every milestone leaves the project in a state you could walk away from.

## Inputs

- All milestone tasks *Done* (or explicitly moved to another milestone).

## Steps

1. **Scope check.** Any open tasks? Move them to the next milestone or Backlog — don't stretch the milestone.
2. **Version.** Pick the version from [SemVer](https://semver.org/) rules (see [chapter 11](11-git-and-release.md)). Before 1.0.0, new features bump the *minor* (`0.1.0 → 0.2.0`).
3. **CHANGELOG.** Move *Unreleased* entries to a new `## [x.y.z] - YYYY-MM-DD` section. Check every user-visible change is there.
4. **User manual.** Read `docs/user-manual.md` top to bottom against the app. Update screenshots if UI changed.
5. **Tag and release.**

   ```bash
   git tag -a v0.2.0 -m "v0.2.0 — MVP complete"
   git push origin v0.2.0
   gh release create v0.2.0 --title "v0.2.0 — MVP complete" --notes-file .workflow/release/v0.2.0.md
   ```

6. **Deploy** (if applicable) and smoke-test the main scenario on the deployed version.
7. **Retro (20 min).** Fill the [milestone retro](../templates/notion/milestone-retro.md) in Notion: planned vs delivered, cycle time, what went well, what didn't, 1–3 actions.
   Actions about the *project* → tasks. Actions about the *workflow* → change this repo.
8. **Close the milestone** in Notion (*Status = Done*, *Release* URL) and start [planning](05-planning.md) the next one.

## Deliverables

- Git tag + GitHub Release with notes.
- `CHANGELOG.md` section.
- User manual current.
- Retro page in Notion.

## Exit gate

- [ ] Tag pushed, release published, deploy smoke-tested.
- [ ] CHANGELOG and user manual updated.
- [ ] Retro filed with actions.
- [ ] Milestone *Done* in Notion.

## How Claude helps

**`/milestone-release`** reads `git log` since the last tag, proposes the version, writes the CHANGELOG section and release notes, lists docs that may be stale, and drafts the retro with metrics you paste from Notion.
