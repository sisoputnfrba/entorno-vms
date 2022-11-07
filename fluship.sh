#!/bin/sh

set -e

cat > ~/flush-ip-address.service <<EOF
[Unit]
After=network.target

[Service]
ExecStart=/usr/local/bin/flush-ip-address.sh

[Install]
WantedBy=default.target
EOF

sudo mv ~/flush-ip-address.service /etc/systemd/system/flush-ip-address.service
sudo chmod 664 /etc/systemd/system/flush-ip-address.service

cat > ~/flush-ip-address.sh <<EOF
#!/bin/sh

set -e

date > /root/fluship.txt

ip addr flush dev enp0s3 >> /root/fluship.txt

dhclient >> /root/fluship.txt

ifconfig >> /root/fluship.txt
EOF

sudo mv ~/flush-ip-address.sh /usr/local/bin/flush-ip-address.sh
sudo chmod 744 /usr/local/bin/flush-ip-address.sh

sudo systemctl daemon-reload
sudo systemctl enable flush-ip-address.service

