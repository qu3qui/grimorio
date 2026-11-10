# 10 · Metrics & views

Few metrics, all computed automatically from fields you already fill (status and two dates).
Setup instructions for each view are in [`notion-setup.md`](../templates/notion/notion-setup.md#6-views-and-charts).

## The six views

| # | View | Where | Answers | Built from |
|---|---|---|---|---|
| 1 | **Kanban** | Tasks DB, board by *Status* | What am I doing now? | Status |
| 2 | **Milestone timeline** | Milestones DB, timeline with dependencies | Are milestones sequenced and on time? | Start/End dates, *Blocked by* |
| 3 | **Progress** | Milestones & Features DBs, progress bars | How far along is each milestone/feature? | Rollup: % of tasks Done |
| 4 | **Throughput** | Tasks DB: bar chart (Project Management page), *Weekly flow* table (project hub) | How many tasks do I finish per week? | Count of Done tasks by week of *Completed* |
| 5 | **Cycle time** | Tasks DB: *Weekly flow* table (Project Management page and project hub) + *Aging WIP* list | How long does a task take? What's stuck? | `Completed − Started` (days) |
| 6 | **Portfolio** | Projects DB, gallery/table | Which projects are active and healthy? | Phase, Health, next milestone, last activity |

Notion's free plan allows one chart view per workspace, so Throughput is the only chart, across all projects, on the Project Management page. Cycle time comes from *Weekly flow* tables (all projects on the Project Management page, one project in its hub): the group count is throughput, the group footer is cycle time.

## How to read them

**Throughput** (tasks/week). Your real capacity. Use the average of the last 4 weeks to sanity-check milestone dates:
`weeks needed ≈ remaining tasks ÷ avg throughput`. Wildly off from the timeline → re-plan.

**Cycle time** (days from *Started* to *Completed*).

- Healthy for XS–M tasks at 5–15 h/week: **median ≤ 5 days**.
- Rising cycle time usually means tasks are too big or WIP is too high.
- **Aging WIP** (In Progress for > 5 days) is the early warning — act on it in the weekly review.

**Progress vs. time.** A milestone at 40% done with 70% of its time elapsed is *At risk*: cut scope or move the date.

**Portfolio health.** One project in *Build* at a time. Projects with no activity for 30 days get a decision: resume, pause or archive.

## Deliberately not tracked

- **Estimated vs. actual hours.** Logging time costs more than it teaches at this scale; size (XS/S/M) + cycle time give enough calibration.
- **Story points / velocity / burndown.** They belong to sprint-based processes; throughput replaces them in kanban.
- **Lines of code, commit counts.** Activity isn't progress.
