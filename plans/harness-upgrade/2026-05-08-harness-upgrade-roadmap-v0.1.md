# Harness Upgrade Roadmap v0.1

Status: completed  
Date: 2026-05-08  
Scope: repository harness only  
Owner: repository maintainers and future human/agent sessions  
Review output: roadmap notes, changelog entries, and migration notes when needed

Completion note: Roadmap executed and merged to `main` via tag `harness-upgrade-v0.1`.

## File Location

- Folder: `plans/harness-upgrade/`
- File: `plans/harness-upgrade/2026-05-08-harness-upgrade-roadmap-v0.1.md`

## Related Analysis

- Philosophy analysis: `plans/harness-upgrade/2026-05-08-harness-v0-philosophy-analysis.md`

This roadmap should be read with the philosophy analysis. The analysis explains
why the harness behaves as a contract-first, proof-oriented operating system.
This roadmap translates that philosophy into concrete upgrade work.

## Execution Status

- Planning baseline commit: `9cf66e0`
- Upgrade implementation commit: `3959da3`
- Merge to `main`: `edc5fe1`
- Release tag: `harness-upgrade-v0.1`
- Overall roadmap state: completed

Rule for future agents:

- Do not reopen or re-run this roadmap as pending work.
- Treat this file as historical planning and completion evidence for the
  `harness-upgrade-v0.1` release.
- Create a new roadmap file for later upgrade phases or corrective work instead
  of mutating this one back into active planning state.

## Purpose

This plan upgrades the repository from a documentation-first Harness v0 into a
more operational, repeatable, and self-checking harness. The target is not
application implementation. The target is stronger intake, planning, handoff,
traceability, and verification for future product work.

## Current State Summary

Current strengths:

- `docs/HARNESS.md` defines the mental model and source hierarchy.
- `docs/FEATURE_INTAKE.md` defines work lanes.
- `docs/ARCHITECTURE.md` defines generic design constraints before stack lock.
- `docs/templates/` provides starter artifacts for spec intake, stories,
  high-risk work, decisions, and validation.
- `docs/TEST_MATRIX.md` provides a proof-oriented control panel concept.

Current weaknesses:

- Artifact chain is implied, not enforced.
- Intake does not yet function as a decision protocol.
- Story packets are not yet strong execution contracts.
- Traceability across docs, stories, decisions, and proof is weak.
- Verification rules exist, but harness-level readiness gates are still thin.
- Harness backlog tracks gaps, but does not yet support prioritization and
  closure discipline.

## Upgrade Goals

1. Make spec intake produce consistent downstream artifacts.
2. Make story packets execution-ready for human and agent handoff.
3. Make proof tracking usable as a real control plane.
4. Make harness evolution explicit, versioned, and reviewable.
5. Add enough structure that future product work starts from smaller ambiguity.

## Planning Gaps Found During Review

The first roadmap draft was directionally sound, but still had a few missing
operational details. These gaps are now captured explicitly and should guide
future edits:

- naming and ID conventions were not yet called out strongly enough
- phase-level success criteria existed, but cross-phase readiness was still soft
- ownership and review cadence for harness evolution were underspecified
- deprecation/migration rules for old templates were missing
- anti-bloat guardrails needed stronger wording to prevent ceremony creep

The sections below absorb those gaps.

## Cross-Phase Rules

These rules apply to every version milestone in this roadmap.

### Dependency Rule

- `v0.1` establishes core artifact contracts and should land before later
  phases are treated as complete.
- `v0.2` depends on `v0.1`, because readiness and traceability rules assume
  stronger intake, story, validation, and proof artifacts already exist.
- `v0.25` can begin after `v0.1`, but should be finalized after the main `v0.2`
  artifact changes are known so support docs do not document outdated shapes.
- `v0.3` depends on `v0.1` and `v0.2`, and should absorb governance lessons from
  earlier phases rather than guessing them early.
- `v0.4` should come after prior contract and governance changes settle, so
  examples teach final shapes instead of transitional ones.

### Naming and ID Conventions

- Every new reusable harness artifact should have a stable purpose and clear
  path.
- IDs should remain human-scannable and sortable where possible.
- Story, epic, decision, behavior, and validation identifiers should eventually
  be aligned across templates and control docs.

### Change Control

