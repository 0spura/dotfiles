# SRS Drift Test

The SRS states what the system must do — observable behavior, verifiable by a test. Everything else belongs in another document. When unsure where content belongs, read a requirement back:

- If it describes a screen, a tap target, a transition, or "the user navigates to…" → it is a **UI flow**. Move it to `docs/design/`.
- If it describes a table, a field, an endpoint, a queue, or a retry policy → it is **architecture**. Move it to `docs/architecture.md`.
- If it can only be verified by looking at the interface rather than system behavior → it is **design**, not a requirement.

A requirement references the design or architecture that realizes it; it does not embed it.

Example: `RF-CHK.2: a check-in is confirmed within 200ms of the tap` is a requirement. `The check-in opens a bottom sheet with a confirm button` is design — it lives in `docs/design/`.
