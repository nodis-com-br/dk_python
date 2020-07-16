FROM python:3.7.3

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>

RUN apt-get update
RUN pip install uwsgi
RUN pip install uwsgitop