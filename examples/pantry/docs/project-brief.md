# Project brief — Pantry

> **Status:** Approved · **Last updated:** 2026-10-12 · **Owner:** me

## 1. Problem

About once a week I throw away food that expired because I forgot it was there, and I regularly buy duplicates of things I already have. I don't have a quick way to know what's at home and what's about to expire.

## 2. Users

**Primary user:** me — cooking most days, shopping on Saturdays, using an Android phone.
**Secondary users:** none for now (my partner may use it later — see non-goals).

## 3. Scenarios

1. **Unpacking groceries** — *When I come back from shopping, I want to log what I bought with its expiry date in under a minute, so that the app knows what I have.*
2. **Planning meals** — *When I decide what to cook, I want to see what expires in the next 3 days, so that I use it first.*
3. **Before shopping** — *When I'm about to go shopping, I want a list of what's running low, so that I don't forget anything or buy duplicates.*

## 4. Goals and success metrics

| Goal | Success signal (observable) |
|---|---|
| Waste less food | "Thrown away" removals in the app drop by half between month 1 and month 3 |
| Make it a habit | I open the app ≥ 4 days/week for 4 consecutive weeks |
| Fast capture | Logging a 10-item shop takes ≤ 2 minutes |

## 5. Alternatives considered

| Alternative | Why it doesn't fit |
|---|---|
| Notes app list | No dates, no quantities, no alerts |
| Dedicated pantry apps | Require accounts/cloud, ads, barcode-first flows that are slow for fresh food |

## 6. Scope (MoSCoW)

### Must — MVP

| Feature | Scenario | Notes |
|---|---|---|
| Item inventory (add/edit/remove, quantity, location) | 1 | Remove asks "used" or "thrown away" |
| Expiry alerts | 2 | "Expiring soon" list + one daily notification |
| Shopping list | 3 | Auto from low stock + manual items |
| Low-stock threshold per item | 3 | Default 1 |

### Should — next milestone

- Quick add from purchase history
- Export / import JSON backup

### Could — someday

- Barcode scanning
- Recipe suggestions from expiring items

### Won't (non-goals)

- Accounts, cloud sync or multi-user sharing
- Price tracking or budgeting (that's the finance app's job)
- Nutrition information
- iOS-specific polish (Android first; Flutter keeps iOS possible)

## 7. Constraints

- **Platforms:** Android phone first.
- **Offline / connectivity:** fully offline.
- **Data & privacy:** all data on device; JSON export as backup (Should).
- **Budget / hosting:** zero — no backend.
- **Time:** ~8 h/week.

## 8. Risks and unknowns

| Risk / unknown | Impact | Mitigation or spike |
|---|---|---|
| Local notifications on Android 13+ (permissions, exact alarms) | High | Spike PAN-3 (2 h): schedule a daily notification in the skeleton |
| Capture too slow → habit fails | High | Design the add flow for one-hand use; measure 10-item time in M1 |
| Losing data when changing phones | Med | JSON export in M3; note in user manual |

## 9. Open questions

- Should "expiring soon" be 3 days for everything or per category? → start with a global setting (default 3).
