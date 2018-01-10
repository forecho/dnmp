## 目录的生成
git clone https://github.com/lukas2511/dehydrated
sudo mkdir -p /etc/dehydrated
sudo mkdir -p /var/www/dehydrated
sudo chown `whoami` -R /var/www/dehydrated
sudo chown `whoami` -R /etc/dehydrated
cp ~/dehydrated/docs/examples/config /etc/dehydrated/config
cp ~/dehydrated/docs/examples/domains.txt /etc/dehydrated/domains.txt
echo 'WELLKNOWN="/var/www/dehydrated/"' > /etc/dehydrated/config
echo 'BASEDIR="/etc/dehydrated/"' > /etc/dehydrated/config

## 输入域名
echo "blog.forecho.com www.forecho.com" > /etc/dehydrated/domains.txt