# 01 · Phase 0 — Idea intake

## Goal

Capture every idea cheaply, and stop yourself from coding it the same day.
Only ideas that still look good after a cool-down become projects.

## Inputs

- A spark: a problem you hit, a habit you want to track, something you saw.

## Steps

1. **Capture (2 min).** Create a page in the Notion *Ideas* database using the [idea template](../templates/notion/idea.md).
   Write the problem, not the solution: *"I throw away food because I forget what's in the pantry"*, not *"pantry app with barcode scanner"*.
2. **Cool down (≥ 7 days).** Set *Revisit on* to one week later. Do not open an editor.
3. **Score (10 min)** when revisiting. Each 1–5:

   | Criterion | Question |
   |---|---|
   | Value | How much would this improve my life (or others') if it existed? |
   | Excitement | Will I still want to work on this in a month? |
   | Learning | Does it teach me something I want to learn? |
   | Effort (inverted) | 5 = a few weekends, 1 = months of work |

   `Score = Value + Excitement + Learning + Effort` (max 20). The Notion formula computes it.

4. **Decide.**
   - Score ≥ 14 and you have capacity (no other project in *Build*) → **Pursue**.
   - Otherwise → **Parked** (revisit later) or **Discarded** (write one line why).
5. **Promote.** On *Pursue*: create a page in *Projects* (from the [project hub template](../templates/notion/project-hub.md)),
   pick a 3-letter **prefix** (e.g. `PAN`), relate it to the idea, set *Phase = Discovery*.

## Deliverables

- Idea card with problem statement, score and decision.
- (If pursued) Project page with prefix and phase.

## Exit gate

- [ ] Cool-down of at least 7 days respected.
- [ ] Score filled and decision recorded.
- [ ] At most **one** project in *Build* at a time (finish or pause before starting another).

## Where it lives

Notion only (*Ideas*, *Projects*).

## How Claude helps

Ask Claude to challenge the idea before you score it:
> "Here is my idea card. Play devil's advocate: what existing apps solve this, what's the smallest version that would be useful, and what would make me abandon it?"
