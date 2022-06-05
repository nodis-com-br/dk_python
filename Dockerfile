FROM python:3.10.4-slim-buster

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
ENV VERSION="3.10.4"
ENV PATH="/home/python/.local/bin:${PATH}"
ARG SUDO_FORCE_REMOVE=yes

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install build-essential libpcre3-dev libssl-dev && \
    useradd -Ums /bin/sh python

USER python
RUN pip install uwsgi uwsgitop pipenv gunicorn

USER root
RUN apt-get -y purge build-essential libpcre3-dev libssl-dev sudo && \
    apt-get -y autoremove

USER python