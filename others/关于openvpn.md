# 0x1 openvpn快速连接

你是否感到每一次连接实验室 lab VPN 都需要输入账户、密码会很麻烦？

给大家们分享一种快速连接 openvpn 的方法：

1. 新建一个文件  `pwk-authen.txt` ,文件内容第一行放用户名，第二行放密码：

    ```
    openvnp用户名
    openvpn密码
    ```

2. 编辑`OS-XXXXX-PWK.ovpn` ,在`auth-user-pass`后面添加 `pwk-authen.txt`.

3. 将以上两个文件放在~/oscpvpn/目录下，再新建一个别名：

```
 alias oscpvpn="sudo openvpn ~/oscpvpn/OS-xxxxxx-PWK.ovpn"
```

这样每次要连接 VPN 只需要输入 oscpvpn 便可快速连接不用再输密码，可以节约大量时间。

# 0x2  官方lab VPN 无法连接/链接不稳定

OSCP 官方对考试网络的要求：

1. 延迟≤300

2. 丢包率接近 0

但是国内众所周知的原因，造成官方提供的 openvpn 无法连接，或丢包率/延迟极高，无法正常完成学习和考试。

**我们提供稳定的中转代理，解决 OSCP 官方提供的 openvpn 无法连接/延迟高/丢包率高的问题。**
访问如下链接获取：

```
https://www.isecplus.net/
```

效果图：
![image.png](https://i.loli.net/2020/06/21/oe57HJ8kiQyr19T.png)
