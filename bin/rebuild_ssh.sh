#Re-generate the RSA and ED25519 keys
rm -f /etc/ssh/ssh_host_*
#ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N ""
#ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
for type in rsa dsa ecdsa ed25519; do
    ssh-keygen -t ${type} -N "" -f /etc/ssh/ssh_host_${type}_key
done
restorecon /etc/ssh/ssh_host_*
chgrp ssh_keys /etc/ssh/ssh_host_ed25519_key /etc/ssh/ssh_host_rsa_key
chmod g+r /etc/ssh/ssh_host_ed25519_key /etc/ssh/ssh_host_rsa_key

#Remove small Diffie-Hellman moduli
awk '$5 >= 3071' /etc/ssh/moduli > /etc/ssh/moduli.safe
mv -f /etc/ssh/moduli.safe /etc/ssh/moduli
ssh-keygen -G moduli-2048.candidates -b 2048
ssh-keygen -T moduli-2048 -f moduli-2048.candidates

#Restart OpenSSH server
systemctl restart sshd.service
