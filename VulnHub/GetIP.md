
# 如何获取靶机 IP 地址

先将虚拟机网卡设置为「桥接」模式，这样可以确保靶机 IP 地址和本地局域网在一个网段比较好找。

# 0x1 Nmap

如果是 macOS，可以点击「设置」 > 网络中找到目前连接的 WIFI，点击「高级」：

![getIP-1.png](https://i.loli.net/2020/08/07/3pk6o47lwt8TS52.png)

可以看到目前网络使用的 C 段地址，如果 Vmware Fusion  虚拟机使用的 DHCP，那应该也是这个地址段。

如果是 Windows，可以点击右下角的网络，查看网络属性来确认 IP 地址。

然后使用 nmap 进行地址扫描：

```bash
nmap sn 192.168.31.10/24 
```

![](https://i.loli.net/2020/08/07/pfVXHAiOngS8P4c.png)

就能找到靶机的地址了，具体是结果中的哪一个，可以使用 `nmap -sV <IP>`对每个 IP 进行详细扫描来确定。

例如，我对 192.168.31.1 进行扫描，结果如下图所示，就可以确认是目标靶机了：

![getIP-3.png](https://i.loli.net/2020/08/07/D82blkFOGTIcLNW.png)


# 0x2 netdiscover

使用 netdiscover 命令来查找：

扫描网段：

```bash
netdiscover -r 192.168.1.1/24
```

扫描指定网卡：

```bash
sudo netdiscover -i eth0
```
