# FROM registry.access.redhat.com/ubi8/ubi
FROM registry.fedoraproject.org/fedora
MAINTAINER gabrielzeven <gbenselum@gmail.com>
# GCC and Python3.7 for harvester
RUN dnf -y update && dnf -y install httpd git wget unzip python2 make php && dnf clean all
RUN dnf -y install gcc openssl-devel bzip2-devel libffi-devel zlib-devel make

WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz && tar xzf Python-3.7.9.tgz


WORKDIR /usr/src/Python-3.7.9

RUN ./configure --enable-optimizations
RUN make altinstall
RUN ln /usr/local/bin/python3.7 /usr/bin/python3

RUN rm /usr/src/Python-3.7.9.tgz


RUN mkdir toolz 
WORKDIR /toolz

RUN git clone https://github.com/laramies/theHarvester.git && chmod +x theHarvester/theHarvester.py
workdir /toolz/theHarvester
RUN pip3 install -r /toolz/theHarvester/requirements/base.txt
 
