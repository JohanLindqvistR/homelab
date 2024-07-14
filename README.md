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
 
