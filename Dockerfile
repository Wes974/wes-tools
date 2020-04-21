# Use ubuntu 19.04 as base image
FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update apt
RUN apt-get -y update
# Install what's needed
RUN apt-get -y install build-essential gdb valgrind curl git-all

WORKDIR /home
