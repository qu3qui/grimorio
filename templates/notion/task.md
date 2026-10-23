<!--
Notion template for the Tasks database (default template).
Properties to set: Project, Feature, Milestone, Type, Priority, Size (XS/S/M — L means split), Design.
Status starts at Backlog; move to Ready only when the Definition of Ready is met.
Title: verb + object, e.g. "Add expiry date to item form".
-->
---

## Context / why
<!-- Why does this task exist? Link the feature/spec. One or two sentences. -->

## Scope

**In:**

- …

**Out:**

- …

## Acceptance criteria
<!-- Testable. Use Given/When/Then for behavior, checklist for the rest. -->
- [ ] **Given** … **when** … **then** …
- [ ] …

## Design
<!-- Penpot link to the exact board/frame, or "No UI". -->

## Technical notes
<!-- Approach, files/modules likely touched, edge cases, test ideas. Optional for XS. -->

## Definition of Ready

- [ ] Title is verb + object and the *why* is written
- [ ] Acceptance criteria are testable
- [ ] Size ≤ M
- [ ] Design link present (if UI)
- [ ] Dependencies Done or not blocking

## Definition of Done

- [ ] Acceptance criteria met and verified manually
- [ ] Tests added/updated; CI green (lint, types, tests, coverage, build)
- [ ] Docs updated (user manual / architecture / ADR / CLAUDE.md as relevant)
- [ ] CHANGELOG *Unreleased* entry (if user-visible)
- [ ] PR merged (squash), branch deleted; *Completed* date set

## Log
<!-- Dated one-liners: progress, blockers, "next: …" notes for resuming. -->
- YYYY-MM-DD — …
