FROM python:3.8-slim-bullseye

ARG TM_URL
ARG TM_REPOSITORY_ID
ARG TM_SOURCE

WORKDIR /app

# prepare client
COPY requirements.txt .
COPY tm_analyze.py .
COPY ${TM_SOURCE} .

RUN pip install -r requirements.txt

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh", ${TM_URL}, ${TM_REPOSITORY_ID}, ${TM_SOURCE}]
