#!/bin/bash

echo -e "正在查找SUID文件：\n"
find / -perm -u=s -type f > .linux-pe-suid 2>/dev/null
cat .linux-pe-suid
echo -e "\n可用来SUID提权的文件:\n"
grep -E 'cp|vim|find|bash|more|less|nano|nmap|mount' .linux-pe-suid
rm .linux-pe-suid
