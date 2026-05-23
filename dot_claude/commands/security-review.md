Invoke the security-reviewer agent to scan current changes for vulnerabilities.

Use for: before committing auth changes, new API endpoints, file uploads, payment code, or any code touching user data.

The security-reviewer will check:
- Hardcoded secrets and credentials
- Input validation gaps
- SQL injection, XSS, path traversal vectors
- Auth and authorization gaps
- Rate limiting on public endpoints
- Error messages leaking sensitive data

Findings rated CRITICAL must be fixed before resuming other work.
