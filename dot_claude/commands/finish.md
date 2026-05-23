Complete a development branch by verifying it's ready and choosing how to land the work.

## Process

**1. Verify tests**
Run the full test suite. If anything fails, stop — do not proceed until tests pass.

**2. Detect environment**
Check git configuration to determine workspace type: normal repo, git worktree, or detached HEAD.

**3. Present options**
For normal repos and worktrees:
- Merge to base branch locally
- Push branch and open a PR
- Keep branch as-is (no action)
- Discard branch permanently *(requires typing "discard" to confirm)*

**4. Execute the chosen option**
Follow the user's choice. For PR creation, use `gh pr create` with a summary of changes.

**5. Clean up**
Only for merge or discard: remove worktrees created during this session with `git worktree remove`. Never remove externally-managed worktrees.

## Safety Rules

- Never merge with failing tests
- Never delete a worktree before confirming the merge succeeded
- Always require explicit "discard" confirmation for destructive operations
