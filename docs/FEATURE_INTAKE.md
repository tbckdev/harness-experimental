# Feature Intake

Version: 0.1  
Status: active

Use this document to classify incoming work before choosing execution shape.

The goal is not to slow work down. The goal is to stop humans and agents from
mixing broad intake, product truth, execution contract, and proof into one
ambiguous blob.

## Intake Flow

```text
incoming request
  -> identify input type
  -> identify current source of truth
  -> choose risk lane
  -> choose target artifact
  -> decide whether execution is allowed yet
```

## Input Types

| Type | Use when | Typical output |
| --- | --- | --- |
| New spec | Turning raw project spec into harness-ready product truth | Spec intake, product-doc plan, candidate epics |
| Spec slice | Working on one accepted slice of broader spec | Story packet or high-risk packet |
| Change request | Changing accepted behavior | Product-doc update plus story packet |
| New initiative | Adding larger product area needing multiple stories | Intake notes, product-doc expansion, epic routing |
| Maintenance request | Changing technical, operational, or quality behavior | Story packet, decision, validation update |
| Harness improvement | Improving collaboration harness itself | Direct docs patch, story packet, or backlog item |

## Current Source of Truth Check

Before lane selection, answer:

1. Is the current truth still only in the raw prompt/spec?
2. Has accepted behavior already moved into `docs/product/` or harness docs?
3. Is there already a story packet or decision record that governs this request?

If accepted truth is missing, do not act as if a story already exists.

## Lanes

### Tiny

Use for low-risk, narrow, reversible work such as:

- wording fixes
- small clarifications
- renames with tiny blast radius
- narrow harness docs corrections

Requirements:

- patch directly
- keep affected docs current
- run available quick checks if they exist
- record harness delta only if real friction was discovered

Do **not** use tiny when the change creates or changes reusable contract shape.

### Normal

Use for bounded behavior or harness changes that need one clear story packet.

Requirements:

- create or update one story file from `docs/templates/story.md`
- link relevant product docs or operating docs
- link expected proof rows in `docs/TEST_MATRIX.md`
- document validation expectations
- update accepted truth if the story changes it

### High-Risk

Use when work can materially affect:

- security or trust boundaries
- irreversible data or migration behavior
- multi-platform or multi-role product surfaces
- auditability or compliance-sensitive flows
- multiple subsystems with non-trivial blast radius

Requirements:

- create high-risk packet using `docs/templates/high-risk-story/`
- fill `overview.md`, `design.md`, `execplan.md`, and `validation.md`
- define phased work, go/no-go logic, and rollback thinking
- record decision if contract or architecture changes materially

## Promotion Rules

Promote `tiny -> normal` when any of these is true:

- change affects reusable contract or template shape
- proof expectations need explicit documentation
- another reader would need a story to review the change safely
- multiple files change for one behavior change

Promote `normal -> high-risk` when any of these is true:

- rollback is non-trivial
- trust or security boundary changes
- multiple product surfaces move together
- evidence strategy must span multiple phases or environments
- failure impact is materially broader than one bounded story

## When Execution Is Prohibited

Do not begin implementation or downstream editing when:

- current source of truth is missing
- packet shape does not match risk level
- accepted behavior is still only implied in raw prompt
- lane is unclear because work needs splitting first
- a needed decision is still unresolved and would change scope materially

## When Work Must Loop Back Into Intake

Loop back into intake rather than forcing execution when:

- input mixes several independent goals
- product doc candidates are still unclear
- epic grouping is too fuzzy to support story slicing
- architecture questions block honest first story planning
- risk lane keeps changing during early reasoning

## Readiness Checklists

### Intake Readiness

- input type chosen
- lane chosen or explicit reason not chosen yet
- target artifact identified
- missing truth named rather than guessed

### Story Readiness

- accepted truth exists or update path is part of story
- story scope is bounded
- dependencies and non-goals are visible
- proof expectations are linked

### Implementation Readiness

- lane shape is correct
- product and proof links exist
- blockers that would invalidate work are not hidden

### Validation Readiness

- expected proof level is known
- validation surface exists or absence is explicitly documented
- report can link back to source packet and proof rows

## Risk Checklist

Ask these questions before final lane choice:

- Does this change touch security-sensitive or trust-boundary behavior?
- Could this change force irreversible migration or data rewrite?
- Does this change span multiple product surfaces or user roles?
- Would failure be expensive, silent, or difficult to detect?
- Does proof require multi-step or multi-environment validation?
- Would another agent likely under-scope this if left as a normal story?

One `yes` does not automatically force high-risk. Several `yes` answers should
make high-risk the default unless there is strong reason otherwise.

## Output Expectations

Every intake decision should leave one of these outputs:

- direct tiny patch path
- normal story path
- high-risk packet path
- spec intake path
- backlog item for unresolved harness gap

A request is not well-routed if the next artifact is still unclear.
