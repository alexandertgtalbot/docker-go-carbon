ARG VCS_REF
ARG BUILD_DATE
ARG BUILD_OS_VERSION=latest
ARG BUILD_TYPE
ARG BUILD_VERSION
ARG GOCARBON_VERSION
ARG CONFD_VERSION

FROM centos:${BUILD_OS_VERSION} as builder

# ---------------------------------------------------------------------------------------
# hadolint ignore=DL3003,DL3013,DL3017,DL3018,DL3019
RUN \
  yum update -y && \
  yum install -y make git && \
  yum clean all && \
  echo "export BUILD_DATE=${BUILD_DATE}"  > /etc/profile.d/go-carbon.sh && \
  echo "export BUILD_TYPE=${BUILD_TYPE}" >> /etc/profile.d/go-carbon.sh && \
  echo "export VERSION=${VERSION}"       >> /etc/profile.d/go-carbon.sh

ENV \
  GOPATH=/opt/go \
  BASH_ENV=/opt/rh/go-toolset-7/enable \
  ENV=/opt/rh/go-toolset-7/enable \
  PROMPT_COMMAND=". /opt/rh/go-toolset-7/enable"

RUN mkdir -p "${GOPATH}" && chmod -R 777 "${GOPATH}" && \
    yum install -y centos-release-scl && \
    yum -y install git go-toolset-7-golang gem ruby-devel && \
    yum clean all 

WORKDIR ${GOPATH}

RUN \
  export PATH="${PATH}:${GOPATH}/bin" && \
  mkdir -p \
    /var/log/go-carbon && \
  git clone https://github.com/lomik/go-carbon.git

WORKDIR ${GOPATH}/go-carbon
# hadolint ignore=DL4006,SC1090
RUN \
  source "${ENV}" && \
  if [ "${BUILD_TYPE}" == "stable" ] ; then \
    echo "switch to stable Tag v${GOCARBON_VERSION}" && \
    git checkout "tags/v${GOCARBON_VERSION}" 2> /dev/null ; \
  fi && \
  version=$(git describe --tags --always | sed 's/^v//') && \
  echo "build version: ${version}" && \
  make

RUN \
  mkdir -p /go-carbon/etc && \
  mv  go-carbon                       /go-carbon/go-carbon && \
  mv  deploy/go-carbon.conf           /go-carbon/etc/go-carbon.conf && \
  mv  deploy/storage-schemas.conf     /go-carbon/etc/go-carbon_storage-schemas.conf && \
  mv  deploy/storage-aggregation.conf /go-carbon/etc/go-carbon_storage-aggregation.conf


# ---------------------------------------------------------------------------------------
FROM centos:${BUILD_OS_VERSION}

EXPOSE 2003 2003/udp 2004 7002 7003 7007 8080

COPY --from=builder /etc/profile.d/go-carbon.sh  /etc/profile.d/go-carbon.sh
COPY --from=builder /go-carbon/etc               /etc/go-carbon/
COPY --from=builder /go-carbon/go-carbon         /usr/bin/go-carbon

# confd - reference: https://cloudonaut.io/dockerizing-legacy-applications-with-confd/
RUN curl -s -L "https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64" -o /usr/local/bin/confd && chmod +x /usr/local/bin/confd
#COPY docker/custom-entrypoint /usr/local/bin/
#RUN chmod u+x /usr/local/bin/custom-entrypoint
#ENTRYPOINT ["custom-entrypoint"]

COPY rootfs/ /

# hadolint ignore=DL3018
RUN \
  yum update -y && \
  yum clean all && \
  /usr/sbin/useradd \
    --system \
    -U \
    -s /bin/false \
    -c "User for Graphite daemon" \
    carbon && \
  mkdir \
    /var/log/go-carbon && \
  chown -R carbon:carbon \
    /data \
    /var/log/go-carbon \
    /etc/go-carbon 

WORKDIR /

VOLUME /data

# USER carbon
CMD ["/init/run.sh"]

HEALTHCHECK \
  --interval=5s \
  --timeout=2s \
  --retries=12 \
  CMD ps ax | grep -v grep | grep -c go-carbon || exit 1

# ---------------------------------------------------------------------------------------

LABEL \
  version="${BUILD_TYPE}" \
  maintainer="Alex Talbot <alexandertgtalbot@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.name="CentOS-based Go Carbon Docker Image" \
  org.label-schema.description="Unofficial Go Carbon Docker Image" \
  org.label-schema.url="https://github.com/lomik/go-carbon" \
  org.label-schema.vcs-url="https://github.com/alexandertgtalbot/docker-go-carbon" \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vendor="Alex Talbot" \
  org.label-schema.version=${BUILD_DOCKER_TAG} \
  org.label-schema.schema-version="1.0" \
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="The Unlicense"

# ---------------------------------------------------------------------------------------
