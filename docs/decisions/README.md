# Decisions

Decision records explain why important product, architecture, proof-policy, or
harness-workflow choices changed.

Use `docs/templates/decision.md` when adding a new decision.

## Create Decision When

Create a decision record when one of these is true:

- architecture direction becomes materially constrained
- accepted product rule changes in a way future maintainers might debate
- validation or proof policy changes materially
- harness workflow or source-of-truth policy changes materially
- traceability or versioning rule changes in a durable way

## Use Backlog Instead When

Use `docs/HARNESS_BACKLOG.md` instead of a decision record when:

- friction is real but solution is not yet settled
- the issue is a missing capability proposal, not an accepted policy
- the repo needs future improvement but not immediate contract change

## Numbering

Suggested naming:

```text
0001-short-title.md
0002-short-title.md
0003-short-title.md
```

Use the next available number in sequence.

## Status Values

Typical decision states:

- `proposed`: discussed but not yet accepted as active rule
- `accepted`: current active reasoning to follow
- `superseded`: replaced by later decision
- `retired`: no longer meaningful as active rule

If status is omitted in older files, treat accepted historical repo decisions as
current unless another document clearly replaced them.

## Linking Expectations

When practical, a decision should mention affected surfaces such as:

- `docs/product/...`
- `docs/stories/...`
- `docs/TEST_MATRIX.md`
- `docs/HARNESS.md`
- templates or workflow docs

## Follow-Up

Add follow-up notes when:

- later file updates are required to honor the decision
- migration or cleanup remains unfinished
- a future story must implement the decision's consequence
