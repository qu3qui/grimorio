# {{PROJECT_NAME}}

{{ONE_LINE_PITCH}}

[![CI](https://github.com/{{GITHUB_REPO}}/actions/workflows/ci.yml/badge.svg)](https://github.com/{{GITHUB_REPO}}/actions/workflows/ci.yml)

## Status

**Phase:** Discovery · **Version:** unreleased · **Board:** [Notion]({{NOTION_PROJECT_URL}})

<!-- On close (see workflow phase 7): current state, known issues, next ideas, how to resume. -->

## Features
<!-- User-facing list, updated each release. -->
- …

## Getting started

### Requirements

- {{STACK}}
- [pre-commit](https://pre-commit.com)

### Setup

```bash
git clone https://github.com/{{GITHUB_REPO}}.git
cd {{PROJECT_SLUG}}
{{CMD_INSTALL}}
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

### Common commands

| Task | Command |
|---|---|
| Run | `{{CMD_RUN}}` |
| Test (with coverage) | `{{CMD_TEST}}` |
| Lint | `{{CMD_LINT}}` |
| Format | `{{CMD_FORMAT}}` |
| Type check | `{{CMD_TYPECHECK}}` |
| All hooks | `pre-commit run --all-files` |

## Documentation

| Doc | Purpose |
|---|---|
| [Project brief](docs/project-brief.md) | Problem, goals, MVP scope, non-goals |
| [Design](docs/design.md) | Penpot links, user flows, screen inventory |
| [Architecture](docs/architecture.md) | Stack, C4 diagrams, data model, structure |
| [Decisions (ADRs)](docs/adr/) | Why things are the way they are |
| [Feature specs](docs/specs/) | Detailed specs for complex features |
| [User manual](docs/user-manual.md) | How to use the app |
| [Changelog](CHANGELOG.md) | What changed in each release |

## Contributing (future me)

Workflow: task in Notion → branch `feat/{{PROJECT_PREFIX}}-<n>-slug` → Conventional Commits → PR (template) → squash merge.
See `CLAUDE.md` for conventions.
