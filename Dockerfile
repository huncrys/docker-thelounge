FROM node:lts-alpine

ENV NODE_ENV production
ENV THELOUNGE_HOME "/config"
ENV PORT 9000

VOLUME /config

ARG REPO=https://git.doszgep.hu/crys/thelounge.git
ARG BRANCH=master

RUN apk --update --no-cache add python2 build-base git && \
    git clone --single-branch --branch "${BRANCH}" "${REPO}" /tmp/thelounge && \
    cd /tmp/thelounge && \
    yarn --non-interactive --production=false install && \
    yarn --non-interactive build && \
    yarn --non-interactive pack --filename /tmp/thelounge/thelounge.tgz && \
    yarn --non-interactive --frozen-lockfile global add file:/tmp/thelounge/thelounge.tgz && \
    yarn --non-interactive cache clean && \
    cd / && \
    rm -rf /tmp/thelounge && \
    yarn --non-interactive cache clean && \
    apk del python2 build-base git

CMD ["thelounge", "start"]
