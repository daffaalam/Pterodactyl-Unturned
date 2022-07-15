FROM debian:stable-slim
ARG DEBIAN_FRONTEND=noninteractive
ENV USER container
ENV HOME /home/${USER}
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lib32gcc-s1 \
    libc6-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -d ${HOME} -m ${USER}
USER ${USER}
WORKDIR ${HOME}
COPY ./.pteroignore /.pteroignore
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
