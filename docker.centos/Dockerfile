# sshd in CentOS 6, for use with Vagrant 
#
# VERSION               0.0.1

FROM centos:centos6

MAINTAINER Erik Ljungstrom "erik.ljungstrom[-at-]rackspace[=dot=]co.uk


RUN yum -y install sudo openssh-server openssh-clients which
RUN echo "Defaults !requiretty" > /etc/sudoers.d/98237t98hjsnk

# Generate SSH keys (ssh-keygen -A was only introduced in CentOS 7)
RUN ssh-keygen -q -t rsa1 -f /etc/ssh/ssh_host_key
RUN ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_dsa_key

RUN echo 'root:t00r' |chpasswd


EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D
#ENTRYPOINT /bin/bash
