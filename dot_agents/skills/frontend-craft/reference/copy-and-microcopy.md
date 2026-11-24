# Copy, UI Microcopy & Anti-Slop Rules

Interfaces feel amateur faster from generic AI copy than from CSS bugs. Write plain, specific, human language that states what things actually do.

## 1. Banned AI-slop words & stock phrases

Never use these unless quoting client-supplied copy verbatim:
- **Buzzwords:** *elevate, empower, seamless, seamlessly, unlock, revolutionize, next-generation, cutting-edge, supercharge, turbocharge, game-changer, synergy, holistic, robust, leverage, delve, effortless, effortlessly, transformative, reimagine, streamline your workflow*.
- **Stock openings:** *"In today's fast-paced world…"*, *"Welcome to the future of…"*, *"Built for modern teams…"*, *"Everything you need to…"*, *"Take your X to the next level…"*.
- **Vague labels:** *"Submit"*, *"Click here"*, *"Learn more"* (without naming what), *"Something went wrong"* (without cause or next action).

## 2. UI microcopy rules

| Element | Rule | Good vs. Bad |
| --- | --- | --- |
| **Buttons & CTAs** | **Verb + object** describing the exact outcome. | `"Create API key"`, `"Revoke session"` — not `"Submit"`, `"OK"`, `"Save changes"` (when creating) |
| **Headings** | Name a concrete object or task, not an abstract virtue. | `"Webhook endpoints"` — not `"Seamless integrations"` |
| **Form labels & hints** | Visible persistent `<label>` above input; placeholder shows format example, never replaces the label. | Label: `"Redirect URI"` · Placeholder: `"https://app.example.com/callback"` |
| **Validation & errors** | State **what failed + why + how to fix it**, placed inline under the affected field. | `"Token name must be 3–40 lowercase letters or hyphens."` — not `"Invalid input"` |
| **Empty states** | Distinguish first-run vs. zero-filter-results; state what belongs here + one clear action. | `"No API keys yet. Create a key to authenticate CLI requests."` + `[Create API key]` |
| **Destructive dialogs** | Name the exact resource and consequence; match the button verb to the action. | Title: `"Delete project atlas?"` · Button: `"Delete project"` — not `"Are you sure?"` + `"Yes"` |
| **Status & feedback** | Concise confirmation naming the completed change; include `Undo` when reversible. | `"Key prod-ci revoked"` — not `"Operation completed successfully!"` |

## 3. Realism & honesty

- **No fake social proof:** Never invent customer quotes, star ratings, user counts, or partner logos.
- **No filler text:** Never ship `"Lorem ipsum"`, `"John Doe"`, `"foo/bar"`, or `"Test 123"` in visible UI. Use realistic domain data (and clearly mark any stand-in/assumed values in the final report).
- **No redundant captions:** Do not write captions under product screenshots or visuals that merely narrate what the user already sees.
- **Consistent vocabulary:** Use the exact same noun for a domain concept everywhere (don't alternate *Workspace*, *Organization*, and *Team* for the same entity).
