# Internal Tool Reference

Template and research axes for a tool used by specific teams, with no market, no competitors, and no revenue model.

## Research axes

One brief per research agent, each returned with sources:

- **Best practices and standards:** how leading players and public standards solve this class of problem — for an IdP, for example: agent permissions, CIBA, PIM. What is worth adopting, and what is overkill for the team's size.
- **Current process:** the workflow or workaround the tool replaces, read from the codebase and existing docs.
- **Integrations and constraints:** systems it connects to, data ownership, organizational or technical limits.

## Template

```markdown
# [Tool Name]: Internal Tool Brief

## Purpose
What the tool does and why it exists. The problem it solves in one paragraph.

## Users
Which teams or roles use it. What they do today without it (current workaround or manual process).

## Scope
What the tool covers. What is explicitly out of scope.

## Integrations
Systems it connects to, depends on, or replaces. Data flows and ownership.

## Constraints
Technical, organizational, compliance, or budget constraints that shape the solution.

## Success Criteria
How we know it is working. Measurable or observable indicators.

## Assumptions
What we are taking as true that would change the direction if wrong. Riskiest assumption first.
```
