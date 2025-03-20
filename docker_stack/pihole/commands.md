curl -L https://raw.githubusercontent.com/JohanLindqvistR/homelab/main/docker_stack/pihole/pihole-unbound.yaml -o docker-compose.yaml

cd ..
mkdir unbound
cd unbound
curl -L https://raw.githubusercontent.com/JohanLindqvistR/homelab/main/docker_stack/pihole/unbound.conf -o unbound.conf


systemctl disable systemd-resolved.service
systemctl stop systemd-resolved

docker up -d