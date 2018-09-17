FROM sonarqube

EXPOSE 9000

#RUN wget language plugins

VOLUME "$SONARQUBE_HOME/data"

WORKDIR /opt/sonarqube/