# ADR-0001: Record architecture decisions

- **Status:** Accepted
- **Date:** {{DATE}}

## Context

Decisions about stack, structure and trade-offs are easy to forget after a few months away from a personal project. Re-deriving them wastes time and invites accidental reversals.

## Options considered

| Option | Pros | Cons |
|---|---|---|
| No records | Zero effort | Decisions forgotten, re-litigated |
| Notes in Notion | Close to planning | Drifts from code; not visible to Claude in the repo |
| ADRs in `docs/adr/` | Versioned with code, reviewable in PRs, visible to Claude | Small writing effort |

## Decision

We will record significant decisions as ADRs in `docs/adr/`, numbered sequentially, using `0000-template.md`. ADRs are immutable once accepted; changes are made by a new ADR that supersedes the old one.

## Consequences

**Positive:** decisions and their context survive; onboarding future-me and Claude is faster.
**Negative / trade-offs:** ~10 minutes per decision.
**Follow-ups:** link the ADR index from `docs/architecture.md`.