- Prefer additive template changes before structural doc moves.
- Do not replace old artifact shapes silently; define migration notes when a
  template or matrix format changes.
- When a change alters workflow behavior rather than wording, record a decision
  or roadmap changelog entry.

### Versioning and Changelog Control

- Harness changes should be traceable at both repository level and major file
  level when the change affects workflow behavior, artifact shape, or source of
  truth.
- Repository-level version progress belongs in roadmap and harness changelog
  artifacts.
- File-level version markers should be used sparingly, only for files whose
  structure acts like a reusable protocol or template.
- Pure wording cleanup does not need version bumps unless it changes behavior or
  interpretation.
- Every meaningful harness contract change should leave at least one durable
  trace: changelog entry, decision record, migration note, or explicit version
  update.

Default file-level version-marker rule:

- protocol-like docs may use `Version:` and `Status:`
- templates may use `Version:` when field shape changes materially
- navigation or orientation docs usually should not carry version markers
- `Last updated:` is optional and informational, not a substitute for changelog
  or migration trace

Migration-note placement rule:

- use in-file migration notes when readers of that file need local transition
  guidance
- use roadmap changelog entries for repository-wide harness change sets
- use decision records only when workflow or contract logic changes materially

### Review Cadence

- Re-review harness after each completed upgrade packet.
- Reassess whether added structure reduced ambiguity or only added ceremony.
- Stop expanding templates when field quality drops or repeated blank sections
  appear.

Minimum review output after each packet:

- packet verdict: `accepted`, `accepted-with-follow-ups`, or `revise`
- affected-file list
- new gaps found
- whether roadmap or changelog needs update

### Anti-Bloat Rule

- New fields must earn their place by improving routing, handoff, proof, or
  recovery.
- Explanatory text should stay compact; operational clarity matters more than
  exhaustive prose.

## Non-Goals

- Do not create application source code.
- Do not select a product stack prematurely.
- Do not add fake CI, fake scripts, or fake validation commands.
- Do not overfit the harness to a single imagined product domain.

## Versioned Upgrade Path

## v0.1 — Operational Contracts

Objective:

Turn core docs and templates into stronger operating contracts without changing
repository purpose.

Target files:

- `docs/templates/spec-intake.md`
- `docs/templates/story.md`
- `docs/templates/validation-report.md`
- `docs/TEST_MATRIX.md`
- `docs/HARNESS.md`
- new `docs/HARNESS_LIFECYCLE.md`
- new `docs/VERSIONING.md`

Changes:

Versioning requirements for this phase:

- define whether core template files use inline `Version:` markers
- define when a template revision requires a changelog entry
- define how file-level revisions relate to roadmap phase versions
- define where migration notes live when template readers need transition help

### 1. Strengthen `docs/templates/spec-intake.md`

Add sections for:

- intake identifier / date / owner
- source fidelity and missing input
- assumptions
- unresolved ambiguities
- explicit out-of-scope
- candidate product domains
- candidate product docs with rationale
- candidate epics with slicing rationale
- first implementation slice recommendation
- risk signals
- stack-sensitive unknowns
- harness deltas discovered during intake

Exit condition:

A future agent can take a raw spec and produce a consistent intake packet with
clear downstream routing.

Completion signal:

- intake template includes required contract sections
- template does not force product-specific assumptions
- one reviewer can explain downstream routing without consulting extra notes

### 2. Strengthen `docs/templates/story.md`

Add sections for:

- story identifier rules
- story owner / current status / handoff target
- dependencies
- blocked-by / enables
- related decision records
- linked test matrix rows
- open questions
- non-goals
- rollback or containment note
- proof expectations by layer
- post-completion harness delta

Exit condition:

A story packet becomes a clean handoff artifact, not only a note template.

Completion signal:

- story template shows ownership, dependencies, proof links, and non-goals
- another agent could pick up the story without guessing missing routing fields

### 3. Upgrade `docs/TEST_MATRIX.md`

Extend matrix shape with columns such as:

- behavior id
- product doc source
- linked story
- risk lane
- proof owner
- proof type required
- evidence status
- last validated date
- related decision
- notes/gaps

Add operating rules for:

- when a row is created
- when a row changes state
- when evidence is stale
- how changed behavior is marked

Exit condition:

