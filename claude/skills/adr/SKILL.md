---
name: adr
description: Create a numbered Architecture Decision Record in docs/adr/ of a personal project using the workflow template (context, options with pros/cons, decision, consequences) and update the ADR index in docs/architecture.md. Use when a significant technical decision is made or needs to be made, or to record decisions retroactively.
---

# ADR

## Steps

1. **Number.** List `docs/adr/` and take the next number (4 digits, e.g. `0004`). Template: `docs/adr/0000-template.md` (fallback: `templates/repo/docs/adr/0000-template.md` in the Grimorio repo, resolved from this skill's real path three directories up).
2. **Title** in imperative form describing the decision: *Use Supabase for auth and storage*. If the decision isn't made yet, title it as the question and set *Status: Proposed*.
3. **Context.** Gather from the conversation, `docs/project-brief.md` (constraints) and `docs/architecture.md` (NFRs). Facts and forces only.
4. **Options.** At least two real options (doing nothing counts). Pros/cons tied to the NFRs and constraints, not generic.
5. **Decision.** "We will …". Recommend one if the user hasn't decided, but the user sets the status — use *Proposed* unless they explicitly accept it.
6. **Consequences.** Positive, negative/trade-offs, follow-ups (as checklist; suggest Notion tasks for them).
7. **Superseding?** If this replaces an earlier ADR, set the old one's status to *Superseded by ADR-NNNN* (the only edit allowed to an accepted ADR).
8. Write `docs/adr/NNNN-<kebab-title>.md` and add a row to the *Decisions* index table in `docs/architecture.md`.
9. **Retroactive ADRs** (existing projects): date them today and add "Recorded retroactively" in the Context.

## Report

Path, status, and follow-up tasks to create.
