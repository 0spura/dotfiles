# Module and File Layout

Vocabulary for placing code, and for reviewing where it landed.

- **Reason to change**: the actor, input, or policy that makes a file's contents move together. It decides placement; size and count do not.
- **Change locality**: group files that change together behind a clear owner. Common Closure and Common Reuse apply to packages; Reuse/Release Equivalence concerns packages released as a unit, not individual source files. None requires a folder for each policy.
- **Package by feature**: when domain ownership drives changes, let the tree name domains and use cases; a technical-layer layout can still be clearer for a cohesive shared subsystem.
- **Prefix as namespace**: a domain prefix repeated across several files can signal a missing boundary. Check whether those files actually share a reason to change before moving them; language-idiomatic prefixes and isolated names need no folder.
- **Folder depth**: nest only when an owned concern is easier to locate and change as a group; avoid depth that adds navigation without clarifying ownership.
- **God file**: one file carrying unrelated policies or responsibilities. It is evidence of **divergent change**, never of length; a large cohesive module may be deliberate.

## Shape

```text
src/
  caep/
    mod.rs           # caller-facing seam
    delivery.rs      # delivery policy
    subjects.rs      # subject policy
  idp/
    mod.rs
    resolver.rs
    cache.rs
```

Here `caep/` and `idp/` have distinct owners and reasons to change. A prefix such as `caep_delivery.rs` is unnecessary *after* the domain has a folder. This example is not a depth rule: a flat layout may be clearer for a small module, and another level may be justified by a cohesive subdomain.
