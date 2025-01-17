FROM ubuntu:20.04

# Install necessary dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libsdl2-dev \
    libsdl2-ttf-dev \
    check

# Setup XServer
ENV XDG_RUNTIME_DIR=/tmp/runtime-dir
RUN mkdir -p $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR
ENV DISPLAY host.docker.internal:0.0

# Set the working directory
WORKDIR /LLD_gbemu
