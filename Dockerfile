FROM python:3.14-slim

RUN pip install --no-cache-dir schemathesis==4.7.5

COPY ./apis/*/specifications/* /specifications/

ENV PYTHONUNBUFFERED=1

CMD while true; do \
    st run "/specifications/${API}-openapi.json" \
        --url "http://${HOST}:${PORT}" \
        --max-examples 1500 \
        --continue-on-failure \
        --suppress-health-check all \
        --no-shrink; \
    done
