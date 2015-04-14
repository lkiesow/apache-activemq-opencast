############################################################
# Dockerfile for Apache ActiveMQ
# Configured for Opencast Matterhorn
# Based on CentOS 7
############################################################


# Set the base image to centos
FROM centos:7

# File Author / Maintainer
MAINTAINER Lars Kiesow <lkiesow@uos.de>


# Update the repository sources list
RUN yum -y update
RUN curl https://copr.fedoraproject.org/coprs/lkiesow/apache-activemq-dist/repo/epel-7/lkiesow-apache-activemq-dist-epel-7.repo -o /etc/yum.repos.d/lkiesow-apache-activemq-dist-epel-7.repo
RUN yum -y install activemq-dist
PUT start.sh /
RUN rm /etc/activemq/activemq.xml
RUN curl -O https://bitbucket.org/opencast-community/matterhorn/raw/8001fd1fc85cf940f5bfb738b5a1cbfd0c865694/docs/scripts/activemq/activemq.xml -o /etc/activemq/activemq.xml



##################### INSTALLATION END #####################

# Expose the default port
EXPORT 61616

CMD ["/start.sh"]
