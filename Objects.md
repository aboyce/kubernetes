## Objects/Primitives

These are persistent entities in the Kubernetes system, you can see them all with `kubectl api-resources -o name`.

Every object has a spec and a status:

#### Spec

Defines the desired state of the object, this is provided by you when you create the object.

#### Status

Information about the current state of the object, this is provided and updated by Kubernetes.

To get an objects spec and status you can use `kubectl describe [TYPE] [NAME]`
