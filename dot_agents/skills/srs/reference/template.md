# SRS Template (initial creation)

Use only when `docs/srs.md` does not yet exist.

```markdown
# SRS: [Product Name]

> Vision: [docs/product/vision.md](./product/vision.md)
> Product context: [docs/product/discovery.md](./product/discovery.md)

# 1. Functional Requirements

## RF-XXX: [Domain Name]

### RF-XXX.1: [Requirement name]
**Priority:** Must Have | **Dependencies:** none | **Status:** Specified | Implemented
* Concrete, verifiable behavior. One rule per bullet.
* Edge cases and limits go here.
* **Verification:** the test or command that fails when this rule is violated, by name — `rf_xxx_1_rejects_expired_token`, `cargo test -p api rf_xxx` — or the direct observation with its expected result. `Implemented` requires this verification to exist and pass.

---

# 2. Non-Functional Requirements

## RNF-XXX: [Category]

### RNF-XXX.1: [Requirement name]
**Priority:** Must Have | **Dependencies:** none | **Status:** Specified | Implemented
* Measurable target (for example, "< 100ms p95", "at least WCAG 2.1 AA").
* **Verification:** the measurement method and its expected result, by name. `Implemented` requires this verification to exist and pass.

---

# 3. Glossary
Terms with non-obvious domain meaning or multiple interpretations in the codebase. One line per term: `**Term**: definition`.

---

# 4. References
Links to related ai-memory decision summaries, discovery doc, vision doc, or external specs that informed requirements. One line per link.
```
