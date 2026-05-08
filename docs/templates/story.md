# US-XXX Story Title

Version: 0.1  
Status: active

Use this template for bounded normal-lane work.

Suggested path:

```text
docs/stories/epics/E01-domain-name/US-001-short-story-title.md
```

## Story Metadata

- Story ID: `US-XXX`
- Epic ID: `E##` or `none`
- Status: `planned | in_progress | implemented | changed | blocked | retired`
- Lane: `normal`
- Owner: `name or session`
- Handoff target: `human reviewer | agent executor | mixed`

## Story Intent

Describe the outcome in one short paragraph.

Cover:

- who or what benefits
- what behavior changes
- why this story is bounded enough to stand alone

## Product Contract

Describe the accepted behavior this story should deliver or update.

If product truth already exists, summarize only the slice this story changes.
If product truth does not yet exist, this story should not pretend it does; it
must either include product-doc update as first-class work or stop.

## Relevant Product Docs

List exact product-doc references.

- `docs/product/...`
- note whether each doc is read-only context or requires update in this story

## Dependencies

List work or truth this story depends on.

Examples:

- product doc must be created first
- another story must land first
- decision record must exist first
- provider contract must be known first

## Blocked By / Enables

### Blocked By

List current blockers, if any.

### Enables

List likely downstream work this story unlocks.

## Related Decisions

List relevant decision records or decision topics.

- `docs/decisions/...`
- or `none currently`

If the story may force a new decision, name the likely topic.

## Linked Test Matrix Rows

List proof rows from `docs/TEST_MATRIX.md`.

- existing row IDs
- or planned row IDs if the story introduces accepted behavior that still needs row creation

## Acceptance Criteria

Write criteria in reviewable, behavior-focused language.

Each criterion should describe:

- trigger or context
- expected outcome
- observable success condition

Prefer 3–7 criteria. If more are needed, the story may be too broad.

## Non-Goals

State what this story will deliberately not solve.

This section prevents silent scope growth.

## Open Questions

List unresolved questions that do not block planning but still matter.

If a question blocks truthful execution, move it to blockers instead.

## Design Notes

Capture only the design detail needed for execution and review.

Possible contents:

- domain rule summary
- interface touch points
- data concerns
- failure cases
- observability needs
- migration or compatibility notes

Do not rewrite broad architecture here if `docs/ARCHITECTURE.md` already covers it.

## Validation

Describe expected proof for this story.

Cover:

- required proof level: document review, unit, integration, end-to-end, platform
- linked commands if they exist
- proof that does not exist yet but should later exist
- what evidence will count as completion for current repo state

## Rollback or Containment Note

If the story changes a reusable contract or risky surface, explain how damage is
contained if the result is wrong.

For low-risk documentation stories, state that rollback is straightforward via
git revert or doc correction.

## Harness Delta

Record whether this story revealed a harness weakness.

Examples:

- missing template field
- unclear traceability rule
- weak backlog grouping
- validation ambiguity

If nothing new was learned, state `none`.

## Evidence

After work is reviewed or completed, add:

- validation report path if one exists
- commands run or note that no executable commands exist
- screenshots or artifacts if relevant
- brief note of remaining gaps, if any
