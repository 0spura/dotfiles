# Working with workctl

workctl is the only interface to the tracker and the code host. It hides the provider behind one command surface, so you think in issue and change-request numbers, never in provider mechanics. Never reach for the provider's own CLI for tracker work; if workctl cannot do something, say so instead of working around it.

## The mental model

**The repository you are standing in is the context.** Run workctl from inside the project you are working on. It reads that checkout's Git `origin` and `.workctl.json` and decides the provider, repository, project fields, and defaults by itself. So `workctl issue view 123` is already complete: no repository, no provider, no path. Passing `--repo-path` or `--repo` for the project you are in adds noise and risks pointing at the wrong place. Reach for them only when you deliberately act on a different checkout or repository than the one you are in.

**The provider changes the grammar, not the intent.** The command groups, flag names, and verbs can differ between providers. Read `workctl --help` and the specific command's `--help` once before composing a command, and trust what it prints over habit or memory of another provider.

**Configuration replaces flags.** Labels, assignees, project fields, merge method, base branch, draft, and output format come from `.workctl.json` defaults. Omit a flag the config already supplies; add one only to override. Where help offers automatic selection (`@auto`, `@current`), let workctl choose instead of guessing a value.

**Output is compact text for you to read.** Do not pass `--format text`. Ask for `--format json` only when a script or check consumes exact fields.

## Reading and writing

- Read before writing, and read the result back after: view the issue after editing it, view the change request after creating it. A write report like `#123 updated` says the call succeeded, not that the contents are what you intended.
- Edit bodies surgically: `--append-body`, `--replace-section "## Acceptance"`, or `--patch-file`. Never rewrite a whole body to change one part. Add `--expect-updated-at` when someone else may be editing.
- Bodies travel on stdin and never as shell arguments. Pass anything multi-line or containing backticks, `$`, or quotes through a quoted heredoc, because inside double quotes the shell executes backticks before workctl sees them:

  ```sh
  workctl issue comment 123 --body-file - <<'EOF'
  Verified with `cargo test`; 580 passed.
  EOF
  ```

- Prefer one command that expresses the whole change (state, reason, and comment together; the issue link at creation) over several that can half-apply.
- Relationships are real objects, not prose: parent, sub-issue, blocker, and closing links are options listed in help. A "Closes #123" in text is not a link.

## When something fails

Errors print `code: message: cause` on stderr with an empty stdout and a nonzero exit. The **cause** is the provider's own reason (not found, forbidden, not mergeable, rejected argument). Read it and fix the actual problem:

| Code | Meaning | Do |
| --- | --- | --- |
| `invalid_input` | Rejected argument; the cause names it | Correct the flag or value. Check `--help`. |
| `*_cli` (provider CLI failure) | The provider call failed; the cause says why | Act on the cause; do not blindly retry. |
| `not_*` (wrong kind of item) | The number is the other kind, or does not exist | Use the right group or number. |
| `partial_success` | Some steps applied; identity plus completed/pending steps are shown | Inspect the resource and run only the pending steps. |
| `*_write_uncertain` | The write may have happened | Read the remote state first; never repeat a create. |
| `context` / `config` | No resolvable repository or invalid config | Run from inside the project, or fix config; do not invent a repo. |

workctl never retries and never rolls back. Retry decisions are yours, made from observed state. A missing `workctl` binary or an unauthenticated provider CLI is an environment blocker: report it rather than substituting another tool.

## Automation

Locally approved workflows in the repository may move stages, track time, or merge when branches, change requests, or issue edits happen. Your correct mutation is the trigger; do not repeat what automation does. `workctl workflow status` and `workflow actions` show what ran or is pending. Never `workflow approve` or `resolve` to get unblocked; that is the user's authority.
