## Services

Create a layer of abstraction to the network for a dynamic set of pods. Most services use a selector to determine which pods will receive traffic through the service. As pods can be added and removed dynamically the service provides a layer above that results in uninterrupted access via the service.

A service can map any incoming `port` to a `targetPort`. By default and for convenience, the `targetPort` is set to the same value as the `port` field.

### Service Types

#### `ClusterIP`

The service is exposed within the cluster using an internal IP address, it is also accessible via the cluster DNS. This only makes the service reachable from within the cluster.

#### `NodePort`

The service is exposed externally via a port which listens on each node within the cluster. Accessible via `<NodeIP>:<NodePort>`.

#### `LoadBalancer`

Only for clusters in cloud providers. The service is exposed through a load balancer that is created by the cloud platform, each provider will have a different implementation of this. This is a superset of `NodePort`.

#### `ExternalName`

Maps the service to an external address. Used to allow resources within the cluster to access things outside the cluster through a service. This only sets up a DNS mapping, it does not proxy traffic.
