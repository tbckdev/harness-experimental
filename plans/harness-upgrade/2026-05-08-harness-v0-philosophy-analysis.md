# Harness v0 Philosophy Analysis

Status: inferred  
Date: 2026-05-08  
Scope: repository harness philosophy only  
Confidence: medium-high

## File Location

- Folder: `plans/harness-upgrade/`
- File: `plans/harness-upgrade/2026-05-08-harness-v0-philosophy-analysis.md`

## Purpose

This note captures an inferred reading of the repository's underlying
philosophy. It is not a claim by the repository author. It is a structured
interpretation based on current repository documents and templates.

## Sources Reviewed

Primary sources reviewed:

- `README.md`
- `AGENTS.md`
- `docs/HARNESS.md`
- `docs/FEATURE_INTAKE.md`
- `docs/ARCHITECTURE.md`
- `docs/TEST_MATRIX.md`
- `docs/product/README.md`
- `docs/stories/README.md`
- `docs/stories/backlog.md`
- `docs/templates/spec-intake.md`
- `docs/templates/story.md`
- `docs/templates/high-risk-story/overview.md`
- `docs/templates/high-risk-story/design.md`
- `docs/templates/high-risk-story/execplan.md`
- `docs/templates/high-risk-story/validation.md`
- `docs/templates/validation-report.md`
- `docs/decisions/0001-harness-first-development.md`
- `docs/decisions/0002-post-spec-product-lifecycle.md`
- `docs/decisions/0003-generic-spec-intake-harness.md`

## Short Conclusion

This harness does not present itself as a direct clone of any single company or
methodology.

It appears to be a hybrid of several familiar traditions:

- contract-driven documentation
- story-first shaping
- boundary-first architecture
- risk-gated delivery
- agent-compatible operating protocols

Most compact summary:

> Do not let agents build from raw prompts alone. Convert intent into living
> contract, bounded work, and explicit proof first.

## What It Feels Closest To

## 1. Contract-Driven / Doc-Driven Development

Observed signals:

- raw prompt or specification is treated as input material, not final truth
- product truth is expected to move into smaller living artifacts
- stories, decisions, and proof are first-class outputs
- monolithic specification is treated as unsafe for long-term agent work

Evidence:

- `docs/HARNESS.md`
- `docs/decisions/0002-post-spec-product-lifecycle.md`
- `docs/decisions/0003-generic-spec-intake-harness.md`

Interpretation:

This repo treats documents less as passive explanation and more as operational
contract. That is stronger than ordinary documentation culture.

## 2. Story-First / Shaping-First Product Work

Observed signals:

- work is sliced into stories and high-risk packets before implementation
- scope is constrained through lane selection and explicit risk classification
- first buildout is expected to flow through intake and story packets, not raw
  code scaffolding
- repo rejects giant persistent specs as primary working surface

Evidence:

- `docs/FEATURE_INTAKE.md`
- `docs/templates/story.md`
- `docs/templates/high-risk-story/execplan.md`
- `docs/stories/README.md`

Interpretation:

This is close in spirit to shaping-first approaches such as Basecamp-style work
packet thinking, even though vocabulary here is more engineering-governance and
less product-design branded.

## 3. DDD / Boundary-First Architecture

Observed signals:

- explicit "Discovery Before Shape"
- separation of domain/application/infrastructure/interface concerns
- parse-first boundary rule
- command/query separation where read/write split matters
- emphasis on stable names and contract boundaries before implementation shape

Evidence:

- `docs/ARCHITECTURE.md`

Interpretation:

This is strongly aligned with DDD and clean-architecture habits. It is generic
on purpose, but not architecture-neutral. It prefers disciplined boundaries.

## 4. Risk-Gated Delivery

Observed signals:

- work lanes: `tiny`, `normal`, `high-risk`
- risk checklist
- high-risk packet with plan, design, and validation sections
- explicit proof expectations and stop conditions
- validation treated as part of task definition, not afterthought

Evidence:

- `docs/FEATURE_INTAKE.md`
- `docs/templates/high-risk-story/overview.md`
- `docs/templates/high-risk-story/execplan.md`
- `docs/templates/high-risk-story/validation.md`
- `docs/TEST_MATRIX.md`

Interpretation:

This resembles engineering governance patterns seen in platform, fintech,
enterprise, and safety-aware teams where blast radius matters and vague
completion is unacceptable.

## 5. Agent-Operating-System Mindset

Observed signals:

- `AGENTS.md` is not only style guidance; it is a runtime operating contract
- source-of-truth hierarchy is explicit
- repo contains templates tuned for machine-readable handoff and continuity
- harness delta is a named concept, meaning process improvement is part of work
- repository is intentionally designed for repeated human+agent collaboration

Evidence:

- `AGENTS.md`
- `docs/HARNESS.md`
- `docs/HARNESS_BACKLOG.md`
- `docs/templates/*`

Interpretation:

This is where the harness feels most modern and least like a classic company
process transplant. It is an agent-compatible operating environment.

## What It Does Not Resemble

Not close to:

- code-first startup hacking
- scaffold-first framework setup
- prompt-only "build it now" automation
- heavy PRD bureaucracy where documents grow but do not constrain execution

Reasons:

- repo avoids premature app scaffolding
- repo avoids fake scripts and fake proof
- repo prefers small living artifacts over giant static specifications
- repo treats validation and decision history as operational assets

## Best-Fit Mapping

If forced to map influences, this harness appears closest to a blend of:

- Basecamp / Shape Up style shaping instincts
- Thoughtworks / DDD consulting style boundary discipline
- modern AI-agent repository operating patterns

It does **not** read like a literal import from any one brand or framework.

## Weighted Interpretation

Approximate influence split:

- `35%` contract-driven / doc-driven shaping
- `25%` DDD / clean-boundary architecture
- `20%` risk-gated delivery
- `20%` agent-operating-system mindset

Reasoning:

- contract and story slicing dominate repository flow
- architecture guidance is strong but intentionally generic
- risk and proof are structural, not decorative
- agent-ops weight is substantial because repository exists primarily to make
  future human+agent work safer and more repeatable

## Core Thesis

Most concise reading of harness philosophy:

> Do not allow an agent to code directly from raw intent when intent has not yet
> been transformed into living contract, bounded scope, and proof expectations.

Expanded form:

1. Human intent enters as prompt or spec.
2. Intent is converted into durable smaller truths.
3. Work is sliced into bounded packets.
4. Architecture is shaped only after domains and boundaries are visible.
5. Proof is attached to behavior, not bolted on after coding.
6. Harness improves whenever repeated friction is discovered.

## Strategic Implication For Harness Upgrades

If this reading is correct, future harness upgrades should strengthen:

- artifact contracts
- traceability
- readiness gates
- proof discipline
- handoff quality
- harness self-improvement loops

Future upgrades should avoid:

- premature automation without repeated friction
- product-specific assumptions baked into generic templates
- code scaffolding that jumps ahead of story readiness
- overly ceremonial docs that do not change execution quality

## Caveat

This analysis is inference, not author-stated doctrine. It should be used as a
planning aid for harness evolution, not as historical fact.
