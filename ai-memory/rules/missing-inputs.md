# Missing Inputs

State what is missing and why it blocks the work rather than guessing a credential, business rule, endpoint, schema, production value, or secret.

Never invent a default value for an absent field. If a field, parameter, or config value is missing, leave it absent (omit it or set it to an explicit null) and surface the gap. A plausible-but-wrong default fails silently; a missing value fails loudly and gets fixed.
