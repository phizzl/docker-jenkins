FROM bitnami/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

USER root

RUN install_packages \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        gnupg && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    install_packages \
        docker-ce

RUN /install-plugins.sh \
        ssh \
        docker \
        authorize-project

USER 0
