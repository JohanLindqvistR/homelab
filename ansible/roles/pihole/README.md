pihole
curl -sSL https://install.pi-hole.net | bash

unbound
https://docs.pi-hole.net/guides/dns/unbound/
sudo su -
sudo apt install unbound
sudo nano /etc/unbound/unbound.conf.d/pi-hole.conf
sudo service unbound restart