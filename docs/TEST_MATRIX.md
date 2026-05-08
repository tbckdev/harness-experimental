# Test Matrix

Version: 0.1  
Status: active

This file maps accepted product or harness behavior to proof expectations.

The matrix is a control plane, not only a list. It should help reviewers answer:

- what behavior exists
- where that behavior is defined
- what proof is expected
- who owns the proof surface
- whether evidence is fresh enough to trust

## Status Values

| Status | Meaning |
| --- | --- |
| planned | Accepted as intended behavior, not yet implemented or not yet proven |
| in_progress | Actively being built or validated |
| implemented | Implemented and current proof exists |
| changed | Contract changed after earlier implementation or proof |
| retired | No longer part of the accepted contract |

## Freshness Values

| Freshness | Meaning |
| --- | --- |
| fresh | Evidence matches current accepted behavior as far as known |
| stale | Evidence predates later contract or implementation changes |
| not_yet_proven | Behavior accepted but no current evidence exists |
| historical_only | Evidence retained for history, not current trust |

## Proof Types

Use the lightest honest proof that matches repository reality.

- `document_review`: review of docs, contracts, and traceability only
- `unit`: pure logic proof
- `integration`: backend/provider/data boundary proof
- `e2e`: user-visible journey proof
- `platform`: runtime, shell, deployment, or environment proof
- `mixed`: more than one proof type is required

## Matrix

| Behavior ID | Behavior | Source Doc | Story | Risk Lane | Proof Owner | Proof Type Required | Current Proof | Freshness | Related Decision | Notes / Gaps |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

Add rows only when accepted product or harness behavior exists and can be linked
to a real source doc or operating doc.


| `INS-001` | installer copies only approved harness baseline files, including non-sandbox examples | `docs/stories/epics/E01-harness-bootstrap/US-001-install-harness-v0.1-into-target-repo.md` | `US-001` | `normal` | installer reviewer | `document_review` | `planned` | `not_yet_proven` | `none` | file allowlist defined in contract but not yet implemented |
| `INS-002` | installer stops on protected target paths before writing | `docs/stories/epics/E01-harness-bootstrap/US-001-install-harness-v0.1-into-target-repo.md` | `US-001` | `normal` | installer reviewer | `document_review` | `planned` | `not_yet_proven` | `none` | protected-path logic not yet implemented |
| `INS-003` | installer dry-run reports planned operations, including force backups, without writing files | `docs/stories/epics/E01-harness-bootstrap/US-001-install-harness-v0.1-into-target-repo.md` | `US-001` | `normal` | installer reviewer | `document_review` | `planned` | `not_yet_proven` | `none` | dry-run output contract not yet implemented |
| `INS-004` | installer excludes local-only planning and sandbox artifacts while preserving upstream-style force safety for non-protected files | `docs/stories/epics/E01-harness-bootstrap/US-001-install-harness-v0.1-into-target-repo.md` | `US-001` | `normal` | installer reviewer | `document_review` | `planned` | `not_yet_proven` | `none` | exclusion and overwrite behavior agreed but not yet implemented |

## Row Creation Rules

Create or update a row when:

- accepted behavior enters product docs
- a story packet introduces or changes accepted behavior
- a harness rule becomes important enough to need proof visibility
- a previously implicit contract now needs explicit validation ownership

Do not create rows for vague aspirations that have not been accepted as contract.

## Row Update Rules

### Move to `planned`

Use when behavior is accepted but proof does not exist yet.

### Move to `in_progress`

Use when behavior is actively being implemented, validated, or revalidated after change.

### Move to `implemented`

Use only when current evidence exists and is linked through validation or test surface.

### Move to `changed`

Use when accepted behavior changed after earlier evidence. This status warns that
older proof may now be stale.

### Move to `retired`

Use when behavior is no longer part of accepted truth.

## Evidence Rules

- Unit proof covers pure rules and deterministic application logic.
- Integration proof covers boundaries such as storage, provider contracts, jobs,
  or service contracts.
- End-to-end proof covers visible user or system journeys across layers.
- Platform proof covers runtime or shell behavior that lower-level tests cannot prove.
- Document review is honest only when executable surface does not yet exist or
  when the behavior itself is documentary/governance in nature.

## Freshness Rules

Set freshness to `stale` when:

- behavior changed after evidence was captured
- linked story or product doc changed materially
- proof environment or assumptions no longer match

Set freshness to `not_yet_proven` when:

- behavior is accepted but no current evidence exists

## Review Questions

Before trusting a row, ask:

1. Is the source doc the current source of truth?
2. Does the story link still make sense?
3. Is the proof type honest for the repository state?
4. Is evidence still fresh?
5. Do notes explain the biggest remaining gap?
