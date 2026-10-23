# ADR-0002: Use Flutter with drift (SQLite) for offline storage

- **Status:** Accepted
- **Date:** 2026-10-26
- **Task:** PAN-1

## Context

The brief requires an Android-first, fully offline, single-user app with zero hosting cost. Learning Flutter with a local database is an explicit project goal. Data is relational (items, locations, events, shopping entries) and the waste metric needs queries over event history.

## Options considered

| Option | Pros | Cons |
|---|---|---|
| Flutter + drift (SQLite) | Relational queries, type-safe generated code, migrations, in-memory DB for tests | Code generation step (`build_runner`) |
| Flutter + Isar/Hive (NoSQL) | Very fast, simple API | Aggregations over history are awkward; maintenance status of some packages uncertain |
| Native Android (Kotlin + Room) | Best platform integration | Doesn't meet the Flutter learning goal; no iOS path |

## Decision

We will build the app with Flutter and store data in SQLite through drift, with Riverpod for state management.

## Consequences

**Positive:** relational model fits the domain; repository tests run against an in-memory database; iOS stays possible.
**Negative / trade-offs:** `build_runner` adds a generation step to the dev loop and CI; schema migrations must be written for every model change.
**Follow-ups:**

- [ ] Add `dart run build_runner build` to CI before analyze (PAN-2)
- [ ] Exclude `*.g.dart` from coverage and analysis (done in the quality preset)
