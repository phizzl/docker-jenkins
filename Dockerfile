FROM bitnami/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

RUN apt-get update && \
    apt-get install -y python3-pip libffi-dev libssl-dev ssl-cert && \
    apt-get clean all && \
    pip3 install paramiko ansible && \
    make-ssl-cert generate-default-snakeoil --force-overwrite && \
    apt-get purge -y libffi-dev libssl-dev && \
    apt-get autoremove -y && \
    apt-get clean all
