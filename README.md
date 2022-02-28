# Docker React Resume

This repo is still under development and more extensive testing is needed. I am working on getting everything to function correctly but I only have so much time I can contribute to this side project of mine. I'm still very new to this so please stick with me. If you find any issues with the container let me know and I'll get it fixed as soon as I can.

## Usage

There are two ways you can run this container, either with Docker CLI or Docker-Compose. Setting up this container is super simple you just need to be sure to allow container port 3000 through to the host, for example `-p 3000:3000` with the mappings respectively `<host_port>:<container_port>`. Use any of the preconfigured options below to get the container up and running quickly. After starting the container go to your favorite web browser and type in `http://<HOST_IP>:3000` to access the Web UI.

### Docker CLI
Simply run the following command to set up the React Resume container.

```bash
docker run -d \
--name=react-resume \
-p 3000:3000 \
-e REACT_RESUME_MODE=edit
-v /path/to/react-resume/config:/config
--restart unless-stopped \
thealpaka/react-resume
```

### Docker-Compose

Create a file named `docker-compose.yml`, then run `docker-compose pull && docker-compose up -d`.

```yaml
version: '3'
services:
  web:
    image: thealpaka/react-resume
    container_name: react-resume
    ports:
      - 3000:3000
    environment:
      - REACT_RESUME_MODE=edit
    volumes:
      - ./config:/config
    restart: unless-stopped
```


## Credits
All credits to react-ultimate-resume goes to the devs at [https://github.com/welovedevs/react-ultimate-resume](https://github.com/welovedevs/react-ultimate-resume).
