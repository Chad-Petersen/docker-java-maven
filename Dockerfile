# Use Java 8 as the base image
FROM java:8

MAINTAINER Chad Petersen <Chad.Petersen@simio.io>

ARG POMPATH = pom.xml
ARG HOMEDIR = /usr/app

# Update packages and install maven
RUN apt-get update
RUN apt-get install -y maven

# Create working directory
WORKDIR $HOMEDIR

# Prepare by downloading dependancies
ADD $POMPATH $HOMEDIR/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into war
ADD src $HOMEDIR/src
RUN ["mvn", "package"]

VOLUME ["$HOMEDIR/target"]
