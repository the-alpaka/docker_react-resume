#!/bin/sh
# Starts up and prepares the environment

export REACT_APP_MODE=${REACT_RESUME_MODE}

mkdir -p /config

if [[ -s '/config/resume.json' ]]; then
   echo "resume.json is not empty"
else
   echo "resume.json doesn't exist or is empty"
   cp /defaults/resume.json /config/resume.json
fi

ln -s /config/resume.json /app/src/data/json_stub.json
cd /app && yarn start