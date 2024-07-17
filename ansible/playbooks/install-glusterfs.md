All

sudo add-apt-repository ppa:gluster/glusterfs-10

sudo apt update

sudo apt install glusterfs-server -y

sudo systemctl start glusterd
sudo systemctl enable glusterd

HOST

sudo -s

gluster peer probe draupswarm2

sudo gluster pool list

All

sudo mkdir -p /gluster/volumes

Host

sudo gluster volume create prod-gfs replica 2 draupswarm1:/gluster/volumes draupswarm2:/gluster/volumes force

sudo gluster volume start prod-gfs

ALL

sudo -s

echo 'localhost:/prod-gfs /mnt glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0' >> /etc/fstab

mount.glusterfs localhost:/prod-gfs /mnt

chown -R root:docker /mnt
exit

df -h


adding m0ore briks

gluster volume add-brick prod-gfs replica (current +brick) draupswarm x:/gluster/volumes