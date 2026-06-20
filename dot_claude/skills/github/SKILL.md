---
name: github
description: "Use when implementation-plan, implementation, or pull-request needs GitHub-specific tracker operations via gh, REST, or GraphQL."
---

# Tracker GitHub

Use this skill for GitHub-specific project management. Keep conceptual planning in `implementation-plan`; use this skill to execute it on GitHub.

## Tool Order

- Use `gh` for CLI-supported issue, PR, branch, and check workflows.
- Use `gh api` or `gh api graphql` for fields, project items, relationships, and gaps not exposed by the regular `gh` commands.
- Never hardcode IDs. Discover repository, organization, project, field, option, issue type, and item IDs at runtime and save the most important in project memory.
- Reuse discovered IDs from project memory when available, but validate them if a command fails or the project changed.
- Query the specific issue/project item you need. Avoid listing every project item or issue body unless a broad audit is required.

## Discovery

```bash
gh repo view --json owner,name
gh issue list --repo OWNER/REPO --state open --limit 2
gh issue list --repo OWNER/REPO --state closed --limit 2
gh api repos/OWNER/REPO/issues/issue-types
gh api orgs/OWNER/issue-field-definitions
```

Discover GitHub Projects V2 IDs and fields:

```bash
gh api graphql -f query='
{
  organization(login: "OWNER") {
    projectsV2(first: 20) {
      nodes { id number title }
    }
  }
}'

gh api graphql -f query='
{
  node(id: "PROJECT_ID") {
    ... on ProjectV2 {
      fields(first: 50) {
        nodes {
          ... on ProjectV2SingleSelectField { id name options { id name } }
          ... on ProjectV2Field { id name }
          ... on ProjectV2IterationField { id name configuration { iterations { id title } } }
        }
      }
    }
  }
}'
```

## Issues

Create issue:

```bash
gh issue create --repo OWNER/REPO --title "title" --body-file BODY.md
```

Edit common issue metadata:

```bash
gh issue edit ISSUE_NUMBER --repo OWNER/REPO --add-assignee USER --milestone "MILESTONE"
```

Set issue type by discovering the type ID first:

```bash
gh api repos/OWNER/REPO/issues/ISSUE_NUMBER --method PATCH --field type="ISSUE_TYPE_NODE_ID"
```

Set organization issue fields such as Priority or Effort:

```bash
gh api repos/OWNER/REPO/issues/ISSUE_NUMBER/issue-field-values \
  --method POST \
  --field issue_field_id=FIELD_ID \
  --field value="OPTION_VALUE_ID"
```

## Project Fields

Get the issue's project item ID:

```bash
gh api graphql -f query='
{
  repository(owner: "OWNER", name: "REPO") {
    issue(number: ISSUE_NUMBER) {
      id
      projectItems(first: 20) {
        nodes { id project { id title } }
      }
    }
  }
}'
```

Set a single-select project field, such as Status or Size:

```bash
gh api graphql -f query='
mutation {
  updateProjectV2ItemFieldValue(input: {
    projectId: "PROJECT_ID"
    itemId: "PROJECT_ITEM_ID"
    fieldId: "FIELD_ID"
    value: { singleSelectOptionId: "OPTION_ID" }
  }) { projectV2Item { id } }
}'
```

Rules:

- Use Project Status for workflow state.
- Use Project Size/Estimate and org Effort fields for complexity; do not encode estimates in labels.
- Use Priority fields when available; do not invent priority labels.
- Use labels only for durable taxonomy that fields do not model.
- When updating a field, first fetch the issue's project item ID and the target field/option IDs; then update only that item.

## Relationships And Branches

- Prefer sub-issues for parent/child hierarchy.
- Prefer GitHub relationships for `blocked by`, `blocking`, `related`, and `duplicate`.
- Use `gh api graphql` for relationships when the regular `gh` commands do not expose them.
- Use `gh issue develop ISSUE_NUMBER --repo OWNER/REPO --name BRANCH_NAME --checkout` to create and switch to a linked branch before implementation.
- Do not run `git checkout -b` before `gh issue develop`; let GitHub create/link the development branch.
- For an existing branch, use GraphQL `createLinkedBranch` with the issue ID, repository ID, branch name, and branch OID.
- Open the PR from the linked branch.
- Do not put issue numbers in commit messages.
- Do not put issue numbers in the PR body unless explicitly requested.

Link an existing branch to an issue:

```bash
gh api graphql -f query='
{
  repository(owner: "OWNER", name: "REPO") {
    id
    issue(number: ISSUE_NUMBER) { id }
    ref(qualifiedName: "refs/heads/BRANCH_NAME") { target { oid } }
  }
}'

gh api graphql -f query='
mutation {
  createLinkedBranch(input: {
    issueId: "ISSUE_ID"
    repositoryId: "REPOSITORY_ID"
    name: "BRANCH_NAME"
    oid: "BRANCH_OID"
  }) { linkedBranch { ref { name } } }
}'
```

## Pull Requests And Checks

```bash
gh pr create --repo OWNER/REPO --base BASE --head BRANCH --title "title" --body-file BODY.md
gh pr edit PR_NUMBER --repo OWNER/REPO --body-file BODY.md
gh pr checks PR_NUMBER --repo OWNER/REPO
gh run view RUN_ID --repo OWNER/REPO --log-failed
```

## Done When

GitHub issues/PRs/projects reflect the requested tracker operation using discovered IDs and native GitHub fields.
