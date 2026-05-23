# Security Requirements

## Mandatory Before Commits Touching User Data, Auth, or APIs

- No hardcoded secrets, API keys, passwords, or tokens
- All user inputs validated at system boundaries (never trust, always validate)
- SQL uses parameterized queries only — never string concatenation
- HTML output sanitized before rendering
- CSRF protection on state-changing endpoints
- Every route has authentication and authorization checks
- Rate limiting on all public-facing endpoints
- Error messages never leak stack traces, internal paths, or sensitive data

## Secret Management

- Store credentials in environment variables or a secrets manager
- Confirm required env vars exist at application startup — fail fast if missing
- Rotate any credential that may have been exposed immediately

## Vulnerability Response Protocol

When a security issue is found:
1. Stop all other work immediately
2. Invoke the `security-reviewer` agent
3. Fix before resuming — never defer CRITICAL findings
4. Rotate any exposed credentials
5. Grep the full codebase for the same pattern elsewhere
