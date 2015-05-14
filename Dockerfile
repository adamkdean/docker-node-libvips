FROM adamkdean/libvips:latest
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Add Git and Node package sources
RUN add-apt-repository -y ppa:git-core/ppa && \
    curl -sL https://deb.nodesource.com/setup | sudo bash -

# Install packages
RUN apt-get install -yq \
    git \
    nodejs

# Select specific version of Node.js via n
RUN npm install -g n && \
    n 0.12

# Clean up
WORKDIR /
RUN apt-get remove -y curl automake build-essential && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
