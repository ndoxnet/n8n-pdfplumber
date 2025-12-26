FROM n8nio/n8n:latest

USER root

# Install python + venv (Debian base) lalu install pdfplumber via venv (bukan pip system)
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    python3 \
    python3-venv \
    python3-pip \
    ca-certificates \
  ; \
  python3 -m venv /opt/venv; \
  /opt/venv/bin/pip install --no-cache-dir --upgrade pip setuptools wheel; \
  /opt/venv/bin/pip install --no-cache-dir pdfplumber; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*

# Biar "python" & "pip" default ngarah ke venv
ENV PATH="/opt/venv/bin:$PATH"

USER node
