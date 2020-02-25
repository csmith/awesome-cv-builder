FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install --no-install-recommends -y texlive-full \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd latex \
	&& mkdir /work

WORKDIR /work
USER latex
CMD xelatex cv.tex
