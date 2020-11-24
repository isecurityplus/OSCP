# OSCP

该项目收集了渗透测试中涉及到的通用测试方法和技巧，完整覆盖渗透测试的全生命周期，目的是为了帮助渗透测试爱好者/初学者或 OSCP 备考人员查询相关知识和下载相关工具，更好的理解渗透测试的方法。

我根据自己的经验编制了这个列表，如果有错误的地方或改进建议，欢迎提交 Issue。


**资源**

请邮件jewel591@hotmail.com获取免费资料包。

*提醒：更多优质资源请访问[https://www.isecplus.net](https://www.isecplus.net)*

- [0x1 OSCP小技巧-1：alias命令让openvpn连接更便捷](https://github.com/isecurityplus/OSCP/blob/master/openvpn_to_lab.md)


**OSCP Lab Writeups靶机攻略（邮件获取）**

- 请邮件jewel591@hotmail.com获取免费资料包。


## Table of Contents

   * [OSCP 资料](#oscp-资料)
   * [Web 服务](#web-服务)
   * [系统服务](#系统服务)
   * [Linux 提权](#linux-提权)
   * [Windows 提权](#windows-提权)
   * [工具和资源](#工具和资源)



## OSCP 资料

#### OSCP 考试要求

- [考试常见问题 | 中文翻译](https://github.com/isecurityplus/OSCP/blob/master/OSCP/OSCP_exam_%20proctoring_faq.md)
- [监考工具学生手册 | 中文翻译](https://github.com/isecurityplus/OSCP/blob/master/OSCP/PROCTORING_TOOL_STUDENT_MANUAL.md)

#### OSCP Lab

- [OSCP lab 官方靶场攻略](https://item.taobao.com/item.htm?spm=a2oq0.12575281.0.0.50111debrzUqH3&ft=t&id=620589344966)
- [OSCP 考试报告模板修改版](https://github.com/isecurityplus/OSCP/blob/master/OSCP/OSCP-OS-XXXXX-Exam-Report_templates_By_Jewel591.docx)
- [Vulnhub 靶机](https://github.com/isecurityplus/OSCP/blob/master/VulnHub/README.md)
- [OSCP openvpn 小技巧](https://github.com/Jewel591/OSCP-Tips/blob/master/others/%E5%85%B3%E4%BA%8Eopenvpn.md)

#### OSCP Exam

- [OSCP 考试报告模板改进版](https://github.com/isecurityplus/OSCP/blob/simplify/OSCP/Exam/Exam-Report_template.md)


## Web 服务

#### 综合技巧

- [☆公开漏洞库查询](https://github.com/isecurityplus/OSCP/blob/master/Recon/Search_Exploits.md)
- [暴力破解方法汇总](https://github.com/isecurityplus/OSCP/blob/master/Password%20Attacks/README.md)

#### Web 通用漏洞

- [SQL 注入](https://github.com/sqlmapproject/sqlmap) > [SQLmap 使用教程](https://jewel591.fun/gong-ju/sqlmap) > [《通过在线实验理解SQL注入原理》](https://www.shiyanlou.com/courses/876)

#### CMS

- [Blunder](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/Blunder)
- [drupal](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/drupal)
- [OctoberCMS](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/OctoberCMS)
- [WordPress](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/WordPress)
- [squid cache](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/squid)
- [Webmin](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/Webmin)

#### Web 中间件

- [IIS](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/iis)
- [phpmyadmin](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/phpMyAdmin)
- tomcat
- [Weblogic](https://github.com/0xn0ne/weblogicScanner)

#### 后端语言

- [PHP](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/PHP-reverse-shell)
- [ASP](https://github.com/isecurityplus/OSCP/tree/master/web-exploit-exp/ASP-reverse-shell)

#### HTTP Method

- [PUT 请求方法](https://github.com/devploit/put2win)



## 系统服务

- [21 | FTP ](https://github.com/isecurityplus/OSCP/blob/master/system-exploit-exp/FTP/)
- [25 | SMTP ](https://github.com/isecurityplus/OSCP/tree/master/system-exploit-exp/smtp)
- [53 | DNS ](https://github.com/isecurityplus/OSCP/tree/master/system-exploit-exp/dns)
- [139/445 | SMB ](https://github.com/isecurityplus/OSCP/tree/master/system-exploit-exp/SMB/)
- [139/445 | Samba ](https://github.com/isecurityplus/OSCP/tree/master/system-exploit-exp/Samba/)
- nfs


#### 反弹shell

- [PayloadsAllTheThings | 反弹 shell 方法汇总](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/735b0d2277b39cda75af2855362fd5e8ae50b3db/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)

## Linux 提权

- [Ubuntu 内核版本与发行版本对应关系](https://github.com/isecurityplus/OSCP/blob/master/images/Ubuntu%20%E5%86%85%E6%A0%B8%E7%89%88%E6%9C%AC%E4%B8%8E%E5%8F%91%E8%A1%8C%E7%89%88%E6%9C%AC%E5%AF%B9%E5%BA%94%E5%85%B3%E7%B3%BB.png)
- [CentOS 内核版本与发行版本对应关系](https://github.com/isecurityplus/OSCP/blob/master/images/Centos%20%E5%86%85%E6%A0%B8%E7%89%88%E6%9C%AC%E4%B8%8E%E5%8F%91%E8%A1%8C%E7%89%88%E6%9C%AC%E5%AF%B9%E5%BA%94%E5%85%B3%E7%B3%BB.png)

#### Linux 提权方法

- [升级 tty-shell](https://github.com/isecurityplus/OSCP/tree/master/PostExploit/TTY-shell)
- [SUID 提权](https://github.com/isecurityplus/OSCP/tree/simplify/PostExploit/LinuxPE/SUID/Summary)
- CronJobs 提权
- passwd/shadow 提权

#### Linux 提权工具

- ☆[LinEnum](https://github.com/rebootuser/LinEnum)
- [Linux-exploit-suggester](https://github.com/mzet-/linux-exploit-suggester)
- [liunx-kernel-exploits](https://github.com/SecWiki/linux-kernel-exploits)
- [BeRoot For Linux](https://github.com/AlessandroZ/BeRoot/tree/master/Linux)


## Windows 提权

- [Windows 版本号信息](https://github.com/isecurityplus/OSCP/blob/master/images/Windows%20%E7%B3%BB%E7%BB%9F%E7%89%88%E6%9C%AC.png)
- [Windows CMD 常用命令](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/Windows_Commands.md)

#### Windows 提权方法

- [0x1 收集Windows系统信息](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/systeminfo.md)
- [0x2 不带引号的服务路径](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/PathwithoutQuotation.md)
- [0x3 不安全的服务权限](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/Accesschk.md)
- [0x4 查找主机上的明文密码](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/ClearTextpasswords.md)
- [0x5 Pass The Hash](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/passthehash.md)
- [0x6 Windows AlwaysInstallElevated 策略](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/AlwaysInstallElevated.md)
- [0x7 存在漏洞的驱动](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/Vulnerabledrivers.md)
- [0x8 内核漏洞提权](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/Kernel_Exploit.md)
- [0x9 向Windows主机上传文件](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/filetransfer.md)
- [0x10 Windows后渗透常用命令](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/UsefulCommands.md)


#### Windows 提权工具

- ☆[winPEAS](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases)
- [windows-exploit-suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester) > [教程](https://www.notion.so/Windows-60898e79f361472ea1939775d4536eb3)
- [windows-kernel-exploits](https://github.com/SecWiki/windows-kernel-exploits)
- [JuicyPotato.exe](https://github.com/isecurityplus/OSCP/tree/master/PostExploit/WindowsPE/JuicyPotato)
- [Accesschk.exe](https://github.com/isecurityplus/OSCP/blob/master/PostExploit/WindowsPE/Accesschk.md)
- [BeRoot For Windows](https://github.com/AlessandroZ/BeRoot/tree/master/Windows)


#### 隧道和代理

- [chisel](https://github.com/jpillora/chisel)

# 工具和资源

#### 安全工具下载

```
这部分工具在 OSCP 考试认证过程中用不到，在工作渗透测试项目中可能用到
```

 - [JDK 下载](https://mirrors.tuna.tsinghua.edu.cn/AdoptOpenJDK/8/jdk/x64/windows/)
 - [AWVS Cracked](https://github.com/starnightcyber/Miscellaneous/tree/awvs13)
 - [AppScan Cracked](https://github.com/starnightcyber/Miscellaneous)
 - [NESSUS Cracked](https://github.com/starnightcyber/Miscellaneous)
 - [BurpSuite Pro Cracked](https://github.com/starnightcyber/Miscellaneous)
 - [SSLtest](https://github.com/drwetter/testssl.sh)
 
#### Hash 在线解密

 - [md5decrypt](https://md5decrypt.net/)
 - [xmd5](https://www.xmd5.com/)
 - [somd5](https://www.somd5.com/)
 - [cmd5](https://www.cmd5.com/)


#### 提升效率

- [使用 Alias 提高效率](https://github.com/isecurityplus/OSCP/blob/master/others/alias.md)
- [Kali Linux 必装工具](https://www.zhihu.com/question/422535940/answer/1489097254)

#### Linux

- [explainshell | Linux 命令、参数解释](https://explainshell.com/explain?cmd=sudo+nmap+-sS+-sV+-p-+-T5+10.10.10.160#) 

####  TODO

- [ ] tomcat
- [ ] nfs

