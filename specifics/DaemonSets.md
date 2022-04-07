## Daemon Sets

These also manage Pods (like Deployments) but are not about scaling, instead these are about ensuring that a particular Pod is running on every Node in the Cluster.

This means you can add or remove Nodes from the Cluster and the Daemon Set ensures that the Pod exists on the new Nodes.
