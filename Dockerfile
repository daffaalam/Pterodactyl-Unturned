FROM debian:stable-slim
ARG DEBIAN_FRONTEND=noninteractive
ENV USER container
ENV HOME /home/${USER}
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lib32stdc++6 \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && useradd -d ${HOME} -m ${USER}
ENV LANG en_US.utf8
USER ${USER}
WORKDIR ${HOME}
COPY ./.pteroignore /.pteroignore
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
