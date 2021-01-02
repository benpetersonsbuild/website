FROM gitpod/workspace-full

# install node version manager
# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.20.0

# install nvm
# https://github.com/creationix/nvm#install-script
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

# add gatsby cli
RUN npm install -g gatsby-cli@latest