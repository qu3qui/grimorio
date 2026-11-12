# Quality preset — Android / Kotlin

| Concern | Tool |
|---|---|
| Format | [ktlint](https://pinterest.github.io/ktlint/) via [ktlint-gradle](https://github.com/JLLeitschuh/ktlint-gradle) (`android_studio` style, 120 cols) |
| Lint + static analysis | [detekt](https://detekt.dev) (default config + Compose overrides) and **Android Lint** with `warningsAsErrors` |
| Types | Kotlin compiler (the build is the type check) |
| Tests + coverage | JUnit + [Kover](https://github.com/Kotlin/kotlinx-kover) (`koverVerify`, min 70%) |
| Dependabot ecosystem | `gradle` |

## Apply to a project

1. Add the plugins and blocks from `gradle.snippet.kts` (version catalog, root and app `build.gradle.kts`).
2. Copy `detekt.yml` to `config/detekt/detekt.yml`; append `editorconfig.snippet` to `.editorconfig` and set `indent_size = 4` in `[*]`.
3. Add `.gitattributes` with `* text=auto eol=lf` and `*.bat text eol=crlf` (Windows + `mixed-line-ending` hook), add `exclude: \.bat$` to the `mixed-line-ending` hook, and run `git config core.autocrlf false`.
4. Make sure `gradlew` is executable in git (`git update-index --chmod=+x gradlew`) — repos created on Windows often lose the bit and CI fails on Linux.
5. Append `pre-commit-hooks.yaml` to `.pre-commit-config.yaml`; replace `.github/workflows/ci.yml` with `ci.yml`.
6. Add the `gradle` ecosystem to `.github/dependabot.yml`.
7. Local JDK: AGP needs JDK 17+. On Windows, point `JAVA_HOME` to Android Studio's JBR (`C:\Program Files\Android\Android Studio\jbr`) so the pre-commit hooks can run Gradle.
8. Android Lint `OldTargetApi` fires on CI runners with a newer SDK than yours: bump `targetSdk` or disable the rule with a comment until you do.

### Existing project (retrofit)

1. `./gradlew ktlintFormat` → commit alone as `style: apply ktlint formatting`. Fix what it can't auto-fix.
2. `./gradlew detektBaseline updateLintBaseline` → commit the baselines; new code starts at zero warnings.
3. If coverage is near 0%, start report-only (drop the `kover { verify }` block and `koverVerifyDebug` from CI) and record the decision in an ADR.

## Placeholder values for `/project-bootstrap`

| Placeholder | Value |
|---|---|
| `{{CMD_INSTALL}}` | `./gradlew dependencies` (Gradle resolves on first build) |
| `{{CMD_RUN}}` | `./gradlew installDebug` |
| `{{CMD_TEST}}` | `./gradlew testDebugUnitTest koverHtmlReportDebug` |
| `{{CMD_LINT}}` | `./gradlew detekt lintDebug` |
| `{{CMD_FORMAT}}` | `./gradlew ktlintFormat` |
| `{{CMD_TYPECHECK}}` | `./gradlew compileDebugKotlin` |

## Dependabot entry

```yaml
  - package-ecosystem: gradle
    directory: /
    schedule:
      interval: weekly
    commit-message:
      prefix: build
```
