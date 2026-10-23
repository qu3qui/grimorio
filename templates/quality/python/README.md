# Quality preset — Python

| Concern | Tool |
|---|---|
| Package/env manager | [uv](https://docs.astral.sh/uv/) |
| Format + lint | [Ruff](https://docs.astral.sh/ruff/) (`ruff format`, `ruff check`) |
| Types | [mypy](https://mypy.readthedocs.io/) strict |
| Tests + coverage | pytest + pytest-cov (fail under 70%) |
| Dependabot ecosystem | `uv` (use `pip` if the project uses `requirements.txt`) |

## Apply to a project

1. `uv init` (or existing project), then add dev tools:

   ```bash
   uv add --dev ruff mypy pytest pytest-cov
   ```

2. Merge `pyproject.snippet.toml` into `pyproject.toml` (adjust `src` package path and Python version).
3. Append `pre-commit-hooks.yaml` to the repo's `.pre-commit-config.yaml` (under `repos:`).
4. Replace `.github/workflows/ci.yml` with `ci.yml` from this folder.
5. Add the `uv` ecosystem to `.github/dependabot.yml`.

## Placeholder values for `/project-bootstrap`

| Placeholder | Value |
|---|---|
| `{{CMD_INSTALL}}` | `uv sync` |
| `{{CMD_RUN}}` | `uv run python -m <package>` |
| `{{CMD_TEST}}` | `uv run pytest` |
| `{{CMD_LINT}}` | `uv run ruff check .` |
| `{{CMD_FORMAT}}` | `uv run ruff format .` |
| `{{CMD_TYPECHECK}}` | `uv run mypy src` |

## Dependabot entry

```yaml
  - package-ecosystem: uv
    directory: /
    schedule:
      interval: weekly
    commit-message:
      prefix: build
    groups:
      dev-dependencies:
        dependency-type: development
```
