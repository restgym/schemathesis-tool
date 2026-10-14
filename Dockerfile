# Pinned to a digest, since the tag moves to every new patch release of Python 3.14 and of Debian
FROM python:3.14-slim@sha256:a2b82f3c48559aa0a8446d9af49826b6e2b2016f4cd2afabfe6013ec53729170

# Schemathesis 4.30.0, with exact versions of all the packages (requirements.txt)
COPY ./tools/schemathesis/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt

ENV PYTHONUNBUFFERED=1

COPY ./tools/schemathesis/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
