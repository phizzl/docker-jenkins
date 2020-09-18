FROM bitnami/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

USER root

RUN /install-plugins.sh docker
RUN /install-plugins.sh ssh

USER 1001
