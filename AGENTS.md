# Agent Operating Guide

This repository now uses the `harness-upgrade-v0.1` documentation-contract
baseline. There is still no product implementation yet.

The current job of agents is to preserve and grow the collaboration harness
before writing application code. Do not scaffold application source folders,
platform shells, package scripts, CI, or tests unless a later story explicitly
moves the project into implementation.

## Source Of Truth

Read in this order:

1. `README.md` for repository state.
2. `docs/HARNESS.md` for operating principles.
3. `docs/HARNESS_LIFECYCLE.md` for artifact flow.
4. `docs/FEATURE_INTAKE.md` before turning any prompt into work.
5. The user-provided spec or prompt, when one exists.
6. `docs/product/` for current product contracts.
7. `docs/ARCHITECTURE.md` before proposing implementation shape.
8. `docs/stories/` for story packets and backlog.
9. `docs/TEST_MATRIX.md` for proof status and expectations.
10. `docs/decisions/` for why important choices were made.
11. `docs/TRACEABILITY.md` and `docs/VERSIONING.md` when link policy or version/change policy matters.

This harness does not ship with a project-specific `SPEC.md`. When the human
provides a spec for a new project, treat that spec as input material for the
first buildout. Derive product docs, story packets, architecture decisions, and
validation expectations from it. Product docs, stories, tests, and decisions
then become the living contract that agents should update as the system evolves.

## Task Loop

For every task:

1. Classify the request with `docs/FEATURE_INTAKE.md`.
2. Identify whether the input is a new spec, spec slice, change request, new
   initiative, maintenance request, or harness improvement.
3. Identify the current source of truth before choosing downstream artifact.
4. Locate affected product docs, story files, proof rows, and decision records.
5. Check `docs/TEST_MATRIX.md` for existing proof and freshness gaps.
6. Work only inside the selected lane: tiny, normal, or high-risk.
7. Before finishing, ask:
   - Did product truth change?
   - Did validation expectations change?
   - Did traceability links change?
   - Did versioning or migration guidance change?
   - Did architecture rules change?
   - Did we discover a repeated failure pattern?
   - Did the next agent need a clearer instruction?
8. Update routine harness files directly, or add a proposal to
   `docs/HARNESS_BACKLOG.md` when the change is structural but not yet ready to
   become active contract.

## Harness Change Policy

Agents may update directly:

- Story status and evidence.
- `docs/TEST_MATRIX.md` rows.
- Links from story packets to product docs, proof rows, and decisions.
- Validation notes and reports.
- Small clarifications tied to the current task.
- Version markers, migration notes, or changelog entries when current contract
  changes require them.

Agents should ask for human confirmation before:

- Changing architecture direction.
- Removing validation requirements.
- Changing the source-of-truth hierarchy.
- Changing risk classification rules.
- Replacing the feature workflow.
- Redefining versioning or traceability policy in a way that changes future work
  expectations materially.

## Done Definition

A task is done only when:

- The requested change is completed or the blocker is documented.
- Relevant docs, stories, and test matrix entries remain current.
- Validation commands were run when they exist.
- Validation evidence is linked honestly when commands do not exist.
- Required traceability links remain intact.
- Missing harness capabilities were added to `docs/HARNESS_BACKLOG.md`.
- Version/changelog/migration traces were updated when contract shape changed.
- The final response says what changed and what was not attempted.
