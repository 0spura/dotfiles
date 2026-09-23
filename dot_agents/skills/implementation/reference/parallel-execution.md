# Parallel Execution

Give each writer a disjoint write surface and a bounded tracker contract, and turn isolated workspaces on only when the repository workflow requires them.

Before starting, confirm that the changes can merge without ordering or shared
state. After integrating all results, run the feature-level verification on the
combined branch. A conflict or integration failure invalidates the independence
assumption: stop the batch, report the outcome to the caller, and serialize the
remaining work.

Do not parallelize merely to fill capacity. The coordination and integration
cost must be lower than the expected time saved.
