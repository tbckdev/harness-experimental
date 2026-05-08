# Stories

This folder holds execution-ready work packets.

Stories are not broad specs. They are bounded contracts for one change or one
reviewable slice of work.

## Story Shapes

### Normal Story

Use `docs/templates/story.md` for bounded normal-lane work.

Suggested path:

```text
docs/stories/epics/E01-domain-name/US-001-short-story-title.md
```

### High-Risk Story

Use folder-based packet from `docs/templates/high-risk-story/` when risk,
coordination, or rollback needs exceed a single-file story.

Suggested path:

```text
docs/stories/epics/E01-domain-name/US-010-short-story-title/
  overview.md
  design.md
  execplan.md
  validation.md
```

## When To Use Which Shape

Use single-file story when:

- one bounded slice can be reviewed in one artifact
- blast radius is limited
- rollback is simple
- proof plan is straightforward

Use high-risk packet when:

- phased work matters
- go/no-go checkpoint matters
- rollback thinking must be explicit
- multiple surfaces or risky boundaries move together

## Required Links

Every non-trivial story should link:

- relevant product docs or harness docs
- relevant matrix rows or planned row IDs
- relevant decision records when material

## Status Flow

Common story states:

- `planned`
- `in_progress`
- `implemented`
- `changed`
- `blocked`
- `retired`

Choose status for clarity, not ceremony.

## Evidence Placement

Evidence belongs in:

- story `Evidence` section for quick local visibility
- validation report for durable proof detail
- `docs/TEST_MATRIX.md` for control-plane status

Do not bury completion claims only in chat or commit history.
