FROM ghcr.io/containerpak/base:main AS builder
ARG DEBIAN_FRONTEND=noninteractive
ARG NODE_VERSION=v22.16.0
WORKDIR /tmp

RUN apt update && \
    apt install -y --no-install-recommends \
      wget \
      ca-certificates \
      xz-utils && \
      /usr/bin/cpak-clean-junk

RUN wget -O node.tar.xz \
      "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"

RUN tar -xJf node.tar.xz -C /usr/local --strip-components=1
