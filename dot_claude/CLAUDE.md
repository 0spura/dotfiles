# Code Style
- Minimal comments: prefer self-documenting names and structure
- Use native language features and standard library before custom implementations
- Favor simple, direct solutions — avoid over-engineering and unnecessary abstractions
- Comment only for: complex business logic, non-obvious algorithms, external API quirks

# Working Approach
- Match the conventions already present — do not introduce new patterns unless explicitly asked
- Components: follow the granularity of what already exists. Do not split into components where the codebase doesn't, and do not merge files that are intentionally separate
- When working in any subdirectory that has a CLAUDE.md, read it before making changes

# What NOT to do
- Do not reorganize code into components just because it's "cleaner" in isolation
- Do not consolidate multiple files into one, or split one file into many, unless explicitly instructed
