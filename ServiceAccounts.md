## Service Accounts

Service accounts allow containers to access the Kubernetes API in a managed way. For applications that are required to interact via the Cluster itself, service accounts provide a way to let them do it securely and with scoped permissions.

You can provide a Service Account in the Pod specification:

```yaml
kind: Pod
spec:
  serviceAccountName: the-name-of-the-service-account
  containers: ...
```

There are several difference between User account and Service accounts:

- User accounts are for humans, service accounts are for processes, which run in Pods.
- User accounts should be global, service accounts are namespaced.
- A Cluster's user accounts should probably be synced from a corporate database and tied to business processes. Service accounts should be lightweight and should be creatable by Cluster users to create as required for specific tasks.
- Auditing requirements for each type may be different.
- A config bundle for large system may include definitions of service accounts, because they are namespaced, they should be portable.