The test matrix can function as behavior-to-proof control plane rather than a
placeholder table.

Completion signal:

- rows can identify source behavior, proof owner, freshness, and related story
- changed behavior can be marked without losing prior meaning

### 4. Strengthen `docs/templates/validation-report.md`

Add sections for:

- linked story / epic / intake source
- linked test matrix rows
- proof scope and proof level
- expected vs observed result
- evidence freshness date
- unresolved gaps and follow-up owner

Exit condition:

Validation reports become traceable evidence artifacts rather than free-form
notes.

Completion signal:

- a validation report can point back to story and matrix rows cleanly
- gaps and follow-up ownership are visible in one read

### 5. Add `docs/HARNESS_LIFECYCLE.md`

Define canonical artifact chain:

- raw prompt/spec
- spec intake
- product doc creation/update
- epic identification
- story packet creation
- test matrix update
- decision logging
- validation report
- harness delta/backlog update

For each stage, define:

- required inputs
- required outputs
- stop conditions
- promotion criteria to next stage
- rollback path if upstream artifact is not ready

Exit condition:

Artifact flow becomes explicit and teachable.

Completion signal:

- each stage has inputs, outputs, stop conditions, promotion criteria, and
  rollback path
- readers can tell where work must go next without inferring hidden process

### 6. Update `docs/HARNESS.md`

Keep philosophy, but add concise protocol links:

- link to lifecycle doc
- define readiness gates at high level
- define minimum traceability expectations
- define when harness must evolve immediately vs backlog later
- define when a template change needs migration guidance

Exit condition:

`docs/HARNESS.md` remains entrypoint, but no longer carries hidden protocol
assumptions.

Completion signal:

- entrypoint links to lifecycle and core control docs
- high-level readiness and traceability expectations are visible in one pass

### 7. Add `docs/VERSIONING.md`

Define harness version-control rules for docs and templates:

- repository-level harness version meaning
- file-level version marker policy
- when to use `Version:`, `Status:`, `Last updated:`, or migration note only
- what types of changes require changelog entries
- relationship between roadmap phases, changelog entries, and decision records

Exit condition:

Future harness edits have one clear rulebook for version bumps and changelog
expectations.

Completion signal:

- readers can tell when to bump file-level version
- readers can tell when repo changelog is enough
- readers can tell when migration note is required

## v0.2 — Readiness Gates and Traceability

Objective:

Reduce ambiguity in transitions between intake, planning, execution, and proof.

Target files:

- `docs/FEATURE_INTAKE.md`
- `docs/product/README.md`
- `docs/stories/README.md`
- `docs/stories/backlog.md`
- `docs/templates/high-risk-story/overview.md`
- `docs/templates/high-risk-story/design.md`
- `docs/templates/high-risk-story/execplan.md`
- `docs/templates/high-risk-story/validation.md`
- new `docs/TRACEABILITY.md`

Changes:

### 1. Upgrade `docs/FEATURE_INTAKE.md`

Add decision gates for:

- tiny -> normal promotion
- normal -> high-risk promotion
- input types to required outputs
- when implementation is prohibited
- when architecture decision record is mandatory
- when unclear work must loop back into intake instead of entering execution

Add readiness checklists:

- intake readiness
- story readiness
- implementation readiness
- validation readiness

### 2. Add `docs/TRACEABILITY.md`

Define required links across artifacts:

- product doc -> stories
- story -> product docs
- story -> test matrix rows
- story -> decisions
- validation report -> story
- decision -> affected docs/stories
- backlog epic -> intake source

Add orphan detection checklist for manual review.

### 3. Upgrade `docs/product/README.md`

Define expected product doc taxonomy once a real spec arrives, for example:

- overview
- personas / users
- domain model
- workflows
- policies / rules
- interfaces / APIs
- operational constraints

Keep generic. Do not pre-create domain docs yet.

### 4. Upgrade `docs/stories/README.md`

Clarify story system rules:

- story folder and file naming
- when to use single-file story vs high-risk packet folder
- required links to product docs, test matrix, and decisions
- status transition expectations
- evidence placement expectations

### 5. Upgrade `docs/stories/backlog.md`

Add stronger backlog fields:

- epic id
- status
- source intake
- product docs touched
- risk level
- next slicing action
- blocked by / decision needed

### 6. Upgrade high-risk story templates

