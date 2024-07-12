FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN \
    apt-get update && \
    apt-get -y upgrade

# cFS dependencies
RUN \
    apt-get install sudo && \
    apt-get install -y build-essential && \
    apt-get install -y gcc && \ 
    apt-get install -y git && \
    apt-get install -y cmake && \
    apt-get install -y xterm && \
    apt-get install -y python2 && \
    apt-get install -y lcov && \
    apt-get install -y xxd && \
    apt-get install -y zlib1g-dev

# OnAIR dependencies

RUN \
    apt-get install -y python3.9 && \
    apt-get install -y python3.9-dev && \
    apt-get install -y python3-pip

RUN pip install \
    coverage==6.5.0 \
    numpy==1.23.4 \
    pytest==7.2.0 \
    pytest-mock==3.10.0 \ 
    pytest-randomly==3.12.0 \
    redis==4.6.0

# New packages go here to prevent re-running instructions when re buildingCOPY apps/onair_app/onair/requirements_pip.txt requirements.txt

RUN \
    apt-get update && \
    apt-get -y upgrade && \ 
    rm -rf /var/lib/apt/lists/*

