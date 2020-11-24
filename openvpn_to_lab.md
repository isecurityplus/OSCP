# 0x1 OSCP小技巧-1：alias命令让openvpn连接更便捷

你是否感到每一次连接实验室 lab VPN 都需要输入账户、密码会很麻烦？

给大家们分享一种快速连接 openvpn 的方法：

1. 新建一个文件  `pwk-authen.txt` ,文件内容第一行放用户名，第二行放密码：

   ```
   openvnp用户名
   openvpn密码
   ```

2. 编辑`OS-72536-PWK.ovpn` ,在`auth-user-pass`后面添加 `pwk-authen.txt`.

3. 将以上两个文件放在~/oscpvpn/目录下，再新建一个别名：

```
 alias oscpvpn="sudo openvpn ~/oscpvpn/OS-72536-PWK.ovpn"
```

这样每次要连接 VPN 只需要输入 oscpvpn 便可快速连接不用再输密码，可以节约大量时间。


更多优质资源欢迎访问[www.isecplus.net](www.isecplus.net)

