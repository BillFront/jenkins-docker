FROM jenkins
USER root

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-engine
RUN update-rc.d docker disable
ADD change-group-and-start-jenkins.sh /bin/

ENTRYPOINT "/bin/change-group-and-start-jenkins.sh"
