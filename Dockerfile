FROM adamkdean/libvips:latest
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Add Node package sources
RUN add-apt-repository -y ppa:git-core/ppa

# Install packages
RUN apt-get install -yq nodejs

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
