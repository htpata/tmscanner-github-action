FROM python:3.8-slim-bullseye

WORKDIR /app

# prepare client
COPY requirements.txt .
COPY tm_analyze.py .
COPY ${TM_SOURCE} .

RUN pip install -r requirements.txt

# Prepare entrypoint
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
