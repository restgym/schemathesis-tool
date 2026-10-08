#!/bin/sh

# TIME_BUDGET is in minutes; --max-time takes seconds.
st run "/specifications/${API}-openapi.json" \
  --url "http://${HOST}:${PORT}" \
  --max-time "$(( TIME_BUDGET * 60 ))" \
  --continue-on-failure \
  --no-shrink \
  --suppress-health-check all

# RESTgym records a run as failed if the tool container exits before the budget ends.
exec sleep infinity
