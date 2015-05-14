FROM adamkdean/baseimage
MAINTAINER Adam K Dean <adamkdean@googlemail.com>

# Install Node.js
RUN add-apt-repository ppa:chris-lea/node.js;\
    apt-get update;\
    apt-get install -y nodejs;\
    ln -sf /usr/bin/nodejs /usr/bin/node

# Select specific version of Node.js via n
RUN npm install -g n && \
    n 0.12

# Preinstall libvips
RUN curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | sudo bash

CMD ["bash"]
