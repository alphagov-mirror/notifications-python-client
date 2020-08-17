FROM debian:buster

ENV PYTHONUNBUFFERED=1 \
	DEBIAN_FRONTEND=noninteractive

RUN \
	echo "Install base packages" \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		make \
		git \
		gnupg \
		python2.7 \
		python3.7 \
		python3-pip \
		python3-setuptools \
		python-pip \
		python-setuptools \
	&& echo "Clean up" \
	&& rm -rf /tmp/*

RUN \
	apt-get install -y --no-install-recommends \
	gcc python3-dev

RUN \
	echo "Install global pip packages" \
	&& python3.7 -m pip install tox

WORKDIR /var/project
