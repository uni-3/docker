FROM nvidia/cuda:10.1-base
#FROM nvidia/cuda:9.0

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel

RUN python3.6 -m pip install --no-cache-dir -U pip

COPY ./requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app