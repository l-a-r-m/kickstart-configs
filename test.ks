#version=OL8
# Use graphical install
graphical

repo --name="AppStream" --baseurl=file:///run/install/sources/mount-0000-cdrom/AppStream

%packages
@^minimal-environment
@standard
kexec-tools
epel-release


%end

# Keyboard layouts
keyboard --xlayouts='de'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp1s0 --ipv6=auto --activate
network  --hostname=localhost.localdomain

# Use CDROM installation media
cdrom

# Run the Setup Agent on first boot
firstboot --enable

ignoredisk --only-use=vda
autopart
# Partition clearing information
clearpart --none --initlabel

# System timezone
timezone Europe/Berlin --utc --nontp

# Root password
rootpw --iscrypted $6$A6WMWNi1dxe/DRne$8jTimrIPv6E4heGgZrJNJ37yehjpzftGyKIXzvTQSAK8W/8VK7q7T8CIz14grE0iWlaNs5LA9zDd79V18JM4y0

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
