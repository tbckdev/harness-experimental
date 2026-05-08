# Validation Report

Version: 0.1  
Status: active

## Validation Metadata

- Validation ID: `VAL-20260508-installer-v0.1`
- Date: `2026-05-08`
- Reviewer: `feature/installer-v0.1-bootstrap`
- Scope status: `accepted`

## Scope

Validated installer story `US-001` for bootstrapping the current harness
baseline into a target repository.

## Linked Artifacts

- `docs/stories/epics/E01-harness-bootstrap/US-001-install-harness-v0.1-into-target-repo.md`
- `docs/stories/epics/E01-harness-bootstrap/INSTALLER_CONTRACT.md`
- `docs/TEST_MATRIX.md`
- `scripts/install-bootstrap.sh`
- `scripts/README.md`
- `README.md`
- `docs/HARNESS.md`
- `docs/HARNESS_LIFECYCLE.md`
- `docs/TRACEABILITY.md`
- `docs/VERSIONING.md`

## Proof Scope and Level

Current proof level: `mixed`

Proof included in this validation:

- document review for contract and allowlist alignment
- shell syntax proof for installer script
- integration-style dry-run into temp target
- end-to-end style local install into temp target
- protected-path stop behavior check
- force-backup overwrite behavior check

## Expected Result

Installer should copy only approved `v0.1` baseline files, exclude local-only
planning and sandbox artifacts, stop on protected paths, support dry-run, and
back up overwritten non-protected files when `--force` is used.

## Commands Run

```text
bash -n scripts/install-bootstrap.sh
scripts/install-bootstrap.sh --help
scripts/install-bootstrap.sh --directory "$TMP_DRY" --dry-run --yes
scripts/install-bootstrap.sh --directory "$TMP_REAL" --yes
scripts/install-bootstrap.sh --directory "$TMP_PROTECT" --yes
scripts/install-bootstrap.sh --directory "$TMP_FORCE" --yes --force
scripts/install-bootstrap.sh --directory "$TMP_DRY_FORCE" --yes --dry-run --force
```

## Results

- shell syntax check passed
- help output rendered correctly
- dry-run wrote no files
- real install copied expected allowlist files
- forbidden artifacts were excluded
- protected-path conflict stopped before write
- `--force` created timestamped backup before overwriting `README.md`
- dry-run plus `--force` reported backup/overwrite actions without modifying files

## Expected vs Observed

- expected: installer copies approved baseline only
- observed: allowlist installed exactly `32` files and excluded forbidden paths
- severity: none
- completion honesty: valid for current local-source installer scope

## Evidence

- shell syntax pass
- temp-target dry-run pass
- temp-target real-install pass
- protected-path stop pass
- force backup pass
- allowlist file count pass

## Evidence Freshness

- Evidence date: `2026-05-08`
- Freshness status: `fresh`

## Follow-Up Ownership

- owner: `feature/installer-v0.1-bootstrap`
- next action: none for current local-source scope
- urgency: `low`

## Gaps

- remote-source mode not implemented
- protected-path merge/override flow from upstream not adopted in this version
