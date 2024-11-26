#!/bin/sh

# Replace environment variables in env.js
envsubst '${VITE_API_URL}' < /usr/share/nginx/html/env.js.template > /usr/share/nginx/html/env.js

# Execute CMD
exec "$@"