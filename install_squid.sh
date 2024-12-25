sudo apt update -y;
sudo apt install squid -y;
sudo systemctl stop squid;
sudo rm /etc/squid/squid.conf;
sudo bash -c 'echo "# Порти для HTTP і HTTPS\nhttp_port 3128\n\n# Дозволені порти (HTTP/HTTPS)\nacl Safe_ports port 80          # HTTP\nacl Safe_ports port 443         # HTTPS\nacl Safe_ports port 1025-65535  # Некоректні порти\nacl CONNECT method CONNECT\n\n# Доступ до HTTPS\nacl SSL_ports port 443\nhttp_access deny !Safe_ports\nhttp_access deny CONNECT !SSL_ports\n\n# Дозволити всі підключення\nhttp_access allow all\n\ncache_dir ufs /var/spool/squid 1000 16 256\ncache_mem 256 MB\nmaximum_object_size 50 MB" > /etc/squid/squid.conf';
sudo systemctl start squid;
sudo systemctl enable squid;