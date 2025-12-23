#!/bin/sh
set -e

while true; do
    st run "/specifications/${API}-openapi.json" \
        --url "http://${HOST}:${PORT}" \
        --max-examples 1500 \
        --continue-on-failure \
        --suppress-health-check all \
        --no-shrink;
done
