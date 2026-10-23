# Pantry — milestones (Notion snapshot)

| Milestone | Version | Dates | Blocked by | Goal | Features |
|---|---|---|---|---|---|
| M0 · Walking skeleton | v0.0.1 | 2026-11-02 → 2026-11-08 | — | App runs on my phone, reads/writes one item to SQLite, CI green | — |
| M1 · MVP core | v0.1.0 | 2026-11-09 → 2026-12-06 | M0 | I can log items with expiry dates and see what expires soon | Item inventory, Expiry alerts |
| M2 · MVP complete | v0.2.0 | 2026-12-07 → 2027-01-10 | M1 | I shop from an auto-generated list | Shopping list, Low-stock threshold, User manual |
| M3 · Shoulds | v0.3.0 | 2027-01-11 → 2027-02-07 | M2 | Faster capture and backups | Quick add from history, Export/import JSON |

Feature → milestone (MoSCoW):

| Feature | MoSCoW | Milestone |
|---|---|---|
| Item inventory (add/edit/remove, quantity, location) | Must | M1 |
| Expiry alerts (expiring soon list + daily notification) | Must | M1 |
| Shopping list (auto from low stock + manual) | Must | M2 |
| Low-stock threshold per item | Must | M2 |
| Quick add from history | Should | M3 |
| Export / import JSON backup | Should | M3 |
| Barcode scanning | Could | — |
