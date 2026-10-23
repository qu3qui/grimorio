# Spec: Expiry alerts

- **Feature (Notion):** Expiry alerts · **Milestone:** M1 · MVP core · **Status:** Ready
- **Design:** Penpot → 02 Wireframes → *Expiring soon*, *Settings*
- **Last updated:** 2026-11-08

## 1. Summary

Show the items that expire soon and remind me once a day, so I use them before they go bad (brief scenario 2, goal "waste less food").

## 2. User stories & acceptance criteria

- **As** the cook, **I want** a list of items expiring soon, **so that** I plan meals around them.
  - [ ] Given items expiring today, in 2 days and in 10 days, and a window of 3 days, when I open *Expiring soon*, then I see the first two, sorted by expiry date ascending.
  - [ ] Given an item already expired, when I open *Expiring soon*, then it appears at the top labeled "Expired" with the error color and icon.
  - [ ] Given no items within the window, when I open the screen, then I see the empty state "Nothing expiring soon 🎉".
- **As** the cook, **I want** a daily notification, **so that** I don't have to remember to check.
  - [ ] Given 4 items expiring within the window, when the daily time arrives, then I get one notification "4 items expiring soon: milk, spinach, yogurt…".
  - [ ] Given 0 items expiring, when the daily time arrives, then no notification is shown.
  - [ ] Given notifications are denied, when I open Settings, then I see an explanation and a button to open system settings.

## 3. UX

Screens: *Expiring soon* (list, empty state), Home card "Expiring soon (n)", *Settings* (window in days: 1–14, default 3; notification time, default 08:00; denied state).

## 4. Data

| Field | Type | Rules |
|---|---|---|
| `settings.expiry_window_days` | int | 1–14, default 3 |
| `settings.notification_time` | time | default 08:00 |
| `item.expires_on` | date (nullable) | items without date never appear |

## 5. Behavior & rules

1. **R1** — "Expiring soon" = `expires_on <= today + window` and quantity > 0.
2. **R2** — Expired items (`expires_on < today`) are included and shown first.
3. **R3** — One notification per day at most; tapping it opens *Expiring soon*.
4. **R4** — Changing the notification time reschedules the next notification.
5. **R5** — "Today" uses the device's local time zone.

## 6. Technical approach

- Domain: `ExpiryStatus` (ok / soon / expired) computed by a pure function `expiryStatus(expiresOn, today, window)`.
- Application: `GetExpiringSoon` use case; `Clock` injected for testability.
- Infrastructure: `NotificationScheduler` using flutter_local_notifications with a daily repeating schedule; request `POST_NOTIFICATIONS` permission on Android 13+.
- Spike result (PAN-3): inexact daily alarms are acceptable; no exact-alarm permission needed.

## 7. Out of scope

- Per-category windows (open question → later).
- Multiple notifications per day, snooze.

## 8. Testing

- Unit: `expiryStatus` boundaries (today, window edge, expired, null date); `GetExpiringSoon` sorting with a fake clock.
- Integration: repository query against in-memory drift DB.
- Manual: notification on a real Android 14 device; permission denied path.

## 9. Task breakdown

| # | Task | Type | Size |
|---|---|---|---|
| 1 | Compute expiry status for an item | Feature task | S |
| 2 | Show expiring-soon list with empty state | Feature task | M |
| 3 | Add "Expiring soon" card to Home | Feature task | S |
| 4 | Add expiry window and notification time settings | Feature task | M |
| 5 | Schedule daily expiry notification | Feature task | M |
| 6 | Handle denied notification permission | Feature task | S |
| 7 | Document expiry alerts in the user manual | Docs | XS |

## 10. Open questions

- [ ] Per-category windows — revisit after a month of use.
