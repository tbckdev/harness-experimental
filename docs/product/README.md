# Product Docs

This folder holds accepted product truth after intake.

The repository is still generic. Do not pre-create domain files just to fill
space. Create product docs only when a real project specification or accepted
change requires them.

## Purpose

Product docs replace raw broad input as the living product contract.

They should capture:

- durable user-visible or system-visible behavior
- stable domain terms
- workflows and rules that future stories must follow
- boundaries that stories should not reinterpret each time

## Expected Taxonomy

The exact shape depends on the project. Typical useful doc types include:

- overview
- personas or user types
- domain model
- workflows or journeys
- rules or policies
- interfaces or API contracts
- operational constraints

Not every project needs every type immediately.

## Creation Rule

Create product docs when:

- raw spec has been accepted enough to derive living truth
- multiple stories would otherwise keep rereading the same broad source
- domain rules are stable enough to deserve durable names

Do not create product docs when:

- content is still only speculative
- story packet is sufficient and no reusable truth exists yet
- the repository would end up with generic filler rather than real product truth

## Update Rule

When accepted behavior changes:

1. update the affected product doc
2. update or create the relevant story packet
3. update `docs/TEST_MATRIX.md`
4. record decision if the change affects architecture, scope, proof policy, or
   previously settled product rule

## Relationship To Stories

Product docs answer "what is true now."
Story packets answer "what bounded change is being made now."

Stories should link product docs rather than rewriting them.
