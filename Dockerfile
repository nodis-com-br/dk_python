FROM python:3.9.10-slim-buster

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
ENV VERSION="3.9.10"

ARG SUDO_FORCE_REMOVE=yes

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential
RUN useradd -Ums /bin/sh python

USER python
RUN pip install uwsgi uwsgitop

USER root
RUN apt-get -y purge build-essential sudo
RUN apt-get -y autoremove

USER python