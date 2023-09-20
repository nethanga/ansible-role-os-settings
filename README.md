Synopsis
--------
ansible-role-os-settings Repository holds playbooks for Linux server post build automation via Ansible Engine.
This automation helps in configuring below settings.

|Sl-no | Playbook Name |Task name | Description |
| --- | --- | --- |---|
|1  | cloud_cfg.yml|Updates cloud.cfg config file| 1) Creates backup of cloud.cfg. 2) Replaces values of ssh_pwauth. 3) Comment lines "locale,timezon and ssh". 
|2  | grub_conf.yml|Updates grub file and makes grub| 1) Creates backup of grub and grub.cfg. 2) Updates values of GRUB_CMDLINE_LINUX. 3) Make grub to generate new config file.
|3  | limits_conf.yml|Updateds limits.conf file| 1) Creates backup of limits.conf. 2) Adds blocks of lines to end of limits.conf file.
|4  | login_defs.yml|Updates login.defs file| 1) Creates backup of login.defs. 2) Replaces value of PASS_MAX_DAYS in login.defs file.
|5  | lvm_disk1.yml|Configuring LVM on secondary HD1| 1) Creates Partition on secondary HD1 using parted utilizating full size. 2) Creates defined Volume Group from Physical Volume. 3) Creates LV for Swap and other defined LV names with defined size. 4) Creates Swap with defined size and mounts the Swap. 5) Creates xfs file system for the LV's. 6) Creates directories for the LV's to mount if not present. 7) Updates /etc/fstab file with UUID and mountpoint.
|6  | lvm_disk2.yml|Configuring LVM on secondary HD2| 1) Creates Partition on secondary HD2 using parted utilizating full size. 2) Creates defined Volume Group from Physical Volume. 3) Creates LV's defined with defined size. 4) Creates xfs file system for the LV's. 5) Creates directories for the LV's to mount if not present. 6) Updates /etc/fstab file with UUID and mountpoint.
|7  | main.yml|	Controls playbooks execution| 1) Gathers host and date information. 2) executes the playbooks if it is set to execute.
|8  | motd.yml|	Updated motd file| 1) Updated login banner defined in /etc/motd file.
|9  | os_general_settings.yml| General Settings| 1) Prints Hostname. 2) update selinux file to disable SELINUX. 3) Checks firewalld service on server and stops it if it is running. 4) Change multi-user Mode. 5) Updates locale settings to JP. 6) Sets timezone to Asia/Tokyo. 7) Reboots Servers to apply changes.
|10  | package_installation.yml| Install Common Group Packages and Individual packages for the host| 1) Matches inventory_hostname with Groups to identify Group Name. 2) Installs Packages belongs to the Group(Group1 or Group2). 3) Installs packages specific to the host.
|11  | rsyslog_logrotate_conf.yml| Updates changes to rsyslog.conf and logrotate.conf| 1) Creates back of rsyslog.conf and logrotate.conf files. 2) Replaces the defined parameter in rsyslog.conf file. 3) Adds defined set of lines to logrotate.conf file.
|12  | services.yml| Start Services| 1) Start Specific services on box.
|13  | sshd_config.yml|	SSH related Configurations| 1) Creates backup of "sshd_config,sshd,ssh_config,05-redhat.conf". 2) Replaces value defined on sshd_config file. 2) Replaces value defined on sshd file. 3) Replaces value defined on ssh_config file. 4) Replaces value defined on 05-redhat.conf. 5) Restarts "sshd" service to make changes.
|14  | sysctl_yum_conf.yml| Updates configuration changes| 1) Creates backup of sysctl.conf and yum.conf file. 2) Adds Specifid rules on sysctl.conf file. 3) Replaces specified lines in yum.conf file.
|15  | user_creation.yml| User Group Creation & User Creation|  1) Create group TC_UNIX. 2) Create users defined in SOP. 3) Check for users created in /etc/passwd file. 4) Check for users home directory and update the directory permissions. 5) Set the Initial Passwords for created users. 


Role Name
=========
ansible-role-os-settings


Requirements
------------
Below are the pre-requisites before executing the role from Ansible Engine.

1) Check if server has been provisioned, up and running. 
2) inventory files file must be created and servers entry to be added in groups([group1] and [group2]).
3) Route 53 Entry to be added for the VM's inorded to resolve it's hostname from Ansibe box.
 
Repository Information
-----------------------
 Github : https://github.kyndryl.net/Hcs-cicindia-Japaniot/JTB-Kyndryl-CIC-automation
  
Directory Contents:  
-------------------
Defaults :

main.yml in this directory is to control the execution of playbooks. Variables for the automation are defined in main.yml. 
List of playbooks are defined in this file with "yes" or "no" value. "yes" is defined after the playbook name to execute the playbook and  "no" to skip the playbook execution.

All the necessary values for the variables to be updated in "main.yml" only.

Tasks :

All the yml files related to the automation are developed and stored under TASKS directory. 


Wrapper.yml 
------------
wrapper.yml file contains the details of the role which is executed.

Execution
---------
Below is the Commandline parameter to execute the playbooks.
									
[root@lkpyum01 ~]# cd /home/opc/cic/
												
[root@lkpyum01 cic]# pwd
 													
/home/opc/cic
															
[root@lkpyum01 cic]# cd ansible-role-os-settings
 										
[root@lkpyum01 JTB-Kyndryl-CIC-automation]# ls
 											
hosts  README.md  roles  wrapper.yml
												
[root@lkpyum01 JTB-Kyndryl-CIC-automation]# ansible-playbook -i hosts(inventory file name) wrapper.yml				

License
-------

General

Author Information
------------------

Nelson Thangaraj
