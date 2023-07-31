# Jenkins

This project extends the official [Jenkins Docker image](https://github.com/jenkinsci/docker). Check the docs of the
official repo in order to run this image.

This project is used by QA to trigger E2E-Tests written in Codeception running in isolated Docker-in-Docker
environments.

PHP (in version 8.2) is required to run the Jenkins API-client (`jenkins-api-client.phar`) which is used for projects
consisting of multiple subprojects (multi-language, white-labeling, ...). Before the jobs of the subprojects are
triggered to run, existing runs are stopped by using the Jenkins API-client.

## Defining default admin

Different from the official base image this image has enabled local authorization by default.

You may set the env vars `JENKINS_USER` and `JENKINS_PASS` to override the default user `admin` with its password
`admin`.
