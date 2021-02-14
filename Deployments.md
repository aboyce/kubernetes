## Deployments

Deployments are a wrapper around Pods that manage scaling and updates via Replica Sets. It takes care of running a single type of Pod.

A Deployment knows which resources it is in charge of managing via labels and a label selector.

Any changes made in the `template` section will cause a rolling update to occur, anything outside of there will cause changes but not via a rolling update. If you have in-flight updates and make further changes, the original one will be dropped and Kubernetes will start working on applying the new version.

### Replica Sets (RS)

We should not really interact with these directly, let the Deployment handle them. If we manually removed the Replica Set the Deployment would just instantly recreate it.

To do a rolling update when the Deployment's desired state changes, a new Replica Set is created. That starts to add Pods as the old Replica Set starts removing the old ones. You can specify how many Pods you can go above and below the desired number of replica Pods with `maxSurge` and `maxUnavailable`, along with the amount of time to allow before the next Pod it replaced (with `minReadySeconds`) to help catch any errors that occur as the new Pod gets fully operational.

When a change is made that requires a new Replica Set the previous versions are not deleted, this allows for quick rollbacks to previous state. Caution should be used though as this will cause the Kubernetes state to differ from source controlled YAML files, any new deployments would override the rolled back state with the potentially broken source controlled configuration.
