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
CMD DIR=$(mktemp -d); xelatex -output-directory=$DIR cv.tex; mv $DIR/cv.pdf .; rm -rf $DIR
