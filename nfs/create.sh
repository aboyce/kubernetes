# Host - Update the servers who can interact
sudo nano /etc/exports

# Host - Restart NFS for changes to apply
sudo systemctl restart nfs-kernel-server

# Client - Mount the share
sudo mkdir -p /nfs
sudo mount [HOST_IP]:/var/nfs /nfs

# Client - Check it is mounted
dh -h

# Client - Unmount (move out of the shared directory)
sudo umount /nfs

# To ensure other can use the created folders
sudo chown -R nobody:nogroup /nfs
sudo chmod 777 /nfs
