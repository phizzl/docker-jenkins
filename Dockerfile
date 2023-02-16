FROM jenkins/jenkins:lts-jdk11
MAINTAINER Phillip Schleicher <phillip.schleicher@cec.valantic.com>

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

USER root

# Preinstalling Jenkins plugins
COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Setup password security for Jenkins
COPY groovy/ /usr/share/jenkins/ref/init.groovy.d/

# Install Ansible
RUN apt-get update && \
    apt-get install -y python3-pip apt-utils sshpass nodejs zip unzip rsync wget && \
    apt-get -yq full-upgrade && \
    apt-get clean all && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --no-cache-dir ansible

# Run Ansible playbook for installing PHP
COPY ansible/ /tmp/ansible/
RUN ansible-playbook -vv $(ls -d /tmp/ansible/*.yml) && \
    apt-get clean all && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

USER 1000
