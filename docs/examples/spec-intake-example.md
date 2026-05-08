# Spec Intake Example

Non-authoritative example.

## Source Summary

A user wants a small appointment-booking service for neighborhood clinics with:

- patient self-booking
- clinic-managed time slots
- confirmation messages

## Candidate Product Docs

- `docs/product/overview.md` — service purpose and main actors
- `docs/product/booking-workflow.md` — booking and confirmation rules
- `docs/product/policies.md` — slot ownership and cancellation rules

## Candidate Epics

- `E01-booking-flow` — booking creation and confirmation
- `E02-clinic-slot-management` — clinic-controlled availability

## First Story Candidate

- patient books an available slot and receives confirmation
- good first slice because it proves core workflow without solving every admin concern
