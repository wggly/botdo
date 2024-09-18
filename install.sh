clear
clear
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y
apt-get install libjpeg-dev zlib1g-dev -y
cd /etc/
git clone https://github.com/wggly/botdo.git
pip3 install -r /etc/dobot/requirements.txt

clear
read -e -p "[*] Input Nama Luuu   : " nama
read -e -p "[*] Input Bot Token   : " bottoken
read -e -p "[*] Input Id Telegram : " admin

sed -i "s/NAMA STORE/$nama/g" /etc/botdo/config.json &> /dev/null
sed -i "s/BOT TOKEN/$bottoken/g" /etc/botdo/config.json &> /dev/null
sed -i "s/ID TELEGRAM/$admin/g" /etc/botdo/config.json &> /dev/null
 
cat > /etc/systemd/system/botdo.service << END
[Unit]
Description=SGDO
After=network.target

[Service]
WorkingDirectory=/etc/botdo
ExecStart=/usr/bin/python3 -m main
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable botdo
systemctl start botdo

cd
rm install.sh
echo -e "Sukses Create Panel BOT Digital Ocean /start di bot untuk mulai"
