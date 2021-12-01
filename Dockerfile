FROM httpd:latest
LABEL maintainer="NapalmZ (https://github.com/napalmz)"
ENV LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome

RUN echo Starting. \
 && apt-get -q -y update \
 && apt-get -q -y install --no-install-recommends curl \
 && apt-get -q -y full-upgrade \
 && rm -rif /var/lib/apt/lists/* \
 && echo Finished.

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1
