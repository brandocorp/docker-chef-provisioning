FROM debian:latest
MAINTAINER Brandon Raabe <brandocorp@gmail.com>

# Copy our cookbooks
ADD  cookbooks.tar.gz /var/chef
COPY install.json /etc/chef/install.json

RUN apt-get -q -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -q -y install curl && \
    curl -sSL https://www.chef.io/chef/install.sh | /bin/bash && \
    chef-solo -j /etc/chef/install.json && \
    dpkg -P chef && \
    DEBIAN_FRONTEND=noninteractive apt-get -q -y purge --auto-remove curl && \
    apt-get clean && \
    rm -rf /opt/chef && \
    rm -rf /etc/chef && \
    rm -rf /var/chef && \
    rm -rf /var/lib/apt/lists && \
    rm -rf /usr/share/man && \
    rm -rf /usr/share/doc

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
