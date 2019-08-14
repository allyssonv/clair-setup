## How to scan for vulnerabilities in application containers

#### [Clair](https://github.com/coreos/clair) is a project for this task.

#### Clair needs a postgres database to save the CVE's. Start up a instance with a database named ```clairdb```.

#### In next, start a Clair container:

> Change the postgres connection string in the ```config.yaml``` file.

```
docker run -d --name clair --network skynet \
        -p 6060:6060 \
        -p 6061:6061 \
        -v /home/jarvis/clair:/config \
        quay.io/coreos/clair:v2.0.9 -config /config/config.yaml
```

#### Start a ```Klar``` container. Notice the image passed as param, it contains vulnerabilities.

> [Klar](https://github.com/optiopay/klar) is a simple tool to analyze images stored in a private or public Docker registry for security vulnerabilities using Clair.

```
docker run --rm --name klar --network skynet \
        klar:2.4.0 vulnerables/phpldapadmin-remote-dump:latest

```

> Note: the containers were put in the same network




