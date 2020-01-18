sudo docker service create --name jenkins \
    -p 8082:8080 \
    -p 50000:50000 \
    -e JENKINS_OPTS="--prefix=/jenkins" \
    --mount "type=bind,source=/home/centos/docker/jenkins,target=/var/jenkins_home" \
    --reserve-memory 1000m \
    rajeshm91/jenkins:latest
