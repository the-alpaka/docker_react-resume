FROM alpine
ARG TAG
RUN echo 'Install Dependencies' && \
    apk add --no-cache --upgrade \
    yarn \
    git && \
    echo 'Install React-Ultimate-Resume' && \
    mkdir -p /app && \
    cd /app && git clone -b v${TAG} https://github.com/welovedevs/react-ultimate-resume.git && \
    echo 'Cleanup Dependencies' && \
    apk del --purge git && \
    mv /app/react-ultimate-resume/* /app && \
    rm -r /app/react-ultimate-resume && \
    yarn config delete proxy
WORKDIR /app
RUN yarn install
EXPOSE 3000
CMD ["yarn", "start"]
