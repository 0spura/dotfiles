# Architecture Template (initial creation)

Include only the sections that have non-obvious decisions. Omit sections fully covered by the SRS, stack docs, or ai-memory decisions; a reference link is sufficient.

```markdown
# Architecture: [Product Name]

> Stack: [docs/project.md](./project.md)
> Vision: [docs/product/vision.md](./product/vision.md)
> SRS: [docs/srs.md](./srs.md)

## Data Model
Entities, relationships, and key fields. Enough to implement without ambiguity. Not a full ERD.

## Business Rules
Non-obvious rules the implementation must preserve, traced to SRS requirement IDs.

## Integration Patterns
Protocols, sync strategy, conflict resolution, retry policy, failure handling.
Do not document field-level API contracts; those live in code.

## Security Model
Auth mechanism, permission model, trust boundaries, data sensitivity classification.

## Deployment
Where each component runs, how it scales, CI/CD flow per component.

## Failure Modes
What fails, how it fails, user impact, system behavior, recovery path.
```

## When the architecture grows

Once a single `docs/architecture.md` is hard to scan, keep it as an index and move each concern to `docs/architecture/<concern>.md` (for example `data-model.md`, `security.md`, `integrations.md`). UI and navigation patterns never live here; they belong in `docs/design/`.
