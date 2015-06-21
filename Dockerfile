# Force autobuild 1434927059

FROM konstruktoid/debian:wheezy

COPY files/sshd_config /etc/ssh/sshd_config

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install openssh-server --no-install-recommends && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo && \
    mkdir /var/run/sshd

ADD https://raw.githubusercontent.com/konstruktoid/Docker/master/Security/cleanBits.sh /tmp/cleanBits.sh

RUN /bin/bash /tmp/cleanBits.sh && \
    rm /tmp/cleanBits.sh

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
