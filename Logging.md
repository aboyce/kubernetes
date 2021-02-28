## Logging

The simplest and most adopted logging method for containers is writing to standard output and standard error streams. This native functionality may not/is not enough for a complete logging solution. You are likely to want to access the logs if a container crashes, a Pod get evicted, or a node dies. Within a Cluster, the logs should have a separate storage and lifecycle that is independent of nodes, pods, or containers. This is called cluster-level logging.

Kubernetes does not provide a native solution for handling the storing, analysis or querying of logs, but there are many solutions available that integrate well.

To get the logs from a Pod you use `kubectl logs POD_NAME`, the `--previous` flag is used to get logs from a previous instantiation of the container. If your pod has multiple containers, you must specific which container to retrieve logs for.

By default, if a container restarts, the kubelet keeps a terminated container with its logs. If a pod is evicted from the node, all corresponding containers are also evicted, including the logs.

It is up to you to handle log rotation to prevent the logs taking up all of the node's storage. You can configure the container runtime to rotate the logs for you.
