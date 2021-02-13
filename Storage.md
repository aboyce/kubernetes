## Storage

Without volumes, your data is deleted when the Pod is deleted. Volumes decouple storage from Pods.

### Container Storage Interface (CSI)

Plugin model to allow 3rd party/external storage solutions to be abstracted away into a common interface. It is an open-standard and out-of-tree solution to prevent specific storage interaction logic being baked into the Kubernetes code base. This also allows the providers to update their code more frequently and does not mean that they have to open soource their implementation. Not necessarily a Kubernetes limited interface if others decide to use the same open standard.

### Persistent Volumes (PV)

The storage resource, the size and underlying provider. PVs are independent from the Pods and exists in it's own right.

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

The application's approval to use the Persistent Volume. The `spec` of the PV and PVC must match to be used. The claim has to be less than or equal to the storage capacity for it to bind, if not it will just sit there pending.

### Storage Class (SC)

A way to implement PVs and PVCs in a more dynamic and scalable way, they enable dynamic provisioning of volumes. They can be thought as a template for PVs.

You can wrap a specific storage implementation as a named class. This allows you to create generic storage options that are reusable whilst only providing the underlying storage specifics (could be cloud provider specific) once. The parameters are underlying storage specific and not all would work with different providers, they would be coupled to the storage solution at the other side of the Container Storage Interface.

This abstraction allow a separation of concerns from the system administrators and the application developers.

When we create a PVC using a SC, the underlying storage will be dynamically created in the provider using the specification detailed in the SC and the PV will be automatically created on the cluster that is then bound to the PVC.
