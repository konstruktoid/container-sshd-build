## openssh-server

```sh
$ docker build --rm -t openssh -f Dockerfile .
$ docker run -d -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /home/:/home/ openssh
```
