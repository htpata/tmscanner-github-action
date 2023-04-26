FROM python:3.8-slim-bullseye

ARG TM_URL
ARG TM_REPOSITORY_ID
ARG TM_SOURCE

# Using ARG to set ENV
ENV ENV_TM_URL=$TM_URL
ENV ENV_TM_REPOSITORY_ID=$TM_REPOSITORY_ID
ENV ENV_TM_SOURCE=$TM_SOURCE

WORKDIR /app

# prepare client
COPY requirements.txt .
COPY tm_analyze.py .
COPY $TM_SOURCE .

RUN pip install -r requirements.txt

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
