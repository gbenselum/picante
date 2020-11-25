FROM registry.access.redhat.com/ubi8/ubi
MAINTAINER gabrielzeven <gbenselum@gmail.com>

RUN dnf -y update && dnf -y install httpd git wget unzip python2 python3 php && dnf clean all

RUN mkdir toolz 
WORKDIR /toolz

RUN git clone https://github.com/laramies/theHarvester.git && chmod +x theHarvester/theHarvester.py

# RUN pip install requests && 
