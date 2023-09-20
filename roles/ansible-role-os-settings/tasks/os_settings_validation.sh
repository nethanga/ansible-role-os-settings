#!/bin/bash

# Set hostname variable

hostname=`hostnamectl status | awk 'FNR == 1 {print $3}'`
date=`date +%d%m%Y`
user=`whoami`

echo $hostname
echo $date
echo $user

# Create Temporary directory for results

dir="${hostname}_${date}"

echo $dir
mkdir -p -- "/tmp/$dir"

# Check hostname status
echo "**** Checking hostnamectl status ****"
server_info="/tmp/${dir}/01_server info.txt"

echo "[${user}@${hostname}]# hostnamectl status" >> "${server_info}"
printf '\n' >> "${server_info}"
hostnamectl status >> "${server_info}"

if (($? > 0)); then
echo "*** Unable to get hostname status ****"

fi

# Check for 02-01_basic settings1
echo "******* cmd for 02-01_basic settings1 *******"
basic_settings1="/tmp/${dir}/02-01_basic settings1.txt"

echo "[${user}@${hostname}]# getenforce" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
getenforce >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# cat /etc/motd" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
cat /etc/motd >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# systemctl status firewalld.service" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
systemctl status firewalld.service >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# ls -la  /etc/systemd/system/default.target" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
ls -la  /etc/systemd/system/default.target >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# localectl status" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
localectl status >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# timedatectl status" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
timedatectl status >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# cat /etc/sysctl.conf" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
cat /etc/sysctl.conf >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# cat /etc/chrony.conf" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
cat /etc/chrony.conf >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

echo "[${user}@${hostname}]# yum repolist all" >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"
yum repolist all >> "${basic_settings1}"
printf '\n' >> "${basic_settings1}"

if (($? > 0)); then
echo "*** Unable to get some basic_settings1 ****"

fi

# Check for 02-02_basic settings2
echo "******* cmd for 02-02_basic settings2 *******"
basic_settings2="/tmp/${dir}/02-02_basic settings2.txt"

echo "[${user}@${hostname}]# cat /etc/default/grub | grep GRUB_CMDLINE_LINUX" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/default/grub | grep GRUB_CMDLINE_LINUX >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

echo "[${user}@${hostname}]# cat /etc/kdump.conf" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/kdump.conf >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

echo "[${user}@${hostname}]# cat /etc/ssh/sshd_config | grep PermitRootLogin" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/ssh/sshd_config | grep PermitRootLogin >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

echo "[${user}@${hostname}]# cat /etc/ssh/sshd_config | grep PasswordAuthentication" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/ssh/sshd_config | grep PasswordAuthentication >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

echo "[${user}@${hostname}]# cat /etc/ssh/sshd_config | grep SyslogFacility" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/ssh/sshd_config | grep SyslogFacility >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

echo "[${user}@${hostname}]# cat /etc/sudoers" >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"
cat /etc/sudoers >> "${basic_settings2}"
printf '\n' >> "${basic_settings2}"

if (($? > 0)); then
echo "*** Unable to get some basic_settings2 ****"

fi

# Check 03-01_installed packages info(common)
echo "******* cmd for 03-01_installed packages info(common) *******"
pkg_common="/tmp/${dir}/03-01_installed packages info(common).txt"

echo "[${user}@${hostname}]# yum list installed" >> "${pkg_common}"
printf '\n' >> "${pkg_common}"
yum list installed >> "${pkg_common}"
printf '\n' >> "${pkg_common}"

if (($? > 0)); then
echo "*** Unable to get Installed Package details ****"

fi

# Check 03-01_installed packages info(option)
echo "******* cmd for 03-01_installed packages info(option) *******"
pkg_option="/tmp/${dir}/03-01_installed packages info(option).txt"

echo "[${user}@${hostname}]# yum list installed | grep Package_Name" >> "${pkg_option}"
printf '\n' >> "${pkg_option}"
for srvs in bc.x86_64 bind-utils.x86_64	cronie.x86_64 expect.x86_64	fence-agents-kdump.x86_64 ftp.x86_64 kexec-tools.x86_64	lsof.x86_64  man-pages ncompress.x86_64 net-snmp.x86_64 net-snmp-libs.x86_64	net-tools.x86_64 nmap-ncat.x86_64 portreserve.x86_64 sos.noarch	strace.x86_64 sysstat.x86_64 tcpdump.x86_64 tk.x86_64 traceroute.x86_64	wget.x86_64	vsftpd.x86_64 xfsdump.x86_64 zip.x86_64	amazon-cloudwatch-agent.x86_64 amazon-ssm-agent.x86_64 aws-cli lvm2.x86_64 mailx.x86_64 postfix.x86_64;
do
yum list installed | grep $srvs >> "${pkg_option}"
done
printf '\n' >> "${pkg_option}"

if (($? > 0)); then
echo "*** Unable to get few Package details ****"

fi

