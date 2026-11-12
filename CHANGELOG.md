# Changelog

All notable changes to the workflow are recorded here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versioning: [SemVer](https://semver.org/).

## [Unreleased]

### Added

- `claude/install.ps1`: Windows skill installer using directory junctions (Git Bash's `ln -s` copies instead of linking).
- "On Windows" section in the README's machine setup (installer, paths, `winget` instead of Homebrew).
- Android / Kotlin quality preset (`templates/quality/android/`): ktlint, detekt, Android Lint as errors, Kover; includes retrofit steps for existing projects.

### Changed

- Notion metrics: Throughput is the only chart (Notion's free plan allows one per workspace) and lives on the Project Management page. Cycle time moves from a chart to *Weekly flow* tables grouped by week of *Completed* — one on the Project Management page, one in the project hub template (replacing its two chart placeholders).
- Notion Projects: *Open tasks* is now a formula counting related tasks not in `Done`, because a rollup's *Count per group* accepts only one status group.

## [1.0.0] - 2026-10-23

First release of **Grimorio** ([github.com/qu3qui/grimorio](https://github.com/qu3qui/grimorio)).

### Added

- Lifecycle guide with 8 phases (idea intake → close), gates and deliverables.
- Design phase with Penpot (user flows, low-fi wireframes, key hi-fi screens).
- Notion workspace setup: Projects, Ideas, Milestones, Features, Tasks databases; kanban with 5 states and WIP limit; timeline with dependencies; progress, throughput, cycle-time and portfolio views.
- Repo templates: README, CLAUDE.md, project brief, design, architecture (C4 + Mermaid), ADRs, feature spec, user manual, CHANGELOG, PR template, CI, Dependabot, pre-commit (incl. gitleaks and Conventional Commits hook).
- Code-quality guide and presets for Python, TypeScript and Flutter.
- Claude Code skills: project-bootstrap, project-brief, feature-spec, task-breakdown, adr, milestone-release (`project-bootstrap` and `milestone-release` are manual-only).
- Workspace `CLAUDE.md` template for the projects folder and a "Setup on a new machine" guide.
- Worked example: pantry manager.
