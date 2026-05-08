# Installer Contract

Status: draft

Script path: `scripts/install-bootstrap.sh`

This note freezes the intended bootstrap policy for `US-001` before script
implementation begins.

## Purpose

Installer bootstraps the current harness baseline into a target repository.

It should copy only what a new target repo needs to start using the harness as a
current operating system.

## Must Copy

Current approved baseline candidates:

- `AGENTS.md`
- `README.md`
- `docs/HARNESS.md`
- `docs/HARNESS_LIFECYCLE.md`
- `docs/FEATURE_INTAKE.md`
- `docs/ARCHITECTURE.md`
- `docs/TEST_MATRIX.md`
- `docs/TRACEABILITY.md`
- `docs/VERSIONING.md`
- `docs/HARNESS_BACKLOG.md`
- `docs/HARNESS_ROADMAP.md`
- `docs/README.md`
- `docs/GLOSSARY.md`
- `docs/product/README.md`
- `docs/stories/README.md`
- `docs/stories/backlog.md`
- `docs/stories/epics/README.md`
- `docs/decisions/README.md`
- `docs/templates/spec-intake.md`
- `docs/templates/story.md`
- `docs/templates/validation-report.md`
- `docs/templates/decision.md`
- `docs/templates/high-risk-story/overview.md`
- `docs/templates/high-risk-story/design.md`
- `docs/templates/high-risk-story/execplan.md`
- `docs/templates/high-risk-story/validation.md`
- `scripts/README.md`
- `docs/examples/README.md`
- `docs/examples/spec-intake-example.md`
- `docs/examples/story-example.md`
- `docs/examples/test-matrix-example.md`
- `docs/examples/decision-example.md`

## Must Not Copy

- `plans/`
- `docs/examples/sandbox-flow/`
- local planning history and changelog files
- installer story packet under `docs/stories/epics/E01-harness-bootstrap/`
- validation reports from source repo
- `.git/` content or git metadata

## Force Mode Policy

`--force` is included in first version.

Rules:

- protected paths still stop the install before write
- non-protected conflicting files may be overwritten only with `--force`
- every overwritten non-protected file must be backed up first with timestamped suffix
- dry-run must report backup and overwrite plan without writing anything

## Resolved Scope Choices

- copy non-sandbox files under `docs/examples/`
- do not copy `docs/examples/sandbox-flow/`
- use script path `scripts/install-bootstrap.sh`
- keep upstream-style force semantics, adapted to current `v0.1` allowlist
