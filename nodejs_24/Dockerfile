FROM node:24-slim

LABEL author="pterogg" \
      maintainer="augustin.pro.prs@gmail.com" \
      org.opencontainers.image.source="https://github.com/pterogg/pterogg" \
      org.opencontainers.image.description="Pterodactyl Node.js 24 image" \
      org.opencontainers.image.version="24"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        dnsutils \
        ffmpeg \
        git \
        iproute2 \
        iputils-ping \
        libnss3 \
        libsqlite3-dev \
        libtool \
        python3 \
        python3-dev \
        sqlite3 \
        tar \
        tini \
        tzdata \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint
ENTRYPOINT ["/bin/bash", "/entrypoint"]
