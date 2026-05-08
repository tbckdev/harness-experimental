# Harness

Version: 0.1  
Status: active

This repository is a collaboration harness.

It exists to help humans and agents turn incoming prompts or specifications into
small, reviewable, and provable work without pretending the repository already
contains product truth that does not yet exist.

Harness `v0.1` still does not ship application code. It ships operating rules,
templates, and control documents that define how a future project should be
shaped before implementation expands.

## Mental Model

```text
human intent or raw spec
  -> intake classification
  -> living product truth
  -> story or high-risk packet
  -> proof expectation
  -> execution
  -> validation evidence
  -> harness delta when friction is discovered
```

Every task should improve at least one of these surfaces:

1. Product delta: product docs, story packets, implementation, proof, decisions.
2. Harness delta: workflow rules, templates, validation controls, glossary,
   roadmap, or backlog proposals.

## Harness v0.1 Scope

Harness `v0.1` includes:

- repository entrypoint rules in `AGENTS.md`
- collaboration and operating guidance in `docs/HARNESS.md`
- intake and risk-lane policy in `docs/FEATURE_INTAKE.md`
- generic architecture rules in `docs/ARCHITECTURE.md`
- proof tracking policy in `docs/TEST_MATRIX.md`
- reusable templates under `docs/templates/`
- harness growth tracking in `docs/HARNESS_BACKLOG.md`
- roadmap, history, and changelog artifacts under `plans/harness-upgrade/`

Harness `v0.1` deliberately excludes:

- project-specific source code
- preselected framework or stack
- pre-created domain-specific product documents
- fake automation, fake scripts, or fake validation commands
- monolithic living specs that replace product docs and story packets

## Source Hierarchy

The repository should be read from highest current truth to lowest context.

```text
user prompt or user-provided spec
  raw intent and source material

accepted product docs under docs/product/
  current product contract after intake

story packets under docs/stories/
  scoped execution contracts and historical work packets

proof control under docs/TEST_MATRIX.md
  behavior-to-proof expectations and status

validation reports
  observed evidence for completed or reviewed work

decision records under docs/decisions/
  why important contract or workflow choices changed

harness backlog
  unresolved collaboration-system gaps
```

Rules:

- raw prompt or spec is input material, not long-term living truth
- accepted product behavior should move into `docs/product/`
- execution details should move into story packets, not stay embedded in broad specs
- proof expectations should be visible in `docs/TEST_MATRIX.md`
- material workflow or contract changes should leave durable trace in decisions,
  changelog, migration notes, or version markers

## Canonical Lifecycle

Use `docs/HARNESS_LIFECYCLE.md` as the canonical artifact-flow contract.

That file defines:

- required stages
- inputs and outputs for each stage
- stop conditions
- promotion criteria
- rollback paths when work is not ready

This file is the entrypoint. `docs/HARNESS_LIFECYCLE.md` is the detailed flow.

## Intake and Routing

All work begins with classification in `docs/FEATURE_INTAKE.md`.

At minimum, classify:

- input type
- risk lane
- target artifact
- whether implementation is allowed yet

Do not skip classification for non-trivial work.

## Readiness Gates

Use these gates at a high level before downstream work begins.

### Gate 1: Intake Readiness

Ready when:

- input type is identified
- current source of truth is known
- target artifact is known
- obvious ambiguities are named rather than hidden

Not ready when:

- prompt mixes multiple work items and needs splitting
- accepted product truth is missing but story execution is being forced anyway

### Gate 2: Story Readiness

Ready when:

- product truth exists or the story explicitly includes product-doc update as its first contract step
- scope is bounded
- non-goals and dependencies are visible
- expected proof is linked or planned

Not ready when:

- another agent would need to guess what the story is allowed to change
- proof expectations are absent

### Gate 3: Execution Readiness

Ready when:

- lane is correct
- packet shape matches risk
- traceability links exist
- proof expectations are attached

Not ready when:

- work is high-risk but lacks high-risk packet structure
- core docs contradict each other

### Gate 4: Completion Readiness

Ready when:

- changed files align with source contract
- test matrix reflects accepted behavior status
- validation evidence is captured or the lack of executable proof is explicitly documented
- new harness friction is captured as direct improvement or backlog item

Not ready when:

- completion claim depends on unwritten assumptions
- validation notes cannot be traced back to packet and proof expectations

## Traceability Expectations

Minimum traceability for non-trivial work:

- story packet links relevant product docs
- story packet links relevant proof rows or planned rows
- validation report links story packet and proof rows
- decision record links affected contract surfaces when meaningful
- backlog item links discovered friction when the fix is deferred

Use `docs/TRACEABILITY.md` once that file exists for the detailed rule set.

## Growth Rule

The harness grows from real friction, not from fantasy completeness.

Add or change harness rules when one of these is true:

- humans or agents repeatedly have to infer missing routing logic
- validation expectations are unclear or inconsistent
- templates fail to support clean handoff
- proof rows cannot describe real work clearly
- repeated gaps appear in multiple stories or reviews

When the fix is clear and small, improve the harness directly.
When the fix is real but not yet settled, record it in `docs/HARNESS_BACKLOG.md`.

## Immediate Update vs Backlog Later

Improve the harness immediately when:

- current task cannot be completed honestly without the change
- the missing rule would make the current work misleading
- multiple active documents would contradict each other without the update

Use backlog later when:

- the gap is real but not blocking the current task
- the solution still needs debate
- the issue is structural and should not be guessed during unrelated work

## Validation Ladder

The right proof level depends on what the repository actually contains.

Possible proof levels:

- document review
- unit proof
- integration proof
- end-to-end proof
- platform proof

The current repository often stops at document-review proof because no application surface
exists yet. Do not fake higher-level proof.

If a later project introduces executable surfaces, update the test matrix and
story packets so proof expectations match the real stack.

## Versioning and Migration

Use `docs/VERSIONING.md` for version-marker, changelog, and migration-note
rules.

When a template or operating doc changes shape materially:

- check whether the file version should bump
- check whether a repository changelog entry is needed
- add local migration note if readers of that file need transition guidance
- add decision record if the change alters workflow rationale materially

## Working Rule

Default behavior:

- classify first
- update current truth before downstream detail
- prefer bounded packets over giant narrative docs
- prefer explicit proof expectation over implied confidence
- preserve history through decisions, validation reports, and changelog traces

The harness succeeds when future sessions need less guessing than current ones.