Add fields for:

- blast radius
- unknowns to burn down first
- phase entry and exit criteria
- rollback plan
- acceptance evidence map
- dependency map
- explicit go/no-go checkpoint

Exit condition for v0.2:

Agents can tell whether work is ready for next phase without relying on hidden
judgment alone.

Completion signal for v0.2:

- story readiness can be checked from docs alone
- traceability links required by policy are explicitly stated
- high-risk packet shows go/no-go and rollback expectations

## v0.25 — Documentation System Hardening

Objective:

Close the remaining support-doc and template gaps so the harness reads like one
coherent system instead of a strong core surrounded by thin auxiliary files.

Target files:

- `README.md`
- `docs/README.md`
- `docs/GLOSSARY.md`
- `docs/VERSIONING.md`
- `docs/stories/epics/README.md`
- `docs/decisions/README.md`
- `docs/templates/decision.md`
- `scripts/README.md`

Changes:

### 1. Upgrade `README.md`

Clarify:

- harness purpose in one screen
- source-of-truth entry order
- what v0 includes and excludes
- where future spec intake begins
- where roadmap and philosophy analysis live

### 2. Upgrade `docs/README.md`

Turn it into real documentation map:

- who should read what first
- which docs are operational vs reference
- how artifact chain moves across folders
- where to update after each task type

### 3. Upgrade `docs/GLOSSARY.md`

Normalize terms added by roadmap and lifecycle work:

- intake packet
- epic
- validation evidence
- traceability
- readiness gate
- migration note
- proof freshness

### 4. Upgrade `docs/VERSIONING.md`

Refine versioning examples and coverage:

- examples for template-version bump vs no bump
- examples for repo changelog entry vs decision record
- examples for migration-note-only changes
- recommended metadata block shape for protocol-like docs

### 5. Upgrade `docs/stories/epics/README.md`

Define epic-folder contract:

- when an epic folder should exist
- minimum files or linked artifacts expected
- how epic folders relate to backlog rows and stories
- naming and archival expectations

### 6. Upgrade `docs/decisions/README.md`

Clarify:

- when to create a decision vs backlog item
- decision numbering and status rules
- how decisions link to stories, product docs, and test matrix rows
- when follow-up entries are mandatory

Note:

This pass improves readability and usage guidance. Governance-specific decision
triggers are tightened again in `v0.3`.

### 7. Upgrade `docs/templates/decision.md`

Strengthen template with:

- affected artifacts
- decision owner or author
- review trigger
- validation impact
- migration or follow-up note when relevant

### 8. Upgrade `scripts/README.md`

Clarify command-contract maturity:

- which command names are aspirational only
- when a command name graduates into real script surface
- how future scripts must map back to test matrix proof layers
- anti-fake-automation rule

Exit condition for v0.25:

Supporting README files, terminology, decision template, and scripts guidance no
longer lag behind core harness contracts.

Completion signal for v0.25:

- support docs no longer contradict core templates
- glossary covers new operating terms introduced by upgrades
- readers can navigate source-of-truth hierarchy without guessing

## v0.3 — Harness Governance and Self-Improvement

Objective:

Make harness growth disciplined instead of ad hoc.

Target files:

- `docs/HARNESS_BACKLOG.md`
- `docs/decisions/README.md`
- new `docs/HARNESS_ROADMAP.md`
- new `plans/harness-upgrade/CHANGELOG.md`

Changes:

### 1. Upgrade `docs/HARNESS_BACKLOG.md`

Add fields for:

- priority
- owner
- discovered date
- accepted date
- acceptance signal
- supersedes
- implementation notes
- close-out date

Add triage rules:

- direct fix now
- backlog later
- decision record required

### 2. Upgrade `docs/decisions/README.md`

Define decision triggers more sharply:

- architecture lock
- product contract shift
- validation policy shift
- harness workflow shift
- traceability rule shift

### 3. Add `docs/HARNESS_ROADMAP.md`

Describe harness maturity model:

- v0: generic documentation harness
- v0.1: operational contracts
- v0.2: readiness + traceability
- v0.3: governance + self-improvement
- v1: repeatable first-project onboarding system

### 4. Add `plans/harness-upgrade/CHANGELOG.md`

Track harness upgrade iterations over time:

