# Decision Example

Non-authoritative example.

- Decision ID: `0004`
- Status: `accepted`
- Author or owner: `planning session`

Context:

Booking confirmation could be synchronous or queued. Early implementation needs
one rule to avoid story drift.

Decision:

Treat confirmation as asynchronous boundary behavior so booking creation and
confirmation delivery can be proven separately.

Affected artifacts:

- `docs/product/booking-workflow.md`
- `docs/templates/story.md`
- `docs/TEST_MATRIX.md`
