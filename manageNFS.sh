# Add the helm repository
helm repo add ckotzbauer https://ckotzbauer.github.io/helm-charts

# Ensure you are in the correct namespace
helm install --set nfs.server=x.x.x.x --set nfs.path=/exported/path ckotzbauer/nfs-client-provisioner --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm --generate-name
## full example
helm install --set nfs.server=[IP_ADDRESS] --set nfs.path=/var/nfs/kubernetes/[NAMESPACE] --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm ckotzbauer/nfs-client-provisioner --set storageClass.name=nfs-client-[NAMESPACE] -n [NAMESPACE] --generate-name

# Check that the install has worked
kubectl get storageclass
# should show the nfs-client
kubectl get pods
# should show the pod is running

# When creating a new deployment, in the PersistentVolumeClaim
# accessModes: ReadWriteMany
# storageClassName: nfs-client
