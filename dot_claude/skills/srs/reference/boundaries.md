# SRS Scope Boundaries

The SRS states what the system must do — observable behavior, verifiable by a test. Everything else belongs in another document. When in doubt, place content by the question it answers.

| Content | Answers | Belongs in |
|---|---|---|
| Requirement: observable system behavior | What must the system do? | `docs/srs.md` (or `docs/requirements/<domain>.md`) |
| Screens, navigation, gestures, visual states, flow between screens | What does the user see and tap? | `docs/design/` |
| Data model, APIs, protocols, sync, failure handling | How is it built? | `docs/architecture.md` |
| A costly-to-reverse decision and its alternatives | Why did we choose this? | `docs/adr/` |

## The drift test

Before writing a requirement, read it back:

- If it describes a screen, a tap target, a transition, or "the user navigates to…" → it is a **UI flow**. Move it to `docs/design/`.
- If it describes a table, a field, an endpoint, a queue, or a retry policy → it is **architecture**. Move it to `docs/architecture.md`.
- If it can only be verified by looking at the interface rather than system behavior → it is **design**, not a requirement.

A requirement references the design or architecture that realizes it; it does not embed it. Example: `RF-CHK.2: a check-in is confirmed within 200ms of the tap` is a requirement. `The check-in opens a bottom sheet with a confirm button` is design — it lives in `docs/design/`.

## Splitting a growing SRS

A single `docs/srs.md` covers the product until it stops being easy to scan. Past that point:

- Keep `docs/srs.md` as an index: a table of domains, each linking to its file.
- Move each domain's RF-XXX block to `docs/requirements/<domain>.md`.
- Group related domains under subdirectories when the set itself grows (e.g. `docs/requirements/core/`, `docs/requirements/integrations/`, `docs/requirements/plugins/`).
- Never renumber or delete requirements when moving them. Deprecated requirements stay `~~strikethrough~~` with a note.
