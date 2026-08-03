#!/bin/sh
# Kiro CLI SessionStart hook → ai-memory session-start.
# 1. Forwards the event JSON to the ai-memory server (fire-and-forget).
# 2. Synchronously fetches the pending cross-agent handoff and prints
#    it to stdout — Kiro adds SessionStart stdout to the agent's context.
#
# Kiro payload: {"hook_event_name":"SessionStart","cwd":"...","session_id":"..."}

_lib_dir="$(dirname "$0")"
[ -f "$_lib_dir/_lib.sh" ] || _lib_dir="$_lib_dir/.."
. "$_lib_dir/_lib.sh"

SERVER="${AI_MEMORY_HOOK_URL:-http://127.0.0.1:49374}"
PAYLOAD=$(cat)
CWD=$(ai_memory_extract_cwd "$PAYLOAD")
QS=$(ai_memory_marker_qs "$CWD")
SESSION_ID=$(ai_memory_extract_session_id "$PAYLOAD")
SESSION_QS=""
[ -n "$SESSION_ID" ] && SESSION_QS="&session_id=$(ai_memory_url_encode "$SESSION_ID")"

printf '%s' "$PAYLOAD" \
    | ai_memory_post_hook "$SERVER/hook?event=session-start&agent=kiro-cli${QS}${SESSION_QS}" >/dev/null 2>&1 || true

# Kiro adds SessionStart stdout directly to the agent's context (raw text).
HANDOFF=$(ai_memory_get_handoff "$SERVER/handoff?agent=kiro-cli${QS}${SESSION_QS}" 2>/dev/null || true)
[ -n "$HANDOFF" ] && printf '%s\n' "$HANDOFF"

exit 0
