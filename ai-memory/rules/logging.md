# Logging

- Structured logs: stable event names, consistent fields, request or trace IDs, outcome, duration, and the domain identifiers involved.
- Carry business context: actor, entity IDs, feature flag, external dependency, status, error code.
- Gate hot-path and high-volume success logs behind a level, and drop temporary debug logs before finishing.
