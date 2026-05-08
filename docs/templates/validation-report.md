# Validation Report

Version: 0.1  
Status: active

Use this template to record observed evidence for a completed or reviewed change.

This file is not only a command log. It is the durable proof surface that links
changed work back to story and matrix expectations.

## Validation Metadata

- Validation ID: `VAL-YYYYMMDD-XX`
- Date: `YYYY-MM-DD`
- Reviewer: `name or session`
- Scope status: `draft | accepted | superseded`

## Scope

Describe what was validated.

Include:

- story ID or high-risk packet reference
- epic ID if relevant
- intake source if validation is tied directly to intake-phase work
- changed files or changed surfaces at high level

## Linked Artifacts

List exact references.

- story packet path
- product doc paths
- test matrix row IDs
- decision records, if relevant

## Proof Scope and Level

State what kind of proof this report represents.

Possible values:

- document review
- unit proof
- integration proof
- end-to-end proof
- platform proof
- mixed

Explain why this proof level is the highest honest proof available now.

## Expected Result

Describe what the story or contract said should be true if validation passes.

Keep this concise and testable.

## Commands Run

If commands exist, list them exactly.

```text
command
```

If no executable commands exist yet, say so explicitly and explain what review
method was used instead.

## Results

Describe observed outcome.

Use this structure:

- pass conditions observed
- failed or partial conditions observed
- environment or repo constraints affecting confidence

If multiple checks ran, summarize each clearly rather than burying them in one paragraph.

## Expected vs Observed

Compare contract to reality.

For each meaningful gap, state:

- expected behavior
- observed behavior
- severity for this task
- whether completion claim is still honest

## Evidence

List supporting artifacts.

Examples:

- output excerpts
- screenshots
- report paths
- linked review notes
- manual inspection notes for document-only changes

## Evidence Freshness

- Evidence date: `YYYY-MM-DD`
- Freshness status: `fresh | stale | historical-only`

Use `stale` when the evidence is known to predate later contract changes.

## Follow-Up Ownership

If validation found gaps, assign who owns next action.

- owner
- next action
- urgency

If no follow-up is needed, state `none`.

## Gaps

List unresolved limitations or missing proof.

Examples:

- no executable test surface exists yet
- proof stopped at document review
- integration environment does not yet exist
- performance behavior not validated

Do not hide missing proof. Name it plainly.
