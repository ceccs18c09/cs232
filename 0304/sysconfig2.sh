echo -e "\nOS--version ,release number:\n"
cat /etc/os-release
echo -e "\nOS--Kernel version:\n"
uname -r
echo -e "\n All available shell:\n"
cat /etc/shells
echo -e "\n CPU information:\n"
cat /proc/cpuinfo
echo -e "\n  Memory information:\n"
free -m
echo -e "\n  Hard disc information:\n"
df -h
echo -e "\nFile system (Mounted):\n"
mount | column -t
