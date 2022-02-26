FROM alpine
ARG TAG
ENV MODE=readOnly
RUN echo 'Install Dependencies' && \
    apk add --no-cache --upgrade build-base \
    yarn \
    python3 \
    git && \
    echo 'Install React-Ultimate-Resume' && \
    mkdir -p /app && \
    cd /app && git clone -b v${TAG} https://github.com/welovedevs/react-ultimate-resume.git && \
    echo 'Cleanup' && \
    apk del --purge git && \
    mv /app/react-ultimate-resume/* /app && \
    rm -r /app/react-ultimate-resume
WORKDIR /app
RUN yarn cache clean && yarn install --network-timeout 1000000000
RUN apk del --purge build-base
EXPOSE 3000
CMD ["yarn", "start", "--mode=${MODE}"]
