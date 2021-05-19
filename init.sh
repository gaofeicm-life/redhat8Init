sudo yum install git wget nano nginx java python2 python3 autoconf openssl openssl-devel make gcc automake libtool asciidoc xmlto pcre-devel -y
git clone https://github.com/ARMmbed/mbedtls.git
cd mbedtls
make && make install
cd ../
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.18-stable.tar.gz
tar -zxf libsodium-1.0.18-stable.tar.gz
cd libsodium-stable
./configure --prefix=/usr
make && make check
sudo make install
sudo ldconfig
cd ../
sudo git clone https://github.com/c-ares/c-ares.git
cd c-ares/
sudo ./buildconf
sudo ./configure
make && make install
cd ../
wget https://tls.mbed.org/download/mbedtls-2.4.0-gpl.tgz
tar -zxvf mbedtls-2.4.0-gpl.tgz
cd mbedtls-2.4.0
make && make install
cd ../
sudo git clone https://github.com/enki/libev.git
cd libev
./configure --prefix=/usr
make && make install
cd ../
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
sudo ./autogen.sh && ./configure && make
sudo make install
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-port=8388/tcp
firewall-cmd --permanent --zone=public --add-port=8388/udp
firewall-cmd --permanent --zone=public --add-port=22/tcp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=804/tcp
firewall-cmd --permanent --zone=public --add-port=920/tcp
firewall-cmd --permanent --zone=public --add-port=9999/tcp
firewall-cmd --permanent --zone=public --add-port=1010/tcp
firewall-cmd --permanent --zone=public --add-port=1120/tcp
firewall-cmd --reload
firewall-cmd --list-all
