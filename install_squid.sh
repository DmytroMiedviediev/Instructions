sudo apt update -y;
sudo apt install squid -y;
sudo systemctl stop squid;
sudo rm /etc/squid/squid.conf;
sudo tee /etc/squid/squid.conf > /dev/null <<EOF
# Порти для HTTP і HTTPS
http_port 3128

# Дозволені порти (HTTP/HTTPS)
acl Safe_ports port 80          # HTTP
acl Safe_ports port 443         # HTTPS
acl Safe_ports port 1025-65535  # Некоректні порти
acl CONNECT method CONNECT

# Доступ до HTTPS
acl SSL_ports port 443
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports

# Дозволити всі підключення
http_access allow all

cache_dir ufs /var/spool/squid 1000 16 256
cache_mem 256 MB
maximum_object_size 50 MB
EOF
sudo systemctl start squid;
sudo systemctl enable squid;
