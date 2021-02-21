## Config Maps

ConfigMaps allow the decoupling of configuration from the container images to keep them portable.

You create a ConfigMap as you would like any other Kubernetes object. A YAML example can include a data section with key/value pairs:

```yaml
data:
  key1: value1
  key2: value2
```

You can reference values within ConfigMaps mapped as env vars via the `env` configuration in a Pod definition:

```yaml
env:
  - name: MY_VAR_1
    valueFrom:
      configMapKeyRef:
        name: the-name-of-the-config-map
        key: key1
```

You can also mount the configuration as a volume in a container:

```yaml
spec:
  volumes:
    - name: config-map-volume
      configMap:
        name: the-name-of-the-config-map
```

A volume needs to be mounted in the usual way:

```yaml
spec:
  containers:
    - name: ...
      image: ...
      volumeMounts:
        - name: the-name-of-the-volume
          mountPath: /etc/config-map
```

When mounted in this way, each top level config key will become a file in the mounted directory that can then be used within the container.
