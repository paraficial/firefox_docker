FROM ubuntu:22.04
MAINTAINER jgw

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=dockeruser

RUN apt update
RUN apt -y upgrade --fix-missing
RUN apt -y install software-properties-common
RUn add-apt-repository -y ppa:mozillateam/ppa
RUN apt -y install pulseaudio firefox-esr ffmpeg ubuntu-restricted-extras libpci3

RUN useradd -s /bin/bash -m $USER
RUN echo "root:root" | chpasswd
RUN echo "dockeruser:dockeruser" | chpasswd

USER $USER
WORKDIR /home/$USER

