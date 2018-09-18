主要命令是 docker inspect:

```bash
$ sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' 1f7d8f36523c
172.17.0.6
```

可以考虑在 ~/.bashrc 中写一个 bash 函数：

```bash
function docker_ip() {
    sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}
```

`source ~/.bashrc` 然后：

```bash
$ docker_ip 1f7d8f36523c
172.17.0.6
```