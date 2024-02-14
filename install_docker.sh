yes | sudo apt update;

echo "apt-transport-https apt-transport-https/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install apt-transport-https;

echo "ca-certificates ca-certificates/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates;

echo "curl curl/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install curl;

echo "software-properties-common software-properties-common/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common;

yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
yes | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable";
apt-cache policy docker-ce;

echo "docker-ce docker-ce/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker-ce;

echo "docker-ce-cli docker-ce-cli/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker-ce-cli;

echo "containerd.io containerd.io/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install containerd.io;

echo "docker-buildx-plugin docker-buildx-plugin/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker-buildx-plugin;

echo "docker-compose-plugin docker-compose-plugin/install-setuid boolean true" | sudo debconf-set-selections;
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker-compose-plugin;
