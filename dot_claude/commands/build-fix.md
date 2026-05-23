Invoke the build-error-resolver agent to fix compilation or build failures.

Use for: TypeScript errors, module resolution failures, config issues, or any broken build.

The build-error-resolver will:
1. Collect all errors first (`tsc --noEmit`, `npm run build`)
2. Fix in priority order: build-breaking → type errors → warnings
3. Make the smallest possible changes — no refactoring
4. Verify the build passes before stopping

Changes stay under 5% of affected files.
