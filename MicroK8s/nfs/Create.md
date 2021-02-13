# Creating NFS

_(For development purposes only)_

## Host - Access List

```bash
# Update the servers who can interact
sudo nano /etc/exports

# Restart NFS for changes to apply
sudo systemctl restart nfs-kernel-server

# Ensure others can use the created folders
sudo chown -R nobody:nogroup /nfs
sudo chmod 777 /nfs
```

## Client - Mount the share

```bash
# Create the directory
sudo mkdir -p /nfs

# Mount the share
sudo mount [HOST_IP]:/var/nfs /nfs

# Check it is mounted
dh -h
```

## Client - Unmount

```bash
# (move out of the shared directory)
sudo umount /nfs
```
