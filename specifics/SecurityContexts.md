## Security Contexts

Containers ran be ran with permissions far beyond what is required and can, if compromised, be a point of entry to the underlying Node. To restrict the access the Pod/Container has you can use a Security Context.

They can include:

- Access control to objects (files etc.) via user ID and group IDs
- SELinux where objects are assigned security labels
- Running as privileged or unprivileged users
- Linux capabilities, giving a process some privileges but not all of the root user
- and more...

You can change who a Pod/Container (all Containers in a Pod run as the same security settings) runs as via:

```yaml
kind: Pod
spec:
  securityContext:
    runAsUser: 1000
    runAsGroup: 2000
    fsGroup: 3000
```

If this field is omitted, the primary group ID of the containers will be root.
