FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git curl make wget xz-utils ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
