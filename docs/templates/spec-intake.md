# Spec Intake

Version: 0.1  
Status: active

Use this template when a raw project specification, broad initiative, or large
problem statement must be converted into living repository artifacts.

The output of this file is not implementation. The output is routing, product
truth candidates, epic candidates, and first bounded work.

## Intake Metadata

- Intake ID: `INTAKE-YYYYMMDD-XX`
- Date: `YYYY-MM-DD`
- Owner: `name or session`
- Source type: `new spec | initiative | broad prompt | other`
- Current status: `draft | accepted | superseded`

## Source Fidelity

### Source Material

List exact inputs used for intake.

- File paths, prompt excerpts, links, or uploaded references.
- Note whether the source is complete, partial, or contradictory.

### Missing or Weak Input

Record what the source does **not** answer clearly.

- Missing user roles
- Missing workflows
- Missing technical constraints
- Missing environment assumptions
- Missing success criteria

Do not guess silently. Name the missing pieces here.

## Project Summary

Describe product intent in plain language.

Cover:

- what is being built
- who it serves
- why it matters
- what type of surface it appears to be: browser, API, CLI, worker, service, other

## Accepted Scope Reading

Describe the best current reading of scope.

Separate:

- clearly in scope behavior
- likely in scope behavior
- unclear or conditional behavior

If the source is broad, explain what this intake deliberately does **not** lock yet.

## Explicit Out of Scope

List work that should not be treated as committed based on current source.

Examples:

- implementation stack details not yet specified
- admin features not named in source
- integrations not explicitly mentioned
- deployment requirements not stated in source

## Assumptions

Write only assumptions you are currently relying on to continue intake.

Each assumption should include:

- assumption statement
- why it seems reasonable
- what artifact would need revision if assumption proves false

## Unresolved Ambiguities

List ambiguity that should remain visible.

For each ambiguity, include:

- question
- why it matters
- which downstream artifact it blocks or weakens

## Candidate Product Domains

List stable concepts that appear likely to deserve their own names.

For each domain candidate, include:

- domain name
- why it appears stable
- whether it looks core, supporting, or uncertain

Do not over-slice. Name only concepts that are likely to persist.

## Candidate Product Docs

Propose the first product-doc set that would convert source into living truth.

Use a table like this:

| Doc | Purpose | Why needed now | Confidence |
| --- | --- | --- | --- |
| `docs/product/...` | | | `high | medium | low` |

Guidelines:

- create only docs that express durable product truth
- do not pre-create docs for hypothetical future domains
- prefer fewer strong docs over many shallow docs

## Candidate Epics

List only epics that are clear enough to name now.

Use a table like this:

| Epic ID | Working name | Description | Why this grouping exists | Status |
| --- | --- | --- | --- | --- |
| `E01` | | | | `unsliced | sliced` |

Explain why each proposed epic is a useful grouping rather than an arbitrary bucket.

## First Story Candidates

List the first story candidates that appear small enough to become real packets.

For each candidate, include:

- short story name
- user or system outcome
- why it is a good first slice
- what proof could exist for it
- what it depends on first

## First Implementation Slice Recommendation

Recommend one first slice if implementation were to begin after contract work.

Explain:

- why this slice is safest or highest leverage
- what product truth must exist before it starts
- what proof would make it complete

If no slice is safe yet, say so directly.

## Architecture Questions

List architecture questions that intake reveals but should not guess away.

Cover only material questions such as:

- product surfaces
- runtime stack constraints
- data persistence needs
- provider dependencies
- jobs/webhooks/files/secrets boundaries
- observability expectations

Separate:

- questions that block first implementation
- questions that can wait until after first story planning

## Validation Shape

Describe the smallest honest proof ladder visible from current source.

Examples:

- document review only
- contract examples
- unit-proof candidate
- integration-proof candidate
- end-to-end candidate

Do not promise higher-level proof if the stack and implementation do not yet exist.

## Risk Signals

List reasons this intake may need high-risk handling later.

Examples:

- security-sensitive data
- multi-platform behavior
- irreversible migrations
- external provider coupling
- audit or compliance expectations
- unclear trust boundaries

## Stack-Sensitive Unknowns

List unknowns that should affect future architecture selection.

Examples:

- concurrency model
- offline requirements
- multi-tenant requirements
- latency expectations
- retention policy
- import/export volume

## Open Decisions

Record decisions that probably need `docs/decisions/` later.

Use a table like this:

| Topic | Why decision likely matters | Timing |
| --- | --- | --- |
| | | `now | before first implementation | later` |

## Downstream Artifact Plan

List the concrete next artifacts this intake should produce.

Example shape:

1. create `docs/product/...`
2. update `docs/stories/backlog.md`
3. create first story packet
4. add planned proof rows to `docs/TEST_MATRIX.md`

If work should stop before any of those, state the stop condition explicitly.

## Harness Delta

Record what this intake taught about the harness itself.

Examples:

- missing glossary term
- weak template field
- missing traceability rule
- missing validation rule
- unclear story/epic relationship

If the harness change is not ready yet, link proposed follow-up to
`docs/HARNESS_BACKLOG.md`.
