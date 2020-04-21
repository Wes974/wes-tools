# Use ubuntu 19.04 as base image
FROM ubuntu:20.04

# Update apt
RUN apt -y update
# Install what's needed
RUN apt -y install build-essential valgrind curl git-all

WORKDIR /home