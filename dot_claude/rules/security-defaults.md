# Security Defaults

Apply these rules when touching auth, authorization, user data, payments, public APIs, secrets, uploads, file access, external URLs, rendering, parsing, or input handling.

## Boundaries

- Validate untrusted input at system boundaries.
- Prefer allowlists over blocklists for accepted values, hosts, file types, and actions.
- Treat client-provided IDs, roles, prices, limits, paths, URLs, and ownership claims as untrusted.
- Fail closed when validation, authorization, or policy checks are missing or uncertain.

## Auth And Authorization

- Authentication is not authorization. Check permissions for the specific resource and action.
- Prevent IDOR by verifying resource ownership, tenant scope, or explicit access rights before reads and writes.
- Do not rely on hidden UI controls, route names, or client-side checks for security.
- For background jobs and service accounts, use least-privilege credentials instead of user tokens unless the design requires user delegation.

## Data Handling

- Do not hardcode secrets, tokens, passwords, API keys, private keys, or recovery codes.
- Do not log secrets, auth headers, session IDs, payment data, or sensitive personal data.
- User-facing errors must not expose stack traces, internal paths, queries, tokens, or infrastructure details.
- If a credential may have been exposed, stop and tell the user it must be rotated.

## Common Vulnerability Classes

- Injection: use parameterized queries and structured APIs; do not concatenate untrusted strings into SQL, shell commands, LDAP, templates, or queries.
- XSS: use safe rendering APIs and escaping; avoid raw HTML injection from untrusted content.
- SSRF: do not fetch user-controlled URLs without scheme, host, IP range, redirect, and allowlist checks.
- Path traversal: normalize paths and enforce that resolved paths stay within the allowed base directory.
- Unsafe deserialization: do not deserialize untrusted payloads with unsafe formats or loaders.
- Uploads: validate type, size, extension, storage path, and access policy; never execute uploaded content.
- CSRF: protect state-changing browser endpoints when cookie-based auth is used.
- Rate limits: add or preserve rate limits for public auth, signup, payment, webhook, and expensive endpoints.

## Review Before Finishing

For security-sensitive changes:

- Trace data from input to sink.
- Confirm every sensitive operation has authorization at the server boundary.
- Check failure behavior and default states.
- Search nearby code for the same risky pattern.
- Report remaining security assumptions and unverified risks clearly.
