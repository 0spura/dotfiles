---
name: grill-me
description: Pressure-test an approved design or high-cost technical decision one question at a time before committing to data, API, infrastructure, or security choices.
---

# Grill Me

Use only for an unresolved decision that is costly to reverse or can invalidate substantial downstream work. Read the relevant artifact, code, principles, and memory first; start with the highest-impact uncertainty.

Ask one question at a time, only when its answer can change the decision. State a recommendation when evidence supports one. Follow answers to their consequences and stop when the choice, assumptions, risks, and remaining gaps are explicit.

Do not use this to discover routine requirements or settled implementation details. If a requirement is missing, return that gap instead of inventing it. After explicit approval, record costly decisions with `adr` and continue to `implementation-plan`; otherwise leave the decision proposed.

Final record: decision, evidence, rejected alternatives, assumptions, accepted risks, open gaps, next action.
