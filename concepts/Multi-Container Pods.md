## Multi-Container Pods

A way to enhance containers with helper or side containers to provide additional functionality to the primary application.

Some common use cases for multi-container Pods could be:

- Data pullers
- Data pushers
- Proxies

They often need to communicate with each other, this can be via a shared filesystem or through network communication on localhost.

A secondary container allows an abstraction of the jobs required, can be developed once by a separate team and used by multiple other teams, solving the problem once in a clear way and having a constant solution to the same problem.

### Common Design Patterns

#### Sidecar Containers

The sidecar container extends and enhances the primary container in a way that can improve the initial container but is coupled closely enough it makes sense to keep them together as a complete unit. This could be a web server container and a sidecar container to synchronises a git repository, both sharing the same filesystem. By doing it this way, you can maintain the separation of concerns with potentially different teams working on each container but linking together to create a single self-updating web server that could also use the same sidecar with multiple web servers for various languages.

Another example would be to handle the logs created by the primary container as they would share the same filesystem.

#### Ambassador Containers

Ambassador containers can be used to proxy a local connection to the outside. An example of this could be a Redis cluster made up of both read-replica and a single write master. The ambassador could be responsible for separating out the read and write requests and forwarding on to the appropriate external (outside the Pod) server. Because they both share the same network stack, the primary application/container just connects to the Redis server on localhost and the ambassador sends out the requests to the appropriate server depending on if it is a read or write request. In the development environment the application can just connect to a locally running Redis server that would also be on localhost.

#### Adapter Containers

Adapter containers standardise and normalise output. For a large application made up of several different technologies there could be various logging output formats which would not be suitable for a single monitoring system that expects it in a uniform format. The adapter can be paired up to transform the output into that consistent format, whilst sharing the same file systems means this is a simple problem to solve. You could have a single adapter for each primary application, again managed and developed once by a potentially separate team.
