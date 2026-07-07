# SRS Template (initial creation)

Use only when `docs/srs.md` does not yet exist.

```markdown
# SRS: [Product Name]

> Vision: [docs/product/vision.md](./product/vision.md)
> Product context: [docs/product/discovery.md](./product/discovery.md)

# 1. Functional Requirements

## RF-XXX: [Domain Name]

### RF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** none
* Concrete, verifiable behavior. One rule per bullet.
* Edge cases and limits go here.

# 2. Non-Functional Requirements

## RNF-XXX: [Category]

### RNF-XXX.1: [Requirement name]
**Priority:** Must Have | **Status:** Accepted | **Dependencies:** none
* Measurable target (for example, "< 100ms p95", "at least WCAG 2.1 AA").

# 3. Glossary
Terms with non-obvious domain meaning or multiple interpretations in the codebase. One line per term: `**Term**: definition`.

# 4. References
Links to related ADRs, discovery doc, vision doc, or external specs that informed requirements. One line per link.
```

## When the SRS grows

Once a single `docs/srs.md` is hard to scan, keep it as an index and move each domain to `docs/requirements/<domain>.md`. The index lists domains with links; each domain file holds its RF-XXX requirements. Do not renumber requirements when moving them.
