yum -y install openssl openssl-devel
yum -y install automake autoconf libtool make
yum -y install gcc gcc-c++
yum -y install git
git clone https://github.com/madeye/shadowsocks-libev.git
cd shadowsocks-libev
./configure
make && make install
cd /usr/local/bin/
iptables -F
echo "OK!"

wget http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz
tar xzvf serverSpeederInstaller.tar.gz
chmod 777 serverSpeederInstaller.sh
./serverSpeederInstaller.sh
