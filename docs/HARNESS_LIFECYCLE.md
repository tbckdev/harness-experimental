# Harness Lifecycle

Version: 0.1  
Status: active

This document defines the canonical artifact flow for this repository.

The goal is not to force ceremony. The goal is to make work routing explicit so
humans and agents do not invent missing steps in different ways.

## Lifecycle Summary

```text
prompt or spec
  -> intake classification
  -> spec intake or direct story routing
  -> product-doc update or proposal
  -> epic/backlog routing
  -> story packet or high-risk packet
  -> test-matrix update
  -> implementation or documentation change
  -> validation report
  -> decision or backlog update when needed
```

## Stage 1: Raw Prompt or Specification

Purpose:

Capture incoming intent before it is split into smaller artifacts.

Typical inputs:

- user prompt
- product specification
- change request
- maintenance request
- harness improvement request

Required output:

- classified request type
- selected lane or explicit note that lane selection is blocked

Stop conditions:

- input is missing enough detail that classification would be fiction
- request mixes multiple independent tasks and must be split first

Promotion criteria:

- request type is identified using `docs/FEATURE_INTAKE.md`
- immediate next artifact is known

Rollback path:

- if input is too weak, route back to clarification or record ambiguity in intake material

## Stage 2: Intake Classification

Purpose:

Decide whether the work belongs in direct tiny patch flow, story flow,
high-risk packet flow, or harness-growth flow.

Required inputs:

- raw prompt/spec
- current harness rules

Required outputs:

- input type
- risk lane
- target artifact type

Stop conditions:

- lane cannot be chosen honestly
- multiple lanes would apply because the request should be split

Promotion criteria:

- one target artifact type is chosen
- reasons for non-tiny routing are visible when applicable

Rollback path:

- if lane is unclear, return to intake notes rather than forcing execution

## Stage 3: Spec Intake or Direct Story Routing

Purpose:

Create the first durable work surface.

Use spec intake when:

- the input is a new project specification
- the input creates a large new product area
- the input requires deriving product docs and candidate epics

Use direct story routing when:

- accepted product truth already exists
- change can be scoped to one story or one high-risk packet

Required outputs from spec intake:

- intake packet
- candidate product docs
- candidate epics
- first-story candidates
- open decisions and known unknowns

Required outputs from direct routing:

- story path or high-risk packet path
- linked product truth or explicit note that product truth must be updated first

Stop conditions:

- intake packet still depends on implied domain truth
- direct story routing lacks accepted product contract

Promotion criteria:

- downstream artifact list is concrete
- next writer knows whether to update product docs, backlog, or story first

Rollback path:

- if product truth is missing, return to intake/product-doc stage instead of forcing story writing

## Stage 4: Product Contract Update

Purpose:

Move accepted behavior into living product docs rather than leaving it in raw
spec text.

Required inputs:

- intake packet or accepted change request
- existing product docs, if any

Required outputs:

- updated or newly created product docs
- explicit links from future work to those docs

Stop conditions:

- product behavior is still only described in a story packet
- docs are too broad to support later slicing

Promotion criteria:

- story writer can point to current product truth without interpreting raw spec every time

Rollback path:

- if domain shape is still unclear, keep work in intake and decision discovery rather than faking product-doc certainty

## Stage 5: Epic or Backlog Routing

Purpose:

Place work into durable work grouping before story execution.

Required inputs:

- product-doc scope
- intake output

Required outputs:

- backlog row or epic folder plan
- status and next slicing action

Stop conditions:

- epic grouping adds no value because work is already one bounded story
- backlog entry lacks relation to source intake or product docs

Promotion criteria:

- story candidates have a home
- priority or sequence can be discussed without re-reading full intake every time

Rollback path:

- if grouping is premature, keep story candidate local to intake notes until split is clearer

## Stage 6: Story Packet or High-Risk Packet

Purpose:

Convert scoped work into execution-ready contract.

