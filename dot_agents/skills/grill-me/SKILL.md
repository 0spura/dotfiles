---
name: grill-me
description: Pressure-test an approved design or costly technical decision one question at a time before committing to data, API, infrastructure, or security choices.
---

# Grill Me

For a decision that is costly to reverse or can invalidate substantial downstream work, not for routine requirements or settled implementation detail. Read the contract, the relevant artifact, code, principles, and memory first, and preserve established domain vocabulary; surface a conflict or overloaded term before designing around it.

Start with the uncertainty whose answer could most change the decision. Ask one question at a time, and only when the answer changes the options, acceptance, or risk. State a recommendation when the evidence supports one, keeping a user outcome distinct from an implementation preference. Follow each answer to its consequences and stop when the choice, assumptions, risks, and remaining gaps are explicit.

## Done when

The decision, its evidence, the rejected alternatives, the accepted risks, and the open gaps are explicit; an accepted costly decision goes to `adr`, and the work continues with `plan`.

## Stop conditions

A missing requirement is returned as a gap, never filled by invention.
