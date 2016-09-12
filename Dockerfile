# Use Java 8 as the base image
FROM java:8

MAINTAINER Chad Petersen <Chad.Petersen@simio.io>

# Update packages and install maven
RUN apt-get update
RUN apt-get install -y maven
