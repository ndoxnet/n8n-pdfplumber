FROM node:20-bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install system deps + python
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# 2. Install pdfplumber (pakai --break-system-packages agar lolos PEP668)
RUN pip3 install --no-cache-dir --break-system-packages pdfplumber

# 3. Install n8n
RUN npm install -g n8n

# 4. Runtime config
USER node
EXPOSE 5678
CMD ["n8n"]
