#!/bin/bash

yum -y install tigervnc-server
vncserver

wget http://iwanc.googlecode.com/svn/trunk/x86_64/epel-release-6-8.noarch.rpm &&
rpm -ivh epel-release-6-8.noarch.rpm
yum search xfce 
yum groupinfo xfce 
yum -y groupinstall xfce

yum -y groupinstall chinese-support
yum -y install firefox
wget http://iwanc.googlecode.com/svn/trunk/x86_64/libflashplayer.so
mkdir -p ~/.mozilla/plugins/
mv libflashplayer.so ~/.mozilla/plugins/

echo 'VNCSERVERS="1:root"' >> /etc/sysconfig/vncservers
echo 'VNCSERVERARGS[1]="-geometry 1024x768"' >> /etc/sysconfig/vncservers

cat >/root/.vnc/xstartup <<EOF
#!/bin/sh
# Uncomment the following two lines for normal desktop:
unset SESSION_MANAGER
#exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
#xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#twm &
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup
chkconfig NetworkManager off
service NetworkManager stop
chkconfig vncserver on
reboot