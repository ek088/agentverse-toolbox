# The machine an AgentVerse agent works on.
#
# Nothing here is exotic: a small Python base, the two command-line tools our
# reports need, and our own scripts on the PATH. The point is that this file —
# not a setting in the product — is what decides what the agent can do.
FROM python:3.12-slim

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      pandoc \
      qpdf \
      jq \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir tabulate

# Our own utilities. An agent finds them the way a person would — they are on
# the PATH and they answer --help.
COPY bin/ /opt/toolbox/bin/
RUN chmod +x /opt/toolbox/bin/*
ENV PATH="/opt/toolbox/bin:${PATH}"

# A marker the agent can read out loud, so a demo can prove which machine it is
# standing on rather than asserting it.
RUN printf 'Northwind toolbox image\nbuilt from github.com/%s\n' "${GITHUB_REPOSITORY:-ek088/agentverse-toolbox}" > /etc/toolbox-release

WORKDIR /home/user
