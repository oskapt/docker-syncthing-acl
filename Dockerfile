FROM ubuntu:16.10

RUN apt-get -qq update \
  && apt-get -qq -y install --no-install-recommends inotify-tools acl curl \
  && apt-get -qq autoremove -y \
  && apt-get -qq clean \
  && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# get dumb-init
ENV DI_VERSION 1.2.0
RUN cd /tmp && \
    curl -sL -o /bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DI_VERSION}/dumb-init_${DI_VERSION}_amd64 && \
    chmod +x /bin/dumb-init

# get syncthing
WORKDIR /srv/data

ADD https://raw.githubusercontent.com/idistech/syncthing-acl/master/syncthing-acl.sh /usr/bin/

ADD ./start.sh /start.sh
RUN chmod 770 /start.sh

ENTRYPOINT ["dumb-init", "--"]
CMD ["/start.sh"]

