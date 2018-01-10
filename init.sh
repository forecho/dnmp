## 安装 nginx mysql php
sudo apt-get update -y
sudo apt-get install -y nginx
sudo apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-curl
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
sudo apt-get install -y unzip && unzip RELEASE_4_7_3.zip 
mv phpmyadmin-RELEASE_4_7_3 phpmyadmind && cd phpmyadmind
cp config.sample.inc.php config.inc.php
composer install

## 处理 nginx
## 强制覆盖
cp -f nginx/defult /etc/nginx/sites-available/defult
cp -f nginx/http.conf.demo /etc/nginx/conf.d/
cp -f nginx/https.conf.demo /etc/nginx/conf.d/