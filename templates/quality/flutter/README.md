# Quality preset — Flutter / Dart

| Concern | Tool |
|---|---|
| Format | `dart format` |
| Lint + static analysis | `flutter analyze` with [very_good_analysis](https://pub.dev/packages/very_good_analysis) (strict casts/inference/raw types) |
| Tests + coverage | `flutter test --coverage` + [very_good_coverage](https://github.com/VeryGoodOpenSource/very_good_coverage) action (min 70%) |
| Dependabot ecosystem | `pub` |

## Apply to a project

1. `flutter pub add --dev very_good_analysis`
2. Replace `analysis_options.yaml` with the one in this folder.
3. Append `pre-commit-hooks.yaml` to `.pre-commit-config.yaml`; replace `.github/workflows/ci.yml` with `ci.yml`.
4. Pin the Flutter version in `ci.yml` (`flutter-version`) to the one you use locally (`flutter --version`).
5. Add the `pub` ecosystem to `.github/dependabot.yml`.
6. Local coverage check (optional): `dart pub global activate very_good_cli` then `very_good test --coverage --min-coverage 70`.

## Placeholder values for `/project-bootstrap`

| Placeholder | Value |
|---|---|
| `{{CMD_INSTALL}}` | `flutter pub get` |
| `{{CMD_RUN}}` | `flutter run` |
| `{{CMD_TEST}}` | `flutter test --coverage` |
| `{{CMD_LINT}}` | `flutter analyze` |
| `{{CMD_FORMAT}}` | `dart format .` |
| `{{CMD_TYPECHECK}}` | `flutter analyze` (the analyzer is the type checker) |

## Dependabot entry

```yaml
  - package-ecosystem: pub
    directory: /
    schedule:
      interval: weekly
    commit-message:
      prefix: build
```
