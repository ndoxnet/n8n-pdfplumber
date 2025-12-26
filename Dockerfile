FROM n8nio/n8n:latest

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 python3-pip \
  && pip3 install --no-cache-dir pdfplumber \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER node