- date
- version
- files changed
- why change happened
- what friction it removed

Add short migration notes when changed templates affect in-flight work.

Repository changelog rules:

- one entry per meaningful harness change set
- include affected files or folders
- include whether file-level version markers changed
- include whether migration follow-up is required

Decision on pass/fail for this phase belongs to repository maintainers or the
current lead agent acting within maintainer-approved scope.

Exit condition for v0.3:

Harness changes become visible, staged, and easier to continue across sessions.

Completion signal for v0.3:

- backlog items can be triaged and closed with visible criteria
- changelog shows why harness changed over time
- governance docs distinguish backlog item vs decision vs migration path

## v0.4 — Example-Driven Training Layer

Objective:

Make harness easier for future agents by adding worked examples without
introducing fake product truth.

Target files:

- new `docs/examples/README.md`
- new `docs/examples/spec-intake-example.md`
- new `docs/examples/story-example.md`
- new `docs/examples/test-matrix-example.md`
- new `docs/examples/decision-example.md`

Rules:

- examples must be explicitly marked as non-authoritative
- examples must demonstrate artifact shape, not domain truth
- examples must stay small and generic

Exit condition:

New agents can learn artifact expectations from one compact end-to-end example.

Completion signal:

- examples are clearly marked non-authoritative
- examples reflect current contract shapes rather than obsolete drafts

## v1.0 — Repeatable First-Project Onboarding Harness

Objective:

Support first real project intake with minimal ambiguity and strong document
flow.

Definition of done:

- intake protocol stable
- story contract stable
- validation report contract stable
- traceability protocol stable
- proof matrix stable
- support docs and glossary aligned with core contracts
- governance protocol stable
- one worked example available
- first real spec can be absorbed without changing core harness shape

Measurable release gate for `v1.0`:

- every file listed in coverage audit checklist has been addressed by a completed
  roadmap packet or explicitly deferred with written reason
- no core contract file contradicts another core contract file on routing,
  traceability, versioning, or proof expectations
- at least one end-to-end dry-run of `prompt/spec -> intake -> product-doc map ->
  story -> test-matrix row -> validation report` can be described directly from
  harness docs without inventing missing steps

## Recommended Execution Order

This execution order is normative. Version labels describe scope; phase order
describes dependency-aware delivery.

Phase 1:

- `docs/templates/spec-intake.md`
- `docs/templates/story.md`
- `docs/templates/validation-report.md`
- `docs/TEST_MATRIX.md`
- `docs/HARNESS.md`
- `docs/HARNESS_LIFECYCLE.md`
- `docs/VERSIONING.md`

Phase 2:

- `docs/FEATURE_INTAKE.md`
- `docs/TRACEABILITY.md`
- `docs/product/README.md`
- `docs/stories/backlog.md`
- `docs/stories/README.md`
- `docs/templates/high-risk-story/*`

Phase 3:

- `README.md`
- `docs/README.md`
- `docs/GLOSSARY.md`
- `docs/VERSIONING.md`
- `docs/stories/epics/README.md`
- `docs/decisions/README.md`
- `docs/templates/decision.md`
- `scripts/README.md`

Phase 4:

- `docs/HARNESS_BACKLOG.md`
- `docs/decisions/README.md`
- `docs/HARNESS_ROADMAP.md`
- `plans/harness-upgrade/CHANGELOG.md`

Phase 4 note:

- `docs/decisions/README.md` appears here a second time on purpose.
- `v0.25` improves readability and linkage guidance.
- `v0.3` tightens governance triggers after earlier phases expose real needs.

Phase 5:

- `docs/examples/*`

## Exit Criteria By Packet

### Packet A Exit Criteria

- intake template produces clearer downstream artifacts
- story template supports clean execution handoff
- test matrix can express ownership and evidence freshness
- lifecycle doc removes artifact-flow ambiguity

### Packet B Exit Criteria

- lane transitions are explicit
- required artifact links are documented
- backlog entries are easier to slice and triage
- high-risk packets expose readiness and rollback clearly

### Packet C Exit Criteria

- harness changes can be prioritized and closed cleanly
- decision triggers are easier to apply consistently
- roadmap state and changelog make future continuation easier

### Packet D Exit Criteria

- one compact example demonstrates end-to-end artifact flow
- example teaches structure without creating fake product truth

