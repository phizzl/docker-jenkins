FROM jenkins/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ADD playbook.yml /tmp/playbook.yml

USER root

RUN apt-get update && \
    apt-get install -y python3-pip apt-utils && \
    apt-get clean all && \
    apt-get autoremove -y && \
    pip3 install ansible

RUN ansible-playbook -vv /tmp/playbook.yml

COPY ./plugins.txt /tmp/plugins.txt
RUN install-plugins.sh < /tmp/plugins.txt

USER 1000
