## Secrets

A way of storing and managing sensitive information. This could be passwords, auth tokens and ssh keys. You can store multiple values in a single secret as key/value pairs.

By default, Kubernetes secrets are store as unencrypted base64 encoded strings and can be retrieved as plain text by anyone who can access the API or the underlying data store. As a minimum, it is recommended that you:

- Enabled encryption when at rest
- Enable and configure RBAC rules to restrict reading and writing secrets. They can be obtained by anyone with the permission to create a Pod.

You can reference a Secret from within a Pod in three ways:

- As files in a volume that is mounted to one or more containers
- Container environment variables
- By the kubelet when pulling images for the Pod

To reference values within Secrets mapped as env vars via the `env` configuration in a Pod definition:

```yaml
env:
  - name: MY_SECRET_VAR_1
    valueFrom:
      secretKeyRef:
        name: the-name-of-the-secret
        key: key1
```
