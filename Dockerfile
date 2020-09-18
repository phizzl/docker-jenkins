FROM bitnami/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

USER root

RUN /install-plugins.sh docker

USER 1001
