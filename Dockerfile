FROM node:20-bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# 1) Install dependencies dasar untuk apt & TLS
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
  ; \
  rm -rf /var/lib/apt/lists/*

# 2) Install python + pip + pdfplumber
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
  ; \
  pip3 install --no-cache-dir pdfplumber; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*

# 3) Install n8n
RUN set -eux; \
  npm install -g n8n

USER node
EXPOSE 5678
CMD ["n8n"]
