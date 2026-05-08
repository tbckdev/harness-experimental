# US-001 Install Harness v0.1 Into Target Repo

Version: 0.1  
Status: active

## Story Metadata

- Story ID: `US-001`
- Epic ID: `E01`
- Status: `planned`
- Lane: `normal`
- Owner: `feature/installer-v0.1-bootstrap`
- Handoff target: `agent executor`

## Story Intent

Allow a user to bootstrap the current harness documentation-contract baseline
into a target repository safely, without copying local-only planning artifacts
or scaffolding product implementation.

## Product Contract

A user can run an installer script that copies the approved harness baseline
into a target repository. The installer must preserve the repo's docs-first,
spec-intake-first philosophy and must not scaffold application source code,
framework setup, CI, fake tests, or local-only planning fixtures. The script
surface for this story is `scripts/install-bootstrap.sh`.

## Relevant Product Docs

- `README.md` — repository purpose and baseline framing
- `docs/HARNESS.md` — operating rules and source hierarchy
- `docs/HARNESS_LIFECYCLE.md` — artifact flow expectations
- `docs/FEATURE_INTAKE.md` — intake and lane policy
- `docs/TEST_MATRIX.md` — proof control expectations
- `docs/TRACEABILITY.md` — linking rules
- `docs/VERSIONING.md` — version/changelog policy
- `scripts/README.md` — script-surface expectations

## Dependencies

- current harness baseline docs must remain source of truth for what gets copied
- allowed-copy set must be defined before script implementation begins
- protected-path rules must be defined before overwrite logic is implemented
- proof rows must exist before validation can be called complete

## Blocked By / Enables

### Blocked By

- final allowlist of copied files is not yet encoded in script
- protected-path and exclusion policy is not yet implemented in code

### Enables

- distribution of harness baseline to other repositories
- safer reuse of this harness without manual copying
- future validation of bootstrap workflow using real temp targets

## Related Decisions

- likely new decision topic: harness bootstrap distribution policy

## Linked Test Matrix Rows

- `INS-001`
- `INS-002`
- `INS-003`
- `INS-004`

## Acceptance Criteria

- Installer defaults to current directory when no target path is provided.
- Installer accepts target path via command-line flag or positional argument.
- Installer copies only approved `v0.1` harness baseline files.
- Installer does not copy local-only planning artifacts under `plans/`.
- Installer does not copy local-only sandbox fixtures or ignored local test trash.
- Installer does not scaffold product source code, framework setup, CI, package scripts, or fake validation commands.
- Installer stops before writing if protected target paths already exist.
- Installer does not overwrite existing non-protected files by default.
- Installer supports explicit `--force` mode that backs up overwritten non-protected files before replacement.
- Installer supports dry-run mode that reports planned operations without writing files.
- Installer script itself is not copied into target repository unless an explicit future contract says otherwise.

## Non-Goals

- generating application code
- generating CI or package-manager configuration
- solving remote package distribution
- copying local planning history under `plans/`
- copying sandbox fixtures under `docs/examples/sandbox-flow/`

## Open Questions

- Should future versions offer an explicit remote-source mode, or should first version stay local-source only?

## Design Notes

The installer should be allowlist-driven rather than copy-everything-then-exclude.
That keeps bootstrap behavior aligned with source-of-truth docs and lowers risk
of leaking local-only artifacts.

Preferred contract shape:

- approved file manifest inside `scripts/install-bootstrap.sh` or adjacent manifest file
- protected path detection for `AGENTS.md`, `docs/`, and `scripts/`
- dry-run first-class behavior
- upstream-style `--force` behavior for non-protected files with timestamped backup before overwrite

## Validation

Expected proof layers for this story:

- document review: contract and file allowlist are coherent with source docs
- unit-style shell proof: syntax check for installer script when script exists
- integration-style proof: dry-run into temp target reports correct planned files
- end-to-end style proof: install into temp target creates expected harness tree only
- platform proof: local POSIX shell execution on development environment

## Rollback or Containment Note

Containment should rely on:

- dry-run support
- stop-before-write on protected paths
- backup-before-overwrite in force mode

Rollback for the current story branch is otherwise clean through git revert.

## Harness Delta

This story introduces the first real bootstrap automation for distributing the
current `v0.1` harness baseline. It also pressure-tests whether the harness can
express distribution policy without collapsing back into vague repo-copying.

## Evidence

Planned validation report path:

- `docs/validation/VAL-20260508-installer-v0.1.md`
