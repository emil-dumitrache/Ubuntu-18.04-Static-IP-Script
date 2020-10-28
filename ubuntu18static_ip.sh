ens=$(ip r | grep default | cut -d\  -f5)

echo "Tipe the IP with mask:"

read ipaddress
read gateway4
read nameserver1
read nameserver2

sudo mv /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.dhcp

sudo cat << EOF > /etc/netplan/50-cloud-init.yaml

network:
    ethernets:
        $ens:
            addresses: [$ipaddress]
            gateway4: gateway4
            nameservers:
                addresses: [nameserver1, nameserver2]
    version: 2

EOF

sudo netplan apply

echo "The static IP address $ipaddress was configured"
