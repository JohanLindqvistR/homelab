# homelab

## steps

 Generate keys\
 draup\
ssh-keygen -t ed25519 -C "draup default"

save as id_ed25519 

ansible\
ssh-keygen -t ed25519 -C "ansible"
 
save as ansible
 add keys to server

ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.100.10

ssh-copy-id -i ~/.ssh/ansible.pub 192.168.100.10

git ssh key in settings

git config --global user.name "name name"
git config --global user.email "name@domain.com"

git add .

git commit -m "comment"

 git push origin main

ssh alias
 alias ssha='eval $(ssh-agent) && ssh-add'


 # set ansible
 


 ansible-playbook playbooks/setup-user.yaml 


run ansible
ansible-playbook site.yml


update servers
ansible-playbook playbooks/apt-upgrade.yaml

check if boor is needed
ansible-playbook playbooks/reboot-required.yaml

# new server

# add keys to server
ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.100.10
ssh-copy-id -i ~/.ssh/ansible.pub 192.168.100.10

 # set ansible
 # add to inventory first
ansible-playbook playbooks/setup-user.yaml -K -u draup

# Ubuntu dns
sudo rm -f /etc/resolv.conf
sudo ln -sv /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved.service


 # Ubuntu Desktop
 sudo apt install xrdp -y
 sudo systemctl start xrdp
 sudo systemctl enable xrdp
 sudo adduser xrdp ssl-cert
 sudo systemctl restart xrdp

 
