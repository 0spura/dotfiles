# Parallel Execution

Give each writer a disjoint surface and bounded acceptance from the canonical issue when tracked; otherwise use the approved request. An execution slice does not require a tracker child. Carry issue identity and branch/base only when applicable, plus verification. Keep isolated workspaces off unless repository workflow requires them.

Before starting, confirm that the changes can merge without ordering or shared
state. After integrating all results, run the feature-level verification on the
combined branch. A conflict or integration failure invalidates the independence
assumption: stop the batch, report the outcome to the caller, and serialize the
remaining work.

The parent serializes branch creation/checkout, tracker writes/readback, commits, and change-request lifecycle when tracked. Children never switch a shared worktree or update remote issue state independently; they return evidence and proposed updates. Configured automation consumes parent-owned workctl mutations, not duplicate manual stage changes.

Do not parallelize merely to fill capacity. The coordination and integration
cost must be lower than the expected time saved.
