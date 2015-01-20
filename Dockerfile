FROM randomparity/docker-supervisor:latest

MAINTAINER David Christensen <randomparity@gmail.com>

ENV LAST_UPDATE_HTPC_MANAGER 2015-01-20

# We depend on the FROM container to have the relevant updates
# installed thus we don't take care of that here.

# RUN	apt-mark hold initscripts udev plymouth mountall
RUN apt-get -qy install libjpeg8-dev libpng-dev libfreetype6-dev \
    zlib1g-dev libopenjpeg-dev libwebp-dev python-pip \
    python-imaging python-psutil python-pil
RUN git clone https://github.com/styxit/HTPC-Manager.git /opt/htpc-manager && \
    chown -R $BASE_USER:$BASE_GROUP /opt/htpc-manager

# Clean-up any unneeded files
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

VOLUME ["/config"]

EXPOSE 8085

# Copy the supervisord configuration file into the container
COPY htpc-manager.conf /etc/supervisor/conf.d/htpc-manager.conf
RUN echo "user=$BASE_USER" >> /etc/supervisor/conf.d/htpc-manager.conf

# No need to setup a CMD directive since that was handled in the FROM image.
