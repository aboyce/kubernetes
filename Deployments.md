## Deployments

Deployments are a wrapper around Pods that manage scaling and updates via ReplicaSets. It takes care of running a single type of Pod and provides declarative updates for Pods and ReplicaSets.

You describe a desired state in a Deployment, the Deployment Controllers makes changes to ensure the desired state is achieved.

Do not manages ReplicaSets that are owned by a Deployment.

A Deployment uses a `.spec.selector` to know which Pods it is in charge of managing, this could often be a label selector using `matchLabels` although more complex options are available. An example selector:

```yaml
spec:
  replicas: 2
  selector:
    matchLabels:
      labelKey: labelValue
```

To ensure that the Pods it creates are part of the Deployment, you specify what labels to add via the Deployment config.

```yaml
spec:
  template:
    metadata:
      labels:
        labelKey: labelValue
```

Any changes made in the `template` section will cause a rolling update to occur, anything outside of there will cause changes but not via a rolling update. If you have in-flight updates and make further changes, the original one will be dropped and Kubernetes will start working on applying the new version.

### Rolling Updates

You can update the Deployment via `kubectl` for example updating the version of an image with `kubectl set image deployment/deployment-name container-name=image-name` and pass the `--record` flag to keep this change stored to allow us to revert it. The Deployment will handle this change for us and ensure the change is rolled out.

To see the history of changes for a Deployment you can use `kubectl rollout history deployment/deployment-name`.

To rollback a change that went wrong, you can use `kubectl rollout undo deployment/deployment-name`, this will use the previous revision. To specify a revision number you can use `--to-revision=0` where 0 is the revision we want to go back to.
