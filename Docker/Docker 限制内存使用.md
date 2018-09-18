
参考：https://www.centos.bz/2017/08/docker-limit-container-cpu-memory-io/
配置docker限制容器对cpu 内存和IO的资源使用

## docker 限制容器内存使用量
而如果申请 100M 内存，会发现容器里的进程被 kill 掉了（worker 7 got signal 9，signal 9 就是 kill 信号）
在 docker 启动参数中，和内存限制有关的包括（参数的值一般是内存大小，也就是一个正数，后面跟着内存单位 b、k、m、g，分别对应 bytes、KB、MB、和 GB）：

`-m –memory`：容器能使用的最大内存大小，最小值为 4m
`–memory-swap`：容器能够使用的 swap 大小
`–memory-swappiness`：默认情况下，主机可以把容器使用的匿名页（anonymous page）swap 出来，你可以设置一个 0-100 之间的值，代表允许 swap 出来的比例
`–memory-reservation`：设置一个内存使用的 soft limit，如果 docker 发现主机内存不足，会执行 OOM 操作。这个值必须小于 –memory 设置的值
`–kernel-memory`：容器能够使用的 kernel memory 大小，最小值为 4m。
`–oom-kill-disable`：是否运行 OOM 的时候杀死容器。只有设置了 -m，才可以把这个选项设置为 false，否则容器会耗尽主机内存，而且导致主机应用被杀死


关于 `–memory-swap` 的设置必须解释一下，`–memory-swap` 必须在 `–memory` 也配置的情况下才能有用。

如果 `–memory-swap` 的值大于 `–memory`，那么容器能使用的总内存（内存 + `swap`）为 `–memory-swap` 的值，能使用的 swap 值为 `–memory-swap` 减去 `–memory` 的值
如果 `–memory-swap` 为 `0`，或者和 `–memory` 的值相同，那么容器能使用两倍于内存的 `swap` 大小，如果 `–memory` 对应的值是 200M，那么容器可以使用 400M swap
如果 `–memory-swap` 的值为 `-1`，那么不限制 `swap` 的使用，也就是说主机有多少 `swap`，容器都可以使用
如果限制容器的内存使用为 `64M`，在申请 `64M` 资源的情况下，容器运行正常（如果主机上内存非常紧张，并不一定能保证这一点）：

```bash
➜  docker run --rm -it -m 64m stress --vm 1 --vm-bytes 64M --vm-hang 0
WARNING: Your kernel does not support swap limit capabilities or the cgroup is not mounted. Memory limited without swap.
stress: info: [1] dispatching hogs: 0 cpu, 0 io, 1 vm, 0 hdd
stress: dbug: [1] using backoff sleep of 3000us
stress: dbug: [1] --> hogvm worker 1 [7] forked
stress: dbug: [7] allocating 67108864 bytes ...
stress: dbug: [7] touching bytes in strides of 4096 bytes ...
stress: dbug: [7] sleeping forever with allocated memory
.....
```

而如果申请 100M 内存，会发现容器里的进程被 kill 掉了（worker 7 got signal 9，signal 9 就是 kill 信号）

```bash
➜  docker run --rm -it -m 64m stress --vm 1 --vm-bytes 100M --vm-hang 0
WARNING: Your kernel does not support swap limit capabilities or the cgroup is not mounted. Memory limited without swap.
stress: info: [1] dispatching hogs: 0 cpu, 0 io, 1 vm, 0 hdd
stress: dbug: [1] using backoff sleep of 3000us
stress: dbug: [1] --> hogvm worker 1 [7] forked
stress: dbug: [7] allocating 104857600 bytes ...
stress: dbug: [7] touching bytes in strides of 4096 bytes ...
stress: FAIL: [1] (415) <-- worker 7 got signal 9
stress: WARN: [1] (417) now reaping child worker processes
stress: FAIL: [1] (421) kill error: No such process
stress: FAIL: [1] (451) failed run completed in 0s
```

关于 swap 和 kernel memory 的限制就不在这里过多解释了，感兴趣的可以查看官方的文档。