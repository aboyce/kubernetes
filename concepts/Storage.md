## Storage

Without volumes, your data is deleted when the Pod is deleted. Volumes decouple storage from Pods.

### Volumes

Volumes allow you to provide more permanent storage for a pod that exists beyond the life of a container.

`EmptyDir` volumes create storage on a node when the pod is assigned to the node, this storage disappears when the pod leaves the node but will outlive the container.

For a pod, you create a `volume` then you mount that volume via `volumeMounts` to the container.

### Container Storage Interface (CSI)

Plugin model to allow 3rd party/external storage solutions to be abstracted away into a common interface. It is an open-standard and out-of-tree solution to prevent specific storage interaction logic being baked into the Kubernetes code base. This also allows the providers to update their code more frequently and does not mean that they have to open source their implementation. Not necessarily a Kubernetes limited interface if others decide to use the same open standard.

### Persistent Volumes (PV)

The storage resource, the size and underlying provider. PVs are independent from the Pods and exists in it's own right. It is a piece of storage in a cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV.

#### Access Modes

There are three ways a Pod can access a volume.

##### `ReadWriteOnce` (`RWO`)

Can only be mounted as read/write by **one** Pod in the cluster.

##### `ReadWriteMany` (`RWM`)

Can be mounted as read/write by **multiple** Pods in the cluster.

##### `ReadOnlyMany` (`ROM`)

Can be mounted by **multiple** Pods in the cluster, but as readonly.

Not all volumes support all modes and a single volume cannot have two active claims against it with different Access Policies. Generally, it is only the file based volumes (like NFS) that support `ReadWriteMany` policies.

### Reclaim Policy

This is what a Cluster does when a claim is released, it can be `Retain` or `Delete`. If supported, a delete could also be handled by the cloud provider to remove the underlying storage outside of Kubernetes.

### Persistent Volume Claim (PVC)

The application's approval to use the Persistent Volume. The `spec` of the PV and PVC must match to be used. The claim has to be less than or equal to the storage capacity for it to bind, if not it will just sit there pending. An abstraction layer between the Pod and the PV. PVCs will automatically bind themselves to a PV that has compatible `StorageClass` and `accessModes`.

### Storage Class (SC)

A way to implement PVs and PVCs in a more dynamic and scalable way, they enable dynamic provisioning of volumes. They can be thought as a template for PVs.

You can wrap a specific storage implementation as a named class. This allows you to create generic storage options that are reusable whilst only providing the underlying storage specifics (could be cloud provider specific) once. The parameters are underlying storage specific and not all would work with different providers, they would be coupled to the storage solution at the other side of the Container Storage Interface.

This abstraction allow a separation of concerns from the system administrators and the application developers.

When we create a PVC using a SC, the underlying storage will be dynamically created in the provider using the specification detailed in the SC and the PV will be automatically created on the cluster that is then bound to the PVC.
