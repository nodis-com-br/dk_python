FROM python:3.7.3

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
ENV VERSION="1.0.0"

RUN apt-get update
RUN apt-get -y upgrade
RUN pip install uwsgi
RUN pip install uwsgitop