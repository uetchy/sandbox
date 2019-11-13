FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends curl build-essential git ca-certificates ssh-client less zsh vim

# Node.js
ENV NODE_VERSION 12.12.0
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" && \
  tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 --no-same-owner && \
  ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
  rm "node-v$NODE_VERSION-linux-x64.tar.xz"

# Yarn
ENV YARN_VERSION 1.19.1
RUN curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" && \
  mkdir -p /opt && \
  tar -xzf "yarn-v$YARN_VERSION.tar.gz" -C /opt/ && \
  ln -s "/opt/yarn-v$YARN_VERSION/bin/yarn" /usr/local/bin/yarn && \
  ln -s "/opt/yarn-v$YARN_VERSION/bin/yarnpkg" /usr/local/bin/yarnpkg && \
  rm "yarn-v$YARN_VERSION.tar.gz"

# zsh
COPY assets/zshrc .zshrc
ENV PS1 "%1~> "
ENTRYPOINT ["/usr/bin/zsh"]