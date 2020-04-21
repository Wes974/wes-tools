# Use ubuntu 19.04 as base image
FROM ubuntu:20.04

# Update apt
RUN apt-get -y update
# Install what's needed
RUN apt-get -y install build-essential gdb valgrind curl git-all

WORKDIR /home