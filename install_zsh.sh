sudo apt update -y;
sudo apt install zsh -y;
chsh -s $(which zsh);
yes | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' /root/.zshrc;
zsh;
