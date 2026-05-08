# Harness Roadmap

Version: 0.1  
Status: active

This document summarizes harness maturity stages after the initial upgrade from thin v0 guidance to the `harness-upgrade-v0.1` baseline.

## v0

Generic documentation-first harness exists.

Characteristics:

- no baked-in product domain
- no application implementation required
- basic intake, story, decision, and validation templates present
- collaboration rules exist but are still light

## v0.1

Operational contracts become explicit.

Characteristics:

- intake template becomes real routing artifact
- story template becomes handoff contract
- validation report and test matrix become proof surfaces
- lifecycle and versioning rules exist

## v0.2

Readiness and traceability become explicit.

Characteristics:

- lane escalation rules sharpen
- traceability links are documented
- high-risk packets include go/no-go and rollback expectations
- story system clearly distinguishes packet types

## v0.25

Support documentation catches up to core contracts.

Characteristics:

- root and docs navigation stay aligned with core rules
- glossary covers operating vocabulary
- decision and epic guidance stop lagging behind core templates
- scripts guidance stays honest about what does and does not exist

## v0.3

Harness governance becomes durable.

Characteristics:

- backlog items have stronger triage fields
- changelog explains meaningful harness change sets
- decision vs backlog vs migration paths are clearer

## v0.4

Examples teach the system.

Characteristics:

- compact non-authoritative examples show end-to-end artifact flow
- new agents can learn expected shapes quickly

## v1.0

First real project can be onboarded without changing harness shape materially.

Release gate:

- core contract docs do not contradict each other
- routing, proof, traceability, and versioning are all documented
- one end-to-end dry-run can be explained directly from repository docs
