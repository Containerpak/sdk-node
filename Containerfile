FROM ghcr.io/containerpak/base:main
ARG DEBIAN_FRONTEND=noninteractive
ARG NODE_VERSION=v22.16.0

RUN apt update && \
    apt install -y --no-install-recommends \
      wget \
      ca-certificates && \
    wget -O node.tar.xz "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz" && \
    tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
    rm node.tar.xz && \
    /usr/bin/cpak-clean-junk
