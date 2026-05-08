# Scripts

No executable scripts exist yet.

This directory is reserved for real automation that a future project or a later
harness phase genuinely needs.

## Rule

Do not add fake scripts, fake command names, or placeholder automation only to
make the repository look mature.

## What Future Scripts Must Represent

A future script should exist only when:

- a real executable surface exists
- the command saves repeated manual work
- the command maps to proof expectations already tracked in `docs/TEST_MATRIX.md`
- the command name reflects behavior that can actually run in the repository

## Aspirational Command Families

These names describe likely future command families, not currently available
commands:

```text
validate:quick
  fast formatting, lint, typecheck, or unit-level proof if they later exist

test:integration
  provider, storage, or contract-boundary proof if integration surface later exists

test:e2e
  user-visible journey proof if later browser or multi-step surface exists

test:platform
  runtime or shell-specific smoke checks if later platform surface exists

test:release
  slower release-readiness proof if later release process genuinely exists
```

Do not document these names elsewhere as if they are already runnable.

## Graduation Rule

A command name graduates from aspirational to real only when all are true:

- implementation surface exists
- script exists in repository
- command is referenced by validation or proof workflow honestly
- command meaning is stable enough to document
