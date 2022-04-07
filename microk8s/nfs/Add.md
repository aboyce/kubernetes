## Adding NFS to Kubernetes

```bash
# Add the helm repository
helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts
```

### Adding a Storage Class

```bash
# Create the Storage Class mapped to the NFS share
helm install --set nfs.server=[IP_ADDRESS] \
 --set nfs.path=/var/nfs/kubernetes/[NAMESPACE] \
 --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm \
 --set storageClass.name=nfs-client-[NAMESPACE] \
 ckotzbauer/nfs-client-provisioner \
 -n [NAMESPACE] \
 --generate-name
```

### Checking the Storage Class

```bash
# Check that the install has worked
kubectl get storageclass

# Should show the nfs-client
kubectl get pods
```

### TODO

```bash
# should show the pod is running

# When creating a new deployment, in the PersistentVolumeClaim

# accessModes: ReadWriteMany

# storageClassName: nfs-client
```

### Remove the Storage Class

```bash
kubectl delete storageclass [NAME]
```
