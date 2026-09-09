---
name: grill-me
description: Pressure-test an approved design or high-cost technical decision one question at a time before committing to data, API, infrastructure, or security choices.
---

# Grill Me

Use only for an unresolved decision that is costly to reverse or can invalidate
substantial downstream work. Use the active issue unless the decision is
independently tracked. Read its contract, relevant artifact, code, principles,
and memory first. Preserve established domain vocabulary and surface a conflict
or overloaded term before designing around it.

Start with the uncertainty whose answer could most change the decision. Ask one
question at a time, only when its answer changes the options, acceptance, or
risk. State a recommendation when evidence supports one; distinguish a user
outcome from an implementation preference. Follow each answer to its
consequences and stop when the choice, assumptions, risks, and remaining gaps
are explicit.

Do not use this to discover routine requirements or settled implementation details. If a requirement is missing, return that gap instead of inventing it. After explicit approval, record costly decisions with `adr` and continue to `plan`; otherwise leave the decision proposed.

Final record: decision, evidence, rejected alternatives, assumptions, accepted
risks, open gaps, next action. Return that outcome to the caller and link the
ADR when one is accepted. Do not turn an open gap
into an invented requirement.
