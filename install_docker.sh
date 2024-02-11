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
yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;
