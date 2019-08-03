FROM debian:stable

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install software-properties-common apt-utils -y

RUN add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
RUN apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y alsa-utils pulseaudio libpulse-dev 

RUN apt-get install oracle-java8-installer -y --allow-unauthenticated
RUN apt-get autoremove --purge -y