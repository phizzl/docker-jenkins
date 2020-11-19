FROM jenkins/jenkins:latest
MAINTAINER Phizzl <the@phizzl.it>

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

USER root

# Preinstalling Jenkins plugins
COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Setup password security for Jenkins
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/default-user.groovy

# Install Ansible
RUN apt-get update && \
    apt-get install -y python3-pip apt-utils && \
    apt-get clean all && \
    apt-get autoremove -y && \
    pip3 install ansible

# Run Ansible playbook for installing PHP
COPY ansible/ /tmp/ansible/
RUN ansible-playbook -vv $(ls -d /tmp/ansible/*.yml)

USER 1000
