pihole
curl -sSL https://install.pi-hole.net | bash

unbound
https://docs.pi-hole.net/guides/dns/unbound/
sudo su -
sudo apt install unbound
sudo nano /etc/unbound/unbound.conf.d/pi-hole.conf
sudo service unbound restart


troubleshoot
reinstall config
sudo apt -o Dpkg::Options::="--force-confmiss" install --reinstall unbound


docker exec -it <mycontainer> sh
pihole setpassword

$  hostnamectl set-hostname NEW-HOST
$  hostname
NEW-HOST