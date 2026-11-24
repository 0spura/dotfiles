# Architecture Patterns & Defaults

Pragmatic architectural defaults for new domains, services, and refactors. Apply a pattern only when the problem actually warrants its complexity.

## 1. System & service boundaries
- **Modular monolith first:** Separate domains into cohesive modules/packages with strict public seams before splitting into network-separated services. Extract a service only for independent scaling, deployment isolation, or hard security/compliance boundaries.
- **Shared SDKs for cross-cutting concerns:** Put shared auth/authz layers, config/secrets loading, HTTP clients, and protocol types in a versioned internal package/SDK rather than copy-pasting across services.

## 2. Module & dependency structure
- **Deep modules over shallow layers:** Prefer a small, stable public interface hiding real complexity over multi-layer pass-through wrappers (`Controller → Service → Manager → Repository` that only forward calls).
- **Ports & adapters only on real variation:** Introduce an interface/trait seam when there is a real external boundary (DB, external API, clock/IDs for determinism) or a **second concrete implementation** — never for a single internal class "just in case".
- **Parse at the trust boundary:** Decode and validate untrusted payloads once at the entry layer into valid domain types so core logic operates on guaranteed invariants.

## 3. Data, integration & reliability
- **Canonical error boundary:** Propagate structured hierarchical errors internally and convert them in one boundary layer into stable external codes and user-friendly messages.
- **Explicit state machines:** Model multi-step business lifecycles as explicit states and valid transitions rather than combinations of independent boolean flags.
- **Idempotency & outbox for async integration:** Guard retryable writes with idempotency keys; when a state change must both persist to a database and emit an event/webhook, use a transactional outbox (or equivalent atomic pattern) rather than dual-writing without recovery.
- **Bounded I/O & explicit timeouts:** Every collection query/fetch must be paginated, batched, or bounded; every outbound call must carry an explicit timeout and respect cancellation.
