## openssh-server

```sh
$ docker build --rm --no-cache -t openssh -f Dockerfile .
$ docker run -d -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /home/:/home/ openssh
$ docker inspect -f {{.NetworkSettings.IPAddress}} $(docker ps | grep openssh | awk '{print $1}')
```
