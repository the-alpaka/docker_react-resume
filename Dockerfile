FROM alpine

ARG TAG
ENV REACT_RESUME_MODE=edit

RUN echo 'Install Build Dependencies' && \
    apk add --no-cache --upgrade \
    build-base git npm python3 && \
    echo 'Install run-time packages' && \
    apk add --no-cache --upgrade yarn && \
    echo 'Install React-Ultimate-Resume' && \
    mkdir -p /app && \
    cd /app && git clone -b v${TAG} https://github.com/welovedevs/react-ultimate-resume.git /app && \
    rm -r /app/src/data/json_stub.json && \
    echo 'Install Package Dependencies' && \
    yarn install --network-timeout 1000000000 && \
    echo 'Remove Build Dependencies' && \
    apk del --purge build-base git npm python3 && \
    mkdir -p /defaults
COPY defaults /defaults
CMD sh /defaults/config.sh

EXPOSE 3000
VOLUME /config