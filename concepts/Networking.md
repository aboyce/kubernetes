## Networking

- All Nodes can talk
- All Pods can talk (no NAT)
- Every Pod gets its own IP

Because Pods will come and go, you put a Service in front of them as a stationary/reliable point. This will guarantee to have the assigned IP for its entire lifespan. The Service's name and IP is registered with the cluster's DNS. Every K8s Cluster has a native DNS service. Think as Services as load balancers or proxies. The Service uses a label selector to decided what Pods to balance the traffic to and it uses an Endpoint object to keep a list of Pod IPs and Ports that match the label selector that the service can vary requests to.

### Service Types

#### `ClusterIP` (default)

The default, if you see a manifest that does not specify a type, you'll get a `ClusterIP`. It gives the Service it's own IP address that is only reachable from within the Cluster.

#### `NodePort`

They also get a cluster IP, so can be accessed in the same way. Can also be accessed from outside the cluster with a cluster-wide port. You can get to it by taking the IP Address of any of the Cluster Nodes, and appending that port on.

The default range or ports is 30000-32767, you can change it though if required.

#### `LoadBalancer`

Integrates with a public cloud platform to create a cloud-specific internet-facing load balancer. Some cloud providers will do this with the help of a NodePort.

### Networks

#### Node Network

All Nodes need to be able to talk, K8s does not implement this, it's either the physical network between Nodes or handled by the cloud provider.

#### Pod Network

K8s exposes a plugin interface for 3rd party drivers to implement it. It's big and flat and every Pod gets an IP that can communicate with all other Pods.

All containers within a particular Pod share the same Pod network stack so that Pods can talk to each other via ports on `localhost`.

#### Service Network

Not really a network, really a set of IPVS or IPTABLES rules that trap on service network addresses and rewrite destination IPs so that traffic gets forwarded to Pods on the Pod network.
