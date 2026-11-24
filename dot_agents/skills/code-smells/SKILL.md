---
name: code-smells
description: Named design, error-handling, test, complexity, and coupling smells to avoid while writing code and to flag during code review.
---

# Code Smells

Named anti-patterns for writing clean code and diagnosing concrete defects in review. Repository conventions and configured tooling win over defaults. Act on a smell only when its failure mode or maintenance cost is actually present — never invent scores or report style preferences.

## Design & architecture smells

- **Reinvented internal package / SDK**: hand-rolling config, secrets, auth/authz, validation, HTTP clients, or helpers that an existing workspace package, sibling internal SDK, or established ecosystem library already provides. → reuse or extend the shared package/SDK.
- **Inline per-route guard**: repeating auth, permission checks, or header extraction inside every handler. → move to a shared middleware, router layer, or SDK extractor.
- **Custom framework wrapper**: inventing a thin wrapper around native framework primitives (e.g., hiding the native router) without enforcing a real invariant. → use the framework's native router and layers.
- **Messy module root**: dumping stray internal imports or mixed business logic into a module's entry/index file. → keep module roots for declarations and intentional public exports.
- **God file / Divergent change**: one file or unit carrying unrelated reasons to change. → split by policy or owner, never by line count.
- **Prefix as namespace**: several domain-prefixed files changing together without an ownership boundary. → group behind a module folder when it clarifies ownership.
- **Duplicated code / Drifted duplicate**: repeated policy or invariant where copies can diverge (especially security controls). → find the divergence (often a lost guard) and reuse one owner.
- **Shotgun surgery**: one logical change forcing scattered edits across ownership boundaries. → localize the shared policy without collapsing independent modules.
- **Speculative generality**: abstractions, hooks, caches, or parameters for needs the contract does not have. → delete and inline until a second concrete variation exists.
- **Middle man**: a pass-through layer that enforces no invariant, translation, or trust boundary. → remove it and let callers use the underlying seam.
- **Message chains**: crossing multiple ownership boundaries to reach deep internal data. → expose an operation at the owning boundary.
- **Feature envy**: a method depending mostly on another module's data and policy. → check ownership before moving it without breaking the public seam.
- **Data clumps / Primitive obsession / Repeated boundary parsing**: same-typed fields traveling together, primitives hiding domain invariants/units, or raw untrusted inputs re-validated across internal layers instead of parsed once at the trust boundary. → parse once at the boundary into a small valid domain type.
- **Boolean flag soup (implicit state)**: modeling mutually exclusive or ordered business states with multiple booleans (`isPending`, `isCancelled`, `isApproved`) that allow invalid combinations. → model explicit states and transitions (tagged union / enum / state machine).
- **Repeated switches**: independent sites branching on the same variant that must change together. → centralize when one owner governs the dispatch.
- **Mysterious name**: an identifier that hides what it does or holds. → rename it; if no honest name fits, the responsibility is murky.
- **Refused bequest**: a subtype ignoring most of an inherited contract. → prefer composition.

## Failure paths, observability & invariants

- **Ad-hoc error response helper**: building raw HTTP/API error responses inline instead of propagating structured, hierarchical errors through the canonical error boundary. → map into the canonical error hierarchy and convert once at the boundary.
- **Opaque or leaking user error**: returning raw internal stack traces, SQL/paths, or unhelpful generic strings ("something went wrong") when a clear, safe, actionable message is possible. → separate internal cause chains (for traces) from user-facing messages and stable error codes.
- **Collapsed error cause**: merging distinct failure causes that require different retry, status, or recovery behavior. → preserve distinctions callers act on.
- **Swallowed error**: dropping or ignoring a failure where the contract requires propagation, accounting, or fail-closed behavior. → propagate or account for it explicitly.
- **Trace / log spam & log-and-rethrow**: logging inside tight loops, narrating trivial happy-path steps, or logging the same error at every layer before propagating it. → emit structured spans at strategic boundaries and log each failure once at the boundary that handles it.
- **Unbounded wait / orphan background task**: outbound HTTP/DB/RPC/queue calls without explicit timeouts or cancellation propagation, or fire-and-forget tasks that ignore shutdown and errors. → set explicit timeouts, propagate cancellation, and supervise background work.
- **Late config crash**: reading required environment variables or secrets lazily mid-request instead of validating them once at startup. → fail fast at startup with a clear missing-key error.
- **Comment-asserted invariant**: a comment promising a guarantee the code does not enforce. → enforce in types/runtime or delete the claim.
- **Test-only invariant**: a production safety guarantee enforced only by a test assertion. → enforce in the runtime/type path as well.

## Test smells

- **Tautological test**: recomputing production logic in the expected value so the test cannot disagree with the code. → assert literals or independently derived expectations.
- **Assertion-free test**: running code with no observable assertion (only checking that it did not crash/throw). → assert the caller-visible outcome or delete it.
- **Happy-path-only test**: contract specifies rejection, isolation, or boundaries, but only success is tested. → test missing credentials, foreign IDs, invalid inputs, and boundary values.
- **Fragile test**: breaks on behavior-preserving refactors or asserts mocks instead of the caller-visible seam. → assert at the public seam.
- **Eager test / Assertion roulette**: one test checking unrelated behaviors or bare assertions that hide which rule broke. → one failure reason per test.
- **Mystery guest / Conditional test logic**: hidden fixtures or `if`/loops inside test bodies. → build named fixtures inline and parameterize or split cases.
- **Nondeterministic test**: relies on wall-clock time, sleeps, ordering, or shared mutable state. → inject clock/seed and isolate state.
- **Silently skipped test**: early return when a prerequisite is missing so the test reports green. → fail loudly or mark ignored with a visible reason.
- **Test-only code path**: production branches/headers existing only to let tests pass. → drive the real seam.
- **Name-assertion gap**: test name claims a property the body never checks. → assert the property or rename the test.

## Complexity & coupling

- **Deep nesting**: reader must hold several conditions at once. → invert guards and return early, or extract a named helper.
- **Mixed-operator boolean chain**: `&&` and `||` combined without grouping. → extract named predicates.
- **Strong coupling (connascence)**: prefer weaker forms (`name` → `type`) over stronger forms (`meaning` magic values → `position` arg order → `algorithm` duplicated computation → `execution order/timing` hidden in comments). Make ordering explicit in types or call structure, never in comments.
