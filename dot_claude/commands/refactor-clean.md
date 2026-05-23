Invoke the refactor-cleaner agent to safely remove dead code, unused dependencies, and duplicate logic.

Use for: maintenance windows, after completing a major feature, or when the codebase has accumulated dead weight.

The refactor-cleaner will:
1. Run detection tools (`knip`, `depcheck`, `ts-prune`)
2. Categorize findings by risk level
3. Remove in safe batches: unused imports → dead exports → unused files → unused deps
4. Run tests and build after each batch before proceeding

Does not run during active feature development or before production deployments.
