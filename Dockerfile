FROM node:20-bookworm-slim

# install python + pip (untuk pdfplumber)
RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 python3-pip \
  && pip3 install --no-cache-dir pdfplumber \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install n8n
RUN npm install -g n8n

# n8n biasanya jalan sebagai user node
USER node

# port default n8n
EXPOSE 5678

CMD ["n8n"]
