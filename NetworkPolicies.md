## Network Policies

By default, all pods within a cluster can communicate with any other pod and reach out to any available IP address. NetworkPolicies allow you to limit what network traffic is allow to and from pods within the cluster. This is at OSI layers 3 or 4.

When you apply a network policy, all traffic is then blocked by default.

You specify the type of the policy, which can be one or both of `Ingress` and `Egress`. For each of these you specify allow rules with either `from` or `to`.

### Selectors

#### `podSelector`

Matches traffic to/from pods which match the selector.

#### `namespaceSelector`

Matches traffic to/from pods within namespaces that match the selector. If you have both a `podSelector` and `namespaceSelector` the matching pods must also be within the correct namespace.

#### `ipBlock`

Specifies the CIDR range of IP address that will match the rule. This is mostly used for traffic to/from outside of the cluster rather than internally. You can also specify exceptions to the range using `except`.
