FROM alpine:3.11

ENV CONFTEST_VERSION 0.18.2

RUN apk update \
    && apk --no-cache add wget tar

RUN wget -P /usr/bin https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && tar xzf /usr/bin/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz -C /usr/bin \
    && rm /usr/bin/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && ls -lha /usr/bin/conftest \
    && /usr/bin/conftest --help

RUN apk del --purge wget tar

CMD ["/usr/bin/conftest"]