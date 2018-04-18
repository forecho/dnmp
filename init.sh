sodu rm -r /etc/apt/sources.list

echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> sodu /etc/apt/sources.list


locale-gen zh_CN.UTF-8

# ------- PPA's -------

# utility to be able to use apt-add-repository

# php7
sodu apt-get install python-software-properties build-essential software-properties-common -y
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
sodu apt-get update > /dev/null

## 安装 nginx mysql php
sudo apt-get update -y
sudo apt-get install -y nginx
sudo apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-curl php7.0-bcmath
sudo apt-get install -y mysql-server

#安装 autojump
sudo apt-get install -y autojump
# 添加 source /usr/share/autojump/autojump.bash
echo "source /usr/share/autojump/autojump.bash" > ~/.bashrc
source ~/.bashrc

# 安装 composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer global require hirak/prestissimo
composer global require "fxp/composer-asset-plugin:^1.4.0"

# 安装 phpmyadmin
mkdir -p /home/www/default && cd /home/www/default
wget https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_7_3.zip
sudo apt-get autoremove -y
sudo apt-get install -y unzip && unzip RELEASE_4_7_3.zip 
mv phpmyadmin-RELEASE_4_7_3 phpmyadmind && cd phpmyadmind
cp config.sample.inc.php config.inc.php
composer install

# git 初始化

git config --global core.editor "vim"
git config --global user.name "forecho"
git config --global user.email caizhenghai@gmail.com
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

## 处理 nginx
## 强制覆盖
cp -f nginx/default /etc/nginx/sites-available/default
cp nginx/http.conf.demo /etc/nginx/conf.d/
cp nginx/https.conf.demo /etc/nginx/conf.d/
service nginx reload
