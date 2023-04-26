FROM python:3.8-slim-bullseye

# ARG TM_URL
# ARG TM_REPOSITORY_ID
# ARG TM_SOURCE

RUN echo "*************************dockerfile1a"
RUN echo ${TM_URL}
RUN echo ${TM_REPOSITORY_ID}
RUN echo ${TM_SOURCE}
RUN echo ${TM_TOKEN}
RUN echo "*************************dockerfile2a"
RUN echo $TM_URL
RUN echo $TM_REPOSITORY_ID
RUN echo $TM_SOURCE
RUN echo $TM_TOKEN
RUN echo "*************************dockerfile3a"

# Using ARG to set ENV  TM_REPOSITORY_ID
# ENV ENV_TM_URL=$TM_URL
# ENV ENV_TM_REPOSITORY_ID=$TM_REPOSITORY_ID
# ENV ENV_TM_SOURCE=$TM_SOURCE

WORKDIR /app

# prepare client
COPY requirements.txt /app/requirements.txt
COPY tm_analyze.py /app/tm_analyze.py
COPY ${TM_SOURCE} /app/${TM_SOURCE}

RUN pip install -r requirements.txt

RUN ls -la

# CMD python /app/tm_analyze.py ${TM_URL} ${TM_REPOSITORY_ID} /app/${TM_SOURCE}
# ENTRYPOINT entrypoint ${TM_URL} ${TM_REPOSITORY_ID} /app/${TM_SOURCE}

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh ${TM_URL} ${TM_REPOSITORY_ID} /app/${TM_SOURCE}
# CMD ["${ENV_TM_URL}", "${ENV_TM_REPOSITORY_ID}", "${ENV_TM_SOURCE}"]
