# Jenkins

This Jenkins image is prebuild to run local PHP projects.  
The project extends the official [Jenkins Docker image](https://github.com/jenkinsci/docker).  

This project installs PHP 7.3 and PHP 7.4 in their cli versions with a bunch of common extensions.

Check the docs of the official repo in order to run this image.  

## Defining default admin
Different than the official base image this image has enabled local authorization by default.  

You may set the env vars `JENKINS_USER` and `JENKINS_PASS` to override the default user `admin` with its password `admin`.
