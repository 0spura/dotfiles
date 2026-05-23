Invoke the doc-updater agent to synchronize documentation with the current codebase state.

Use for: after major features, API changes, removed functionality, or architecture shifts.

The doc-updater will:
1. Identify which docs are affected by recent changes
2. Update READMEs, API docs, and architecture references to match actual code
3. Remove stale references — dead links and removed features
4. Verify file paths and code examples before including them

Generates from code — never fabricates. Stale docs are worse than no docs.
