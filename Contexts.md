## Contexts whilst using `kubectl`

### Show the Contexts

```bash
kubectl config view
```

### Show the current Context

```bash
kubectl config current-context
```

### Create a new Context

```bash
kubectl config set-context [NAME] --namespace=[NAMESPACE] --cluster=[CLUSTER] --user=admin
```

### Change Context

```bash
kubectl config use-context [NAME]

# All requests made to the cluster are scoped to the correct namespace
```