Required inputs:

- product docs
- backlog or epic placement when relevant
- decision context when relevant

Required outputs:

- normal story file or high-risk story folder
- linked proof expectations
- linked test-matrix rows or explicit planned row identifiers

Stop conditions:

- packet lacks contract links
- packet lacks non-goals, dependencies, or risk framing when needed
- high-risk work lacks phased plan or rollback expectations

Promotion criteria:

- another agent could execute or review the work without inventing missing structure

Rollback path:

- if packet is still ambiguous, return to backlog, intake, or product-doc update rather than executing

## Stage 7: Test Matrix Update

Purpose:

Attach behavior to proof expectations before claiming work is complete.

Required inputs:

- story packet or high-risk packet
- product behavior statement

Required outputs:

- behavior row or updated row in `docs/TEST_MATRIX.md`
- proof expectations by layer
- status and evidence freshness state

Stop conditions:

- behavior is accepted but has no proof row
- test row cannot be linked back to source behavior

Promotion criteria:

- reviewer can see what proof is expected and whether it exists

Rollback path:

- if behavior is not yet stable enough for a row, keep it in packet design notes until wording is firm

## Stage 8: Implementation or Direct Documentation Change

Purpose:

Perform the requested change only after contract, routing, and proof surfaces are ready.

This stage may be:

- application implementation in a future project repo state
- direct documentation patch for harness work
- direct story/backlog/document correction

Required inputs:

- packet or approved tiny change
- linked product and proof context

Required outputs:

- changed repository files
- updated story or packet evidence notes as needed

Stop conditions:

- execution started without packet readiness for non-tiny work
- changed docs now contradict contract docs elsewhere

Promotion criteria:

- change can be reviewed against packet and proof expectations

Rollback path:

- if implementation reveals contract confusion, stop and return to packet or product-doc correction

## Stage 9: Validation Report

Purpose:

Record what was checked, what passed, and what still remains risky.

Required inputs:

- changed files
- expected proof from story or matrix

Required outputs:

- validation report with linked story and matrix rows
- commands run or explicit note that no commands existed
- gaps and follow-up owner if unresolved

Stop conditions:

- completion is claimed without evidence path
- validation report cannot be traced back to source packet

Promotion criteria:

- reviewer can read one artifact and see expected vs observed proof clearly

Rollback path:

- if evidence is missing, return to execution or test-matrix expectations before claiming done

## Stage 10: Decision or Harness-Backlog Update

Purpose:

Preserve what changed in the operating system itself.

Use decision record when:

- architecture or contract rationale changes materially
- workflow policy changes materially
- future debate is likely without written rationale

Use harness backlog when:

- friction is real but solution is not yet ready to become contract
- missing capability is discovered during work

Required outputs:

- decision record or backlog item, if needed
- updated roadmap/changelog trace when applicable

Stop conditions:

- repeated friction is noticed but not captured anywhere
- workflow changed materially without durable trace

Promotion criteria:

- next session can understand why the harness changed or what still remains missing

Rollback path:

- if the right operating change is unclear, open backlog item instead of forcing rule change

## Minimal Paths

### Tiny Harness Edit

```text
prompt
  -> intake classification
  -> direct documentation patch
  -> validation note if needed
  -> backlog update only if new friction discovered
```

### New Project Spec

```text
spec
  -> intake classification
  -> spec intake
  -> product-doc map
  -> candidate epics
  -> first stories
  -> test-matrix planning
```

### High-Risk Change

```text
change request
  -> intake classification
  -> product-doc update if needed
  -> high-risk packet
  -> test-matrix update
  -> execution
  -> validation report
  -> decision or backlog update if needed
```

## Review Questions

Before calling work complete, ask:

1. Which stage is this work currently in?
2. Which artifact is the current source of truth?
3. What artifact must exist before downstream work is honest?
4. What proof should exist before completion is claimed?
5. Did the work reveal a harness gap that needs durable trace?
