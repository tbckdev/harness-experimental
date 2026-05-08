# Traceability

Version: 0.1  
Status: active

This document defines minimum link expectations across product docs, stories,
proof rows, validation reports, decisions, and backlog items.

Traceability exists to reduce guessing. It should make it possible to answer:

- where did this behavior come from
- what packet changed it
- what proof is expected
- what evidence exists
- why important contract choices were made

## Minimum Rules

### Product Docs

Accepted product docs should be linkable from the stories that implement or
change them.

A product doc should be able to answer:

- what area of product truth it covers
- which story packets are touching it now or historically

### Story Packets

Every non-trivial story packet should link:

- relevant product docs
- relevant test matrix rows, or planned row IDs
- relevant decisions when policy or architecture matters

A story packet should not force readers to rediscover its source contract.

### Test Matrix Rows

Every meaningful row should point back to:

- source doc or operating doc
- story packet or `n/a` if documentary only
- proof owner and current status

### Validation Reports

Every validation report should link:

- story packet or reviewed artifact
- relevant matrix rows
- decisions if the validation exposed policy-sensitive behavior

### Decisions

Decision records should reference affected surfaces where practical:

- product docs
- story packets
- test matrix policy
- harness workflow docs

### Harness Backlog Items

Backlog items should reference:

- where the friction was discovered
- what part of the harness it affects
- whether decision record may be required later

## Orphan Detection Checklist

During review, check for these orphan patterns:

- story with no product-doc links
- story with no proof row links
- validation report with no story reference
- changed behavior row with no fresh evidence plan
- decision with no visible affected surface
- backlog item with no discovery context

If an orphan exists, either fix the links or explain why the exception is intentional.
