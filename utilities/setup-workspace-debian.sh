echo "OS is Ubuntu 22.04"

echo "Update apt"
sudo apt update

echo "Install git"
sudo apt install git -y

echo  "Install docker"

# if docker does exist then skip

if [ -x "$(command -v docker)" ]; then
  echo "Docker already installed"
else
  echo "Install docker"
  sudo apt-get remove docker docker-engine docker.io containerd runc -y
  sudo apt-get update -y
  sudo apt-get install ca-certificates curl gnupg -y

  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

 echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list -y > /dev/null

  sudo apt-get update -y
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  sudo usermod -aG docker $USER -y
fi

echo "Install microk8s using snap"
# if snap does exist do install

if [ -x "$(command -v snap)" ]; then
  echo "Snap already installed"
else
  echo "Install snap"
  snap install microk8s --classic
fi

echo "Install kubectl using original host"
# if kubectl does not exist do install

if [ -x "$(command -v kubectl)" ]; then
  echo "Kubectl already installed"
else
  echo "Install kubectl"
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi

echo "Install helm"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