# Check Service Lists
echo "******* cmd for 04_service list *******"
srvs_list="/tmp/${dir}/04_service list.txt"

echo "[${user}@${hostname}]# systemctl list-units --type=service" >> "${srvs_list}"
printf '\n' >> "${srvs_list}"
systemctl list-units --type=service >> "${srvs_list}"
printf '\n' >> "${srvs_list}"

if (($? > 0)); then
echo "*** Unable to get Service lists ****"

fi

# Check disk space
echo "**** Checking disk details ****"
disk_details="/tmp/${dir}/05_disk settings.txt"

echo "[${user}@${hostname}]# df -hT" >> "${disk_details}"
printf '\n' >> "${disk_details}"
df -hT >> "${disk_details}"
printf '\n' >> "${disk_details}"

echo "[${user}@${hostname}]# cat /etc/fstab" >> "${disk_details}"
printf '\n' >> "${disk_details}"
cat /etc/fstab >> "${disk_details}"
printf '\n' >> "${disk_details}"

echo "[${user}@${hostname}]# cat /proc/swaps" >> "${disk_details}"
printf '\n' >> "${disk_details}"
cat /proc/swaps >> "${disk_details}"
printf '\n' >> "${disk_details}"

echo "[${user}@${hostname}]# free -h" >> "${disk_details}"
printf '\n' >> "${disk_details}"
free -h >> "${disk_details}"

if (($? > 0)); then
echo "*** Unable to get disk details ****"

fi

# Check Network Settings
echo "******* cmd for 06_network settings *******"
nw_settings="/tmp/${dir}/06_network settings.txt"

echo "[${user}@${hostname}]# cat /etc/nsswitch.conf|grep ^hosts" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/nsswitch.conf|grep ^hosts >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]#ifconfig eth0" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
ifconfig eth0 >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]#cat /etc/resolv.conf" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/resolv.conf >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]# cat /etc/sysconfig/network-scripts/ifcfg-ens3" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/sysconfig/network-scripts/ifcfg-ens3 >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]# cat /etc/sysconfig/network-scripts/ifcfg-eth0" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/sysconfig/network-scripts/ifcfg-eth0 >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]# cat /etc/iproute2/rt_tables" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/iproute2/rt_tables >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]# cat /etc/sysconfig/network-scripts/rule-eth0" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/sysconfig/network-scripts/rule-eth0 >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

echo "[${user}@${hostname}]# cat /etc/sysconfig/network-scripts/route-eth0" >> "${nw_settings}"
printf '\n' >> "${nw_settings}"
cat /etc/sysconfig/network-scripts/route-eth0 >> "${nw_settings}"
printf '\n' >> "${nw_settings}"

if (($? > 0)); then
echo "*** Unable to get Service lists ****"

fi

# Check Log Settings
echo "******* cmd for 07_log settings *******"
log_settings="/tmp/${dir}/07_log settings.txt"

echo "[${user}@${hostname}]# cat /etc/rsyslog.conf" >> "${log_settings}"
printf '\n' >> "${log_settings}"
cat /etc/rsyslog.conf >> "${log_settings}"
printf '\n' >> "${log_settings}"

echo "[${user}@${hostname}]# cat /etc/logrotate.conf" >> "${log_settings}"
printf '\n' >> "${log_settings}"
cat /etc/logrotate.conf >> "${log_settings}"
printf '\n' >> "${log_settings}"

echo "[${user}@${hostname}]# cat /etc/logrotate.d/syslog" >> "${log_settings}"
printf '\n' >> "${log_settings}"
cat /etc/logrotate.d/syslog >> "${log_settings}"
printf '\n' >> "${log_settings}"

if (($? > 0)); then
echo "*** Unable to get Log Settings ****"

fi

# Check Ftp Settings
echo "******* cmd for 08_ftp settings *******"
ftp_settings="/tmp/${dir}/08_ftp settings.txt"

echo "[${user}@${hostname}]# cat /etc/vsftpd/vsftpd.conf" >> "${ftp_settings}"
printf '\n' >> "${ftp_settings}"
cat /etc/vsftpd/vsftpd.conf >> "${ftp_settings}"
printf '\n' >> "${ftp_settings}"

if (($? > 0)); then
echo "*** Unable to get Ftp Settings ****"

fi

# Create TAR FIle for Reports

echo "**** Creating zip File ****"

cd /tmp;zip -r "$dir".zip "$dir"

if (($? > 0)); then
echo "*** Unable to create zip file ****"

fi

# Copy Output file to S3 bucket

echo "**** Copying zip File to S3 Bucket****"

aws s3 cp "${dir}.zip" s3://t-ln-it2-s3-shared-internal/kyndryl/ec2_config_reports/

if (($? > 0)); then
echo "*** Unable to copy zip file ****"

fi

# Remove Temporary Directory

echo "**** Delete Temporary Directory ****"

cd /tmp;rm -rf ${dir}*

if (($? > 0)); then
echo "*** Unable to delete temporary directory ****"

fi
