# Tasks — Expiry alerts (output of `/task-breakdown`)

Feature: **Expiry alerts** · Milestone: **M1 · MVP core** · Spec: `docs/specs/expiry-alerts.md`

---

## Compute expiry status for an item

**Type:** Feature task · **Priority:** P1 · **Size:** S · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** No UI

### Context / why

Every expiry feature (list, home card, notification) needs the same rule for *ok / soon / expired*. Implements spec R1, R2, R5.

### Scope

**In:** pure function `expiryStatus(expiresOn, today, windowDays)` in `domain/`, unit tests.
**Out:** UI, settings storage.

### Acceptance criteria

- [ ] **Given** `expiresOn` = today + window, **when** computed, **then** status is *soon*.
- [ ] **Given** `expiresOn` = yesterday, **then** *expired*; **given** today + window + 1, **then** *ok*.
- [ ] **Given** no expiry date, **then** *ok*.
- [ ] Unit tests cover all boundaries; coverage of the file 100%.

### Technical notes

Pass `today` as a `DateTime` date (no time) — the caller gets it from an injected `Clock`.

---

## Show expiring-soon list with empty state

**Type:** Feature task · **Priority:** P1 · **Size:** M · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** Penpot → 02 Wireframes → Expiring soon

### Context / why

Scenario 2: see what to use first when planning meals.

### Scope

**In:** `GetExpiringSoon` use case, drift query, *Expiring soon* screen with expired-first ordering and empty state.
**Out:** Home card, notifications.

### Acceptance criteria

- [ ] **Given** items expiring today, in 2 and in 10 days and window 3, **when** I open the screen, **then** I see the first two sorted ascending.
- [ ] **Given** an expired item, **then** it's first, labeled "Expired" with icon + error color.
- [ ] **Given** nothing in the window, **then** the empty state "Nothing expiring soon 🎉" shows.
- [ ] Repository test against in-memory drift DB.

### Technical notes

Window comes from settings (default 3 until the settings task lands — read it through a provider).

---

## Add "Expiring soon" card to Home

**Type:** Feature task · **Priority:** P2 · **Size:** S · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** Penpot → 03 Key screens → Home

### Context / why

Make expiring items visible without navigating (brief goal "make it a habit").

### Scope

**In:** card with count and top 3 names; tap opens *Expiring soon*.
**Out:** changes to other Home cards.

### Acceptance criteria

- [ ] **Given** 4 items expiring, **then** the card shows "4 expiring soon" and three names.
- [ ] **Given** none, **then** the card shows "Nothing expiring soon".
- [ ] Tapping the card opens *Expiring soon*.

---

## Add expiry window and notification time settings

**Type:** Feature task · **Priority:** P1 · **Size:** M · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** Penpot → 02 Wireframes → Settings

### Context / why

The window and reminder time are personal; spec section 4.

### Scope

**In:** settings table/migration, Settings screen fields (window 1–14, time picker), providers.
**Out:** other settings.

### Acceptance criteria

- [ ] **Given** a fresh install, **then** window = 3 and time = 08:00.
- [ ] **Given** I set the window to 5, **when** I open *Expiring soon*, **then** items within 5 days show.
- [ ] Values outside 1–14 can't be saved.
- [ ] drift migration test passes.

---

## Schedule daily expiry notification

**Type:** Feature task · **Priority:** P1 · **Size:** M · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** No UI (notification copy in spec)

### Context / why

Scenario 2 without having to remember to open the app. Spec R3, R4.

### Scope

**In:** `NotificationScheduler`, daily schedule at the configured time, reschedule on settings change, tap opens *Expiring soon*.
**Out:** snooze, multiple notifications.

### Acceptance criteria

- [ ] **Given** 4 items expiring, **when** the daily time arrives, **then** one notification lists the count and first three names.
- [ ] **Given** 0 items, **then** no notification.
- [ ] **Given** I change the time, **then** the next notification uses the new time.
- [ ] Verified manually on a real Android device.

### Technical notes

Based on spike PAN-3: inexact daily alarm is fine. Keep the scheduler behind an interface so use cases are unit-testable.

---

## Handle denied notification permission

**Type:** Feature task · **Priority:** P2 · **Size:** S · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** Penpot → 02 Wireframes → Settings (notifications denied)

### Context / why

On Android 13+ the user can deny notifications; the app must explain and recover.

### Acceptance criteria

- [ ] **Given** permission denied, **when** I open Settings, **then** I see the explanation and an "Open system settings" button.
- [ ] **Given** I grant it in system settings and return, **then** the warning disappears and the notification is scheduled.

---

## Document expiry alerts in the user manual

**Type:** Docs · **Priority:** P2 · **Size:** XS · **Feature:** Expiry alerts · **Milestone:** M1 · MVP core
**Design:** No UI

### Context / why

Definition of Done for user-visible features; the manual is reviewed at release.

### Acceptance criteria

- [ ] `docs/user-manual.md` has "How to… see what's expiring" and "How to… change the reminder time", with screenshots.
- [ ] Troubleshooting entry for "I don't get notifications".
