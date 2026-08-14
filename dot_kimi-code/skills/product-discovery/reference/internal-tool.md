# Internal Tool Research Template

## Research Axes

### 1. Current Process
- Steps in the current workflow (manual or automated)
- Tools currently used (scripts, spreadsheets, SaaS, CLI)
- Time spent per occurrence
- Frequency (daily, weekly, per-event)
- Error rate or failure modes

### 2. Users
- Teams and roles that use the process
- Primary user (does it most often)
- Secondary users (occasional or downstream consumers)
- Pain points per role
- Workarounds already built

### 3. Scope and Boundaries
- What the tool replaces (and what it does not)
- Adjacent processes it must not disrupt
- Data it consumes and produces
- Lifecycle: one-off build or ongoing maintenance

### 4. Integrations and Constraints
- Systems it reads from or writes to
- Authentication and access control requirements
- Data sensitivity (PII, secrets, compliance)
- Environment constraints (cloud, on-prem, CI, local)
- Existing libraries or internal platforms to build on

### 5. Success Criteria
- Measurable outcome (time saved, errors eliminated, latency reduced)
- Adoption signal (who uses it within what timeframe)
- Maintenance budget (acceptable ongoing cost)

## Output Structure

```markdown
# Product Discovery: [Name]

## Purpose
[One paragraph: what it does and why it exists.]

## Users
[Teams, roles, frequency of use.]

## Scope
[What it covers, explicit non-goals.]

## Current Process
[Steps, tools, pain, time cost.]

## Integrations
[Systems, APIs, data flows.]

## Constraints
[Technical, security, organizational.]

## Success Criteria
[Measurable outcomes.]

## Assumptions
[What must be true for this to work.]
```
