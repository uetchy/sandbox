FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update && apt-get install \
  build-essential \
  ca-certificates \
  curl \
  git \
  less \
  ssh-client \
  vim \
  zsh \
  -y --no-install-recommends

# Node.js
ENV NODE_VERSION 14.6.0
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" && \
  tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 --no-same-owner && \
  ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
  rm "node-v$NODE_VERSION-linux-x64.tar.xz"

# Yarn
ENV YARN_VERSION 1.22.4
RUN curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" && \
  mkdir -p /opt && \
  tar -xzf "yarn-v$YARN_VERSION.tar.gz" -C /opt/ && \
  ln -s "/opt/yarn-v$YARN_VERSION/bin/yarn" /usr/local/bin/yarn && \
  ln -s "/opt/yarn-v$YARN_VERSION/bin/yarnpkg" /usr/local/bin/yarnpkg && \
  rm "yarn-v$YARN_VERSION.tar.gz"

# Go
ENV GO_VERSION=1.14.6
RUN curl -fsSLO --compressed "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" && \
  tar -xzf "go${GO_VERSION}.linux-amd64.tar.gz" -C /usr/local && \
  rm "go${GO_VERSION}.linux-amd64.tar.gz"
ENV PATH /usr/local/go/bin:$PATH

# zsh
COPY assets/zshrc .zshrc
ENV PS1 "%~> "
ENTRYPOINT ["/usr/bin/zsh"]