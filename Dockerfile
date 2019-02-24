FROM python:3.5.6-stretch
MAINTAINER x3m444

ENV TZ 'Europe/Bucharest'

# install app
COPY . /opt/ChaturbateRecorder/

RUN apt-get update
RUN apt-get install libffi-dev libxml2-dev libxslt-dev git tzdata
RUN pip install -U pip setuptools
RUN python3.5 -m pip install livestreamer bs4 lxml gevent

# ports and volumes
#EXPOSE 8081
VOLUME /config /downloads  /opt/ChaturbateRecorder

ENTRYPOINT python3.5 /opt/ChaturbateRecorder/ChaturbateRecorder.py
