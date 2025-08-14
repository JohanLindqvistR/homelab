https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update && sudo apt-get install packer