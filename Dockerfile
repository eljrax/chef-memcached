# sshd
#
# VERSION               0.0.1

FROM     ubuntu 
# Based on Amos Folarin's sshd container
MAINTAINER Erik Ljungstrom "erik.ljungstrom@rackspace[-dot=]co.uk"

# make sure the package repository is up to date (main is already listed by default)
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
# verify repository content (useful if you are doing more than just a oneline sources.list)
RUN cat /etc/apt/sources.list
# update from the repos
RUN apt-get update
# install the ssh server (openssh in this case)
RUN apt-get install -y openssh-server
# setup the run folder for the service
RUN mkdir /var/run/sshd
# add a passowrd for root account
RUN echo 'root:t00r' |chpasswd
# expose port 22 which sshd listens on
EXPOSE 22
CMD    /usr/sbin/sshd -D

