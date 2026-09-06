# Parallel Execution

Use parallel writers only when each item has a distinct implementation surface,
independent acceptance, and no real dependency. Give each writer its own
worktree and a bounded tracker contract.

Before starting, confirm that the changes can merge without ordering or shared
state. After integrating all results, run the feature-level verification on the
combined branch. A conflict or integration failure invalidates the independence
assumption: stop the batch, record the outcome, and serialize the remaining
work.

Do not parallelize merely to fill capacity. The coordination and integration
cost must be lower than the expected time saved.
