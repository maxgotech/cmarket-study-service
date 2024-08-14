# syntax=docker/dockerfile:1

FROM python:3.12

WORKDIR /docker-cmarket-study-service

COPY /studyService/requirements.txt /docker-cmarket-study-service/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /docker-cmarket-study-service/requirements.txt

COPY /studyService/app /docker-cmarket-study-service/app

CMD ["fastapi", "run", "app/main.py", "--port", "80"]