# Quality preset — TypeScript (web / Node)

| Concern | Tool |
|---|---|
| Format + lint | [Biome](https://biomejs.dev/) (`biome check`, `biome ci`) |
| Types | `tsc --noEmit` with strict flags |
| Tests + coverage | [Vitest](https://vitest.dev/) + `@vitest/coverage-v8` (thresholds 70%) |
| Dependabot ecosystem | `npm` |

> Prefer ESLint + Prettier only if the framework requires ESLint plugins (e.g. framework-specific rules). Record that choice in an ADR.

## Apply to a project

1. Install dev tools:

   ```bash
   npm i -D @biomejs/biome typescript vitest @vitest/coverage-v8
   npx @biomejs/biome init   # then merge biome.json from this folder
   ```

2. Merge `tsconfig.strict.json` compiler options into `tsconfig.json`.
3. Merge `vitest.config.ts` (coverage thresholds) into your Vitest/Vite config.
4. Add the scripts from `package.scripts.json` to `package.json` and replace the `build` placeholder with the framework's build command (it fails on purpose until you do).
5. Append `pre-commit-hooks.yaml` to `.pre-commit-config.yaml`; replace `.github/workflows/ci.yml` with `ci.yml`.
6. Add an `.nvmrc` with the Node major version (e.g. `22`).
7. Add the `npm` ecosystem to `.github/dependabot.yml`.

## Placeholder values for `/project-bootstrap`

| Placeholder | Value |
|---|---|
| `{{CMD_INSTALL}}` | `npm ci` |
| `{{CMD_RUN}}` | `npm run dev` |
| `{{CMD_TEST}}` | `npm test` |
| `{{CMD_LINT}}` | `npm run lint` |
| `{{CMD_FORMAT}}` | `npm run format` |
| `{{CMD_TYPECHECK}}` | `npm run typecheck` |

## Dependabot entry

```yaml
  - package-ecosystem: npm
    directory: /
    schedule:
      interval: weekly
    commit-message:
      prefix: build
    groups:
      dev-dependencies:
        dependency-type: development
```
