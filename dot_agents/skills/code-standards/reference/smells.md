# Smell Baseline

Named heuristics for a change no repository standard covers. A name is a hypothesis, not a violation: report only a concrete failure mode or measurable cost, and let repository conventions and configured tooling win. Apply a name only when its failure mode is present; names and scores do not predict defects by themselves.

## Design smells

- **Mysterious name**: a function, variable, or type whose name does not reveal what it does or holds. → rename it; if no honest name comes, the design is murky.
- **Duplicated code**: repeated policy or invariant where one copy can drift from the other, especially a security control. → reuse one implementation when the behavior is genuinely shared; unrelated lookalikes need no abstraction.
- **Drifted duplicate**: two copies of one rule that have already diverged, so the same input gets two policies. → find the divergence before extracting; the difference is usually the guard one copy lost.
- **Feature envy**: a method depends mostly on another object's data and policy. → check ownership before moving it; preserving the public seam may matter more than shortening the call.
- **Data clumps**: the same fields travel together, especially same-typed pairs whose transposition still compiles. → bundle them when a shared invariant or meaning makes the group stable.
- **Primitive obsession**: a primitive hides a domain constraint, unit, or valid state. → use a small domain type when it can enforce the constraint; do not wrap primitives only to rename them.
- **Repeated switches**: independent sites branch on the same variant and must change together for a new case. → centralize the shared decision when it has one owner; do not force polymorphism onto a closed local switch.
- **Shotgun surgery**: one logical change forces scattered edits across ownership boundaries. → identify the shared reason to change, then localize the policy without collapsing independent modules.
- **Divergent change**: one module edited for several unrelated reasons. → split so each module changes for one reason.
- **Speculative generality**: abstraction, parameters, or hooks for needs the contract does not have. → delete it, inline back until a real need shows.
- **Message chains**: a caller crosses multiple ownership boundaries to reach data it should not know about. → expose an operation at the appropriate boundary when the chain couples independent modules.
- **Middle man**: a layer only forwards and enforces no boundary or policy. → remove it when callers can safely use the underlying seam.
- **God file**: one file carrying unrelated reasons to change. → split by policy or owner, not by length.
- **Prefix as namespace**: several domain-prefixed files change together but lack an ownership boundary. → consider grouping them when that makes navigation and change locality better; a prefix alone is not a violation.
- **Refused bequest**: a subtype ignores most of an inherited contract. → prefer composition when it avoids exposing operations the subtype cannot support.

## Failure paths and invariants

- **Collapsed error cause**: different causes share an error classification despite requiring different retry, status, or recovery behavior. → preserve the distinction needed by callers without multiplying variants that callers treat identically.
- **Swallowed error**: a failure disappears with no path to a required outcome or diagnostic. → propagate it or account for it according to the operation's best-effort or fail-closed contract.
- **Comment-asserted invariant**: a comment or document promises a guarantee the code does not enforce. → make the code enforce it, or delete the claim.
- **Test-only invariant**: a production safety requirement relies only on a test assertion that cannot protect a release build. → enforce the requirement in the type or runtime path when necessary; tests still verify observable behavior.

## Test smells

Apply a listed name only when its failure mode is present in the change.

- **Tautological test**: the expected value recomputes the production logic, so the assertion cannot disagree with the code — or an assertion branch that can never be true (`contains(A) || starts_with(B)` where A is unreachable). → assert a literal or an independently derived value.
- **Assertion-free test**: the test executes the code and asserts nothing observable; an `unwrap()` proves it did not panic, nothing more. → assert the caller-visible outcome, or delete the test.
- **Happy-path-only test**: the contract names rejection, isolation, or a boundary, and only the success branch is asserted. → assert the other tenant, the missing credential, the foreign id, and the boundary value.
- **Assertion roulette**: many bare assertions, so a failure does not name the rule that broke. → one reason per test, or name the assertions.
- **Eager test**: one test verifying several behaviours. → split by the reason it can fail.
- **Mystery guest**: the fixture comes from a resource the reader cannot see in the test. → build the fixture where it is read, named for the case.
- **Conditional test logic**: branches or loops inside a test body. → parameterize the cases, or split them.
- **Fragile test**: breaks on a refactor that leaves the behaviour unchanged, or asserts the mock rather than the seam. → assert at the caller-visible seam.
- **Nondeterministic test**: depends on wall-clock time, ordering, sleeps, or shared mutable state. → inject the clock and seed, or make the case order-independent.
- **Silently skipped test**: an early return, `else { return; }`, or a swallowed error when a prerequisite is missing, so the test reports green while asserting nothing. → fail with the missing prerequisite named, or mark the test ignored with its reason so the skip is visible.
- **Test-only code path**: production code that exists to make a test pass — a header the test writes, a branch the test flips — so the test proves the backdoor rather than the contract. → drive the real seam, or move the seam into the test.
- **Name-assertion gap**: the test name claims a property the body never checks, so the name outlives the assertion it replaced. → assert the claimed property, or rename the test to what it proves.

## Complexity

Cyclomatic and cognitive complexity are prompts to inspect a change, not defect gates. Report the specific structural cost instead of a score.

- **Nesting deeper than the change requires**: the reader must hold several conditions at once. → invert the guard and return early, or extract the inner block.
- **Mixed-operator boolean chain**: `&&` and `||` combined without grouping. → extract named predicates.
- **Several reasons to change in one unit**: it changes for unrelated inputs, actors, or data. → split by reason.

## Coupling (connascence)

Two elements are coupled when a change in one forces a change in the other. Risk tends to increase with stronger, less local dependencies across more sites; the categories below are prompts to identify a concrete change cost, not a severity formula.

- **By name** (weakest): agreement on an identifier. Acceptable almost anywhere.
- **By type**: agreement on a type's shape. → keep the shared type small and stable.
- **By meaning**: agreement on what a magic value means. → a named constant or a small type.
- **By position**: agreement on argument or field order. → pass a named or typed value.
- **By algorithm**: agreement that two sides compute the same way. → one implementation both call.
- **By execution order or timing** (strongest, dynamic): one side must run before another. → make the order explicit in the type or the call, never in a comment.
