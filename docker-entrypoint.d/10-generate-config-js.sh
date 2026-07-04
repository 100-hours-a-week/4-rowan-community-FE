#!/bin/sh
set -eu

escaped_api_base_url=$(
    printf '%s' "${API_BASE_URL:-}" \
        | tr -d '\r\n' \
        | sed 's/\\/\\\\/g; s/"/\\"/g'
)

printf 'window.__APP_CONFIG__ = {"API_BASE_URL":"%s"};\n' "$escaped_api_base_url" \
    > /usr/share/nginx/html/config.js
