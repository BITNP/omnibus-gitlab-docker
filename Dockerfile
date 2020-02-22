FROM gitlab/gitlab-ce:latest
ARG OPENSSH_VERSION=openssh-8.2p1
# The actual build version can be changed via CI env

# Compile OpenSSH ourselves
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends build-essential zlib1g-dev libssl-dev libpam0g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/openssh/ && cd /tmp/openssh/ \
    && wget -c https://mirrors.tuna.tsinghua.edu.cn/OpenBSD/OpenSSH/portable/$OPENSSH_VERSION.tar.gz \
    && tar -xzf $OPENSSH_VERSION.tar.gz \
    && cd $OPENSSH_VERSION/ \
    && ./configure --with-pam \
    && make && make install \
    && rm -rf /tmp/openssh/ \
    && sed 's|/usr/sbin/sshd|/usr/local/sbin/sshd|g' -i /opt/gitlab/sv/sshd/run
