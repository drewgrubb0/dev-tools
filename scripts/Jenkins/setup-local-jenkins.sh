#!/usr/bin/env bash

IMAGE_NAME="myjenkins"
CONTAINER_NAME="jenkins-master"
LOG_VOLUME="jenkins-log"
DATA_VOLUME="jenkins-data"

docker volume create ${LOG_VOLUME}
docker volume create ${DATA_VOLUME}

docker build \
        -t myjenkins \
        .

docker run \
        -p 8080:8080 \
        -p 50000:50000 \
        --name=jenkins-master \
        --mount source=jenkins-log,target=/var/log/jenkins \
        --mount source=jenkins-data,target=/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -d myjenkins

while [ -z "${INIT_ADMIN_PASS}" ]
do
    echo "Waiting for password file..."
    sleep 3
    INIT_ADMIN_PASS="$(docker exec ${CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword)"
done

echo ${INIT_ADMIN_PASS}