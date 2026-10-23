# 03 · Phase 2 — Design (Penpot)

## Goal

Decide **what the user sees and does** before writing code. Design is the cheapest place to change your mind.

## Inputs

- `docs/project-brief.md` (Must features and scenarios).

## Tool: Penpot

[Penpot](https://penpot.app) — open source, free, browser-based, exports SVG/CSS.
One Penpot **project** per app, with this page structure:

| Page | Content |
|---|---|
| `00 Cover` | App name, version of the design, link to repo |
| `01 User flows` | Flow diagrams per scenario |
| `02 Wireframes` | Low-fidelity, grayscale, every MVP screen |
| `03 Key screens` | High-fidelity, 2–3 most important screens |
| `04 Style guide` | Colors, typography, spacing, core components |

## Steps

1. **User flows (1 per scenario).** Boxes for screens, arrows for actions, diamonds for decisions. Cover the happy path plus the main error/empty states.
   Tip: simple flows can also be written in Mermaid inside `docs/design.md`.
2. **Screen inventory.** List every screen the flows touch. Each screen maps to ≥ 1 Must feature; each Must feature maps to ≥ 1 screen.
3. **Low-fi wireframes.** Grayscale boxes and real-ish text. Use a fixed device frame (e.g. 390×844 for mobile, 1440 for web). Don't pick colors yet.
   Include **empty**, **loading** and **error** states for list screens.
4. **Click-through check.** Wire the wireframes as a Penpot prototype and walk every scenario. Fix dead ends.
5. **Style guide (mini).** 1 primary + 1 accent + neutrals, 1 font family with 3–4 sizes, spacing scale (4/8/16/24/32), buttons, inputs, cards, list items.
6. **Hi-fi key screens.** Apply the style guide to the 2–3 screens that define the app (usually the home/dashboard and the main create/edit screen).
7. **Document.** Fill `docs/design.md`: Penpot links (per page), flows, screen inventory table, design decisions, and accessibility notes.

### Accessibility minimums

- Text contrast ≥ 4.5:1 (WCAG AA). Touch targets ≥ 44×44 pt.
- Don't encode meaning with color alone (add icon or text).
- Every input has a visible label.

## Deliverables

- Penpot file with the 5 pages.
- `docs/design.md` from the [design template](../templates/repo/docs/design.md).
- Each Notion feature gets its Penpot link (`Design` property).

## Exit gate

- [ ] Every Must feature has a user flow **and** a wireframe.
- [ ] Empty/error states designed for list and form screens.
- [ ] Prototype walk-through done for every scenario.
- [ ] 2–3 key screens in hi-fi following the style guide.
- [ ] Project *Phase* → **Architecture**.

## Where it lives

Penpot (source), repo `docs/design.md` (index + decisions), Notion features (links).

## How Claude helps

- Paste the brief and ask for a **screen inventory and user flows in Mermaid** as a starting point for Penpot.
- Share screenshots of wireframes and ask for a **UX review** against the scenarios and the accessibility minimums.
