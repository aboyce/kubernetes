## Deployments

Deployments are a wrapper around Pods that manage scaling and updates via Replica Sets. It takes care of running a single type of Pod.

A Deployment knows which resources it is in charge of managing via labels and a label selector.

Any changes made in the `template` section will cause a rolling update to occur, anything outside of there will cause changes but not via a rolling update. If you have in-flight updates and make further changes, the original one will be dropped and Kubernetes will start working on applying the new version.