## Migration Notes

- Existing docs should not be force-rewritten unless a phase explicitly changes
  artifact shape.
- When templates gain new required fields, update instructions to clarify
  whether older files are grandfathered or need refresh on next touch.
- Prefer forward-only adoption when possible; avoid broad cleanup sweeps unless
  repeated confusion proves they are needed.

## Suggested Work Packets

### Packet A — Core Contracts

Deliverables:

- revised intake template
- revised story template
- revised test matrix
- lifecycle doc
- versioning rules doc
- harness entrypoint updates

Risk:

- normal

Why first:

This packet tightens center of gravity for all later upgrades.

### Packet B — Traceability and Readiness

Deliverables:

- feature intake revisions
- traceability doc
- high-risk packet upgrades
- backlog structure upgrade

Risk:

- normal to high-risk

Why second:

This packet makes coordination safer once core artifacts become stronger.

### Packet C — Governance and Maturity

Deliverables:

- harness roadmap
- backlog governance
- decision trigger clarity
- upgrade changelog

Risk:

- tiny to normal

Why third:

This packet stabilizes harness evolution after operational flow is improved.

### Packet D — Documentation Hardening

Deliverables:

- root and docs navigation upgrades
- glossary normalization
- versioning examples and metadata guidance
- epic README upgrade
- decision template/README upgrade
- scripts contract clarification

Risk:

- tiny to normal

Why fourth:

This packet closes support-doc drift before governance and examples expand
further.

### Packet E — Worked Example Layer

Deliverables:

- small end-to-end example set

Risk:

- normal

Why fifth:

Examples teach best after artifact contracts have settled.

## Pre-Execution Gate

Before editing any target phase, verify three things:

- upstream dependency phases are either complete or intentionally partial with
  documented limits
- target files are not being asked to document rules that have not been defined
  yet elsewhere in the roadmap
- proposed wording changes reduce ambiguity instead of only increasing volume

Decision authority for this gate:

- repository maintainers decide when available
- otherwise current lead agent records pass/fail judgment and rationale in plan
  or changelog notes before treating the packet as complete

## Coverage Audit Checklist

Use this checklist before declaring roadmap coverage complete.

- root entrypoints covered: `README.md`, `AGENTS.md`, `docs/HARNESS.md`
- intake flow covered: `docs/FEATURE_INTAKE.md`, `docs/templates/spec-intake.md`
- architecture guidance covered: `docs/ARCHITECTURE.md`
- story system covered: `docs/stories/README.md`, `docs/stories/backlog.md`, `docs/stories/epics/README.md`, `docs/templates/story.md`, `docs/templates/high-risk-story/*`
- decision system covered: `docs/decisions/README.md`, `docs/templates/decision.md`
- proof system covered: `docs/TEST_MATRIX.md`, `docs/templates/validation-report.md`, `scripts/README.md`
- version/changelog system covered: `docs/VERSIONING.md`, `plans/harness-upgrade/CHANGELOG.md`, relevant migration notes in touched docs
- terminology and navigation covered: `docs/README.md`, `docs/GLOSSARY.md`
- harness governance covered: `docs/HARNESS_BACKLOG.md`, `docs/HARNESS_ROADMAP.md`, `plans/harness-upgrade/CHANGELOG.md`
- worked-example layer covered separately and clearly marked non-authoritative

If any line above is false, roadmap coverage is not complete.

## Risks

- Over-structuring harness before first real project may create ceremony.
- Under-structuring harness will keep future product work ambiguous.
- Examples can accidentally become pseudo-product truth if not labeled well.
- Too many fields can reduce completion quality instead of increasing it.

## Guardrails

- Every added field must answer a real coordination or proof need.
- Prefer sharper prompts and rules over larger template bulk.
- Keep repo generic until real product input exists.
- Add automation only after repeated manual friction is observed.

## Success Signals

- Different agents produce more consistent artifact shapes from same input.
- Intake outputs naturally map into epics, stories, and test rows.
- Reviewers can detect readiness and gaps quickly.
- Harness backlog items become more specific and easier to close.
- First real spec intake requires fewer interpretation jumps.

## Immediate Next Recommendation

Implement `v0.1` first. It gives highest leverage with low risk and does not
prematurely hardcode project-specific assumptions.
