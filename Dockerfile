FROM python:3.9.10-slim-buster

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
ENV VERSION="3.9.10"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential
RUN useradd -ms /bin/bash python

USER python
RUN pip install uwsgi uwsgitop

USER root
RUN apt-get -y purge build-essential
RUN apt-get -y autoremove

USER python