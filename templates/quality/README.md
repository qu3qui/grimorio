# Quality presets

One folder per stack. Each contains the same pieces, so `/project-bootstrap` can apply any of them the same way:

| File | Goes to |
|---|---|
| `README.md` | Tool choices, setup steps, values for the `{{CMD_*}}` placeholders, Dependabot entry |
| config file(s) | Project root (`pyproject.toml`, `biome.json`, `analysis_options.yaml`, …) |
| `pre-commit-hooks.yaml` | Appended under `repos:` in `.pre-commit-config.yaml` |
| `ci.yml` | Replaces `.github/workflows/ci.yml` |

| Stack | Folder |
|---|---|
| Python | [`python/`](python/) |
| TypeScript (web / Node) | [`typescript/`](typescript/) |
| Flutter / Dart | [`flutter/`](flutter/) |

Adding a stack: copy the closest folder, pick one tool per concern (formatter, linter, type checker, test runner + coverage threshold), and keep the three CI jobs (`pre-commit`, `secrets`, `quality`). See [guide chapter 12](../../guide/12-code-quality.md).
