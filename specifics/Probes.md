## Probes

A diagnostic performed periodically by the kubelet on a Container, this calls a handler implemented by the container.

There are three types of handlers.

### `ExecAction`

Executes a command inside the container, it is successful if the command exits with a status code of 0.

### `TCPSocketAction`

Performs a TCP check against the Pod's IP address on a specific port, it is successful if the port is open.

### `HTTPGetAction`

Performs an HTTP `GET` against the Pod's IP address on a specific port, it is successful if the response status code is `>= 200` and `< 400`.

There are three results:

- `Success`
- `Failure`
- `Unknown` - the diagnostic itself failed, no action should be taken

There are three kinds of probes to use against running containers.

### `livenessProbe`

Indicates whether the container is running. If it fails, the kubelet kills the container and is restarted. If there is no liveness probe, the default state is `Success`.

### `readinessProbe`

Indicates whether the container is ready to respond to a request. If it fails, the endpoints controller removes the Pod's IP address from the endpoints of all matching Services. The default state before the initial delay is `Failure`. If there is no readiness probe, the default state is `Success`.

### `startupProbe`

Indicates where the application within the container has started. All other probes are disabled if a startup probe is provided, until it succeeds. If it fails, the kubelet kills the container and is restarted. If there is no startup probe, the default state is `Success`.

Examples probes for a container for an API micro service:

```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 80
readinessProbe:
  httpGet:
    path: /
    port: 80
```
