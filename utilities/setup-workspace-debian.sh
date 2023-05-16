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
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  sudo usermod -aG docker $USER
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
