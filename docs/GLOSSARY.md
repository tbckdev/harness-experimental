# Glossary

## Agent

A human-directed coding or planning assistant that reads repository contracts,
updates artifacts, and performs work within the harness.

## Harness

The repository-level operating system that turns prompts or specs into accepted
truth, bounded work, proof expectations, and historical trace.

## Product Contract

Accepted product truth stored in living repository artifacts, usually under
`docs/product/`, rather than left only in raw prompt or broad specification.

## Story Packet

A bounded execution contract for one slice of work. It links accepted truth,
scope, proof expectations, and evidence path.

## Feature Intake

The classification step that maps incoming request to input type, risk lane, and
target artifact before execution starts.

## Intake Packet

A durable spec-intake artifact created from a broad project specification,
initiative, or large prompt. It proposes product docs, epics, first stories,
and open decisions.

## Epic

A durable grouping for related stories when one larger area needs multiple work
packets. An epic is smaller than a broad spec and larger than one story.

## Validation Evidence

Observed proof captured through document review, tests, manual checks, or other
reviewable artifacts. Evidence should support completion claims.

## Proof Freshness

A signal describing whether existing evidence still matches current accepted
behavior.

## Traceability

The ability to follow one behavior across source truth, story packet, proof row,
validation report, and decision history.

## Readiness Gate

A checkpoint used to decide whether work is ready to move into story writing,
execution, or completion.

## Migration Note

Local transition guidance placed in a file or changelog when contract shape
changes but historical artifacts still exist.

## Harness Delta

A change to the collaboration system itself: docs, templates, proof rules,
versioning policy, routing rules, or backlog proposals.

## Product Delta

A change to accepted product behavior, product docs, story packets,
implementation, or validation for product work.
