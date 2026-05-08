# Versioning

Version: 0.1  
Status: active

This document defines how harness-level document changes are versioned,
announced, and reviewed.

## Purpose

The harness changes over time. Some edits are only wording cleanup. Some edits
change how humans and agents should work. This file distinguishes the two so the
repository does not lose traceability.

Use these rules whenever changing documents or templates that act as operating
contracts.

## Scope

This policy applies to:

- roadmap files under `plans/harness-upgrade/`
- core harness docs under `docs/`
- reusable templates under `docs/templates/`
- support guidance that changes routing, proof, or source-of-truth behavior

This policy does not require version markers on every file in the repository.

## Repository-Level Version

The repository-level harness version describes the maturity of the harness as a
whole.

Current roadmap sequence:

- `v0`: generic harness baseline
- `v0.1`: operational contracts
- `v0.2`: readiness gates and traceability
- `v0.25`: documentation system hardening
- `v0.3`: governance and self-improvement
- `v0.4`: example-driven training layer
- `v1.0`: repeatable first-project onboarding harness

Repository-level version progress is tracked by:

- `plans/harness-upgrade/2026-05-08-harness-upgrade-roadmap-v0.1.md`
- `plans/harness-upgrade/CHANGELOG.md` once that file exists
- decision records when workflow rules change materially

## File-Level Version Markers

Use file-level version markers sparingly.

Recommended metadata block for protocol-like docs:

```md
Version: 0.1  
Status: active
```

Use file-level `Version:` markers when:

- the file defines reusable protocol behavior
- the file defines template structure used by future work
- a field-shape change would affect how readers fill or interpret the file

Good candidates for file-level version markers:

- `docs/HARNESS.md`
- `docs/HARNESS_LIFECYCLE.md`
- `docs/FEATURE_INTAKE.md`
- `docs/TEST_MATRIX.md`
- `docs/TRACEABILITY.md`
- `docs/templates/spec-intake.md`
- `docs/templates/story.md`
- `docs/templates/validation-report.md`
- `docs/templates/decision.md`
- `docs/templates/high-risk-story/*.md`

Usually do **not** add `Version:` markers to:

- `README.md`
- `docs/README.md`
- simple folder READMEs used only for navigation
- story files created for one piece of work
- validation reports created for one piece of work

Those files may still use `Status:` or plain dated notes when helpful, but they
normally do not need version numbering.

## Status Markers

`Status:` communicates current lifecycle state of a reusable guidance file.

Allowed values for operating docs and templates:

- `active`: current contract to follow
- `draft`: proposed but not yet accepted as contract
- `deprecated`: still present for historical context, should not be used for new work
- `superseded`: replaced by another file or version and kept only for history

Do not use `draft` casually on files that are already the active repository
contract.

## `Last updated:` Markers

`Last updated:` is optional and informational only.

Use it when a file changes frequently and readers benefit from a visible date.
Do not use it as a substitute for:

- roadmap history
- changelog entries
- migration notes
- decision records

## When To Bump File Version

Bump a file-level version when the file's contract changes materially.

Examples that **should** bump a file version:

- adding required sections to a reusable template
- changing risk-lane routing rules
- changing what evidence counts as completion
- changing required traceability links across artifacts
- changing metadata expected in reusable protocol docs

Examples that usually **should not** bump a file version:

- spelling, grammar, and wording cleanup
- reordering sections without changing meaning
- adding an example that does not change required behavior
- clarifying text when existing behavior stays identical

## When To Add Changelog Entry

Add a repository changelog entry for any meaningful harness change set that:

- changes workflow behavior
- changes reusable template shape
- changes source-of-truth hierarchy or routing expectations
- changes validation or traceability requirements
- changes how versioning or migration is handled

One cohesive change set should generally produce one changelog entry.

## When To Use Decision Record Instead

Use a decision record when the change answers a meaningful "why" question that
future maintainers could re-debate.

Examples:

- why the harness remains generic instead of domain-seeded
- why proof matrix rows use a certain lifecycle
- why high-risk work requires extra packet structure
- why a workflow moved from backlog proposal to direct operating contract

Do not create decision records for minor wording cleanup.

## Migration Notes

Migration notes explain how readers should handle a contract change when older
files still exist.

Use in-file migration notes when:

- readers of that file need local transition guidance
- an old section name or field layout still appears in historical files
- a template reader must know how to interpret older stories or reports

Use changelog notes when:

- the change affects multiple files or the repo-wide workflow
- the transition matters at repository level rather than local file level

Use decision records when:

- the migration reflects a deeper rule or philosophy change, not only a format change

## Default Trace Rules

Every meaningful harness contract change should leave durable trace in at least
one of these places:

- file-level `Version:` bump
- repository changelog entry
- migration note
- decision record

Not every change needs all four.

## Review Expectations

When reviewing harness-document changes, verify:

1. whether the file changed behavior or only wording
2. whether file-level version marker should change
3. whether repository changelog needs a new entry
4. whether readers need migration guidance
5. whether the change deserves a decision record

## Examples

### Example: Template Field Expansion

A story template gains required fields for `linked test matrix rows` and
`rollback note`.

Expected trace:

- bump `docs/templates/story.md` version
- add changelog entry
- add migration note if old stories are still acceptable without those fields

### Example: Navigation Cleanup

`docs/README.md` is rewritten for clarity, but folder meanings do not change.

Expected trace:

- no version bump required
- no decision record required
- changelog entry optional unless part of a broader harness-improvement set

### Example: Risk Lane Rule Change

`docs/FEATURE_INTAKE.md` changes when work must escalate from `normal` to
`high-risk`.

Expected trace:

- bump `docs/FEATURE_INTAKE.md` version
- add changelog entry
- consider decision record if the rationale affects future policy debate

## Relationship To Roadmap

Roadmap phase labels such as `v0.1` and `v0.2` describe upgrade scope. They are
not one-to-one replacements for file-level version numbers.

A file may stay at `Version: 0.1` even while the repository moves to later
phases, if the file itself has not changed materially since its earlier upgrade.
