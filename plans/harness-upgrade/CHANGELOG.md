# Harness Upgrade Changelog

## 2026-05-08 — Plan Baseline Locked

- Version scope: planning baseline before documentation upgrades
- Affected files:
  - `plans/harness-upgrade/2026-05-08-harness-upgrade-roadmap-v0.1.md`
  - `plans/harness-upgrade/2026-05-08-harness-v0-philosophy-analysis.md`
- Why change happened:
  - establish explicit roadmap and philosophy analysis before implementation work
- Friction removed:
  - lack of committed upgrade plan baseline
- File-level version markers changed:
  - no
- Migration follow-up required:
  - no

## 2026-05-08 — Core Harness Contracts Upgraded

- Version scope: `v0.1` through `v0.4` documentation execution on upgrade branch
- Affected files:
  - `README.md`
  - `docs/HARNESS.md`
  - `docs/HARNESS_LIFECYCLE.md`
  - `docs/FEATURE_INTAKE.md`
  - `docs/TEST_MATRIX.md`
  - `docs/TRACEABILITY.md`
  - `docs/VERSIONING.md`
  - `docs/HARNESS_BACKLOG.md`
  - `docs/HARNESS_ROADMAP.md`
  - `docs/README.md`
  - `docs/GLOSSARY.md`
  - `docs/product/README.md`
  - `docs/stories/README.md`
  - `docs/stories/backlog.md`
  - `docs/stories/epics/README.md`
  - `docs/decisions/README.md`
  - `docs/templates/spec-intake.md`
  - `docs/templates/story.md`
  - `docs/templates/validation-report.md`
  - `docs/templates/decision.md`
  - `docs/templates/high-risk-story/overview.md`
  - `docs/templates/high-risk-story/design.md`
  - `docs/templates/high-risk-story/execplan.md`
  - `docs/templates/high-risk-story/validation.md`
  - `scripts/README.md`
  - `docs/examples/README.md`
  - `docs/examples/spec-intake-example.md`
  - `docs/examples/story-example.md`
  - `docs/examples/test-matrix-example.md`
  - `docs/examples/decision-example.md`
- Why change happened:
  - replace thin v0 docs with detailed operating contracts that align with roadmap
- Friction removed:
  - weak intake routing, weak story contracts, weak proof control, weak support docs, and missing example layer
- File-level version markers changed:
  - yes, on protocol-like docs and templates added in this change set
- Migration follow-up required:
  - future historical files may need local interpretation against new template shapes when touched
