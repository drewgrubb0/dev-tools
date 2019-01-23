FROM jenkins/jenkins
LABEL maintainer="drewgrubb"

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

USER root
RUN apt-get -qq update \
   && apt-get -qq -y install \
   curl
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins

RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#USER jenkins