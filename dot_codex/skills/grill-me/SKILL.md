---
name: grill-me
description: Pressure-test an approved design or high-cost technical decision one question at a time before committing to data, API, infrastructure, or security choices.
---

# Grill Me

Use for decisions expensive to reverse, not routine changes. Read the artifact, product principles, and existing code first. Start with the decision that invalidates the most downstream work.

## Workflow

Ask one question at a time. Give a recommendation when evidence supports one. Follow each answer through its consequences, then revisit contradictions or hidden dependencies.

Finish with decisions confirmed, assumptions validated, risks accepted, open gaps, and the exact decision required before proceeding. After approval, create ADRs where appropriate and continue to `implementation-plan`.

Do not pressure-test settled, low-risk implementation details or substitute questioning for a missing requirement.

Record the final answer as: decision, evidence, rejected alternatives, assumptions, accepted risks, open gaps, and next action. If the user does not approve a costly choice, leave it proposed and do not route it to implementation.
