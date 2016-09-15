#!/bin/sh

groupdel docker
groupmod -g `ls -n /var/run/docker.sock | cut -f 4 -d " "` docker
usermod -aG docker jenkins
su -c "/bin/tini -- /usr/local/bin/jenkins.sh"
