## Scaling

To automatically add more Nodes, you depend on the Cluster Autoscaler. To automatically add more Pods, you depend on the Horizontal Pod Autoscaler.

### Horizontal Pod Autoscaler (HPA)

Generally, handling increased load requires more Pod replicas, the HPA will increase the `replicas` in the Deployment. If the desired count is increased but there is no more capacity in the Cluster, the Pods go into the pending state.

Each HPA is linked to a single Deployment

Because it is horizontal, it handles demand by adding more Pods rather than increasing the resources existing Pods have. In the configuration you can set a target CPU utilisation percentage that will be the threshold required for it to then start increasing the Pod count. For this to work, you have to specify resource requests on your Pods, you can provide a limit and the request size. When the requested amount reaches the percentage threshold defined in the HPA it will then add more. For example, a Pod with a CPU request of `0.5` and a target CPU utilisation of `50%` will start increasing the Pod count when the Pods have `0.25` of CPU utilisation.

It is a good idea to add `minReplicas` and `maxReplicas` to your HPA configuration to always ensure you have some capacity (if required) along with preventing it to over grow above the realistic capacity or other bottlenecks. You can also change delays before any up or down scaling occurs, this prevents the Cluster from overreacting from small fluctuations with the load.

### Cluster Autoscaler

When the CA detects the Cluster has pending Pods it will add more Nodes to the Cluster. With this extra capacity the pending Pods should be able to start on the new Nodes.

This depends on where the Cluster itself is hosted on what is available for scaling and the configuration that is required. You enable the autoscaling at the Cluster level and create pools of Nodes with the same specification. For each Node pool you give each a minimum and maximum value of Nodes that is allowed within each pool.

This type of autoscaling only works if you have defined resources requests for your Pods. When scheduling a new Pod to deploy, Kubernetes looks at the request amount for the new Pod and will look for a Node on the Cluster that has capacity. The CA does not look at actual Node utilisation but will look at the requested value to see if it has capacity. If a Node is sitting idle but is fully requested Pods could be put in the pending state and fail to deploy even on under utilised Nodes. The HPA should get around this as it looks at actual values, but the CA only cares about requested values.

The CA also has delays to prevent over corrections for adding and removing Nodes to the Cluster.

### Vertical Pod Autoscaler (VPA)

Prevents manual configuration of resource limits and requests for the containers in their Pods. It will set the requests automatically based on the usage and schedule onto Nodes so that appropriate resource amounts are available for each Pod. Also maintains ratios between limits and requests that were specified in initial containers configuration.
