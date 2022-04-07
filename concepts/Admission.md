## Admission

RBAC denies everything by default, this is initially avoided by the pre-created admin (allowing all verbs on all resources) accounts.

### Authentication

Requests arrive at the API server with credentials, they are checked, then the Authentication module either approves or denies the request. Out of the box you can access the API via:

- Bearer Tokens
- Client Certificates
- Bootstrap Tokens

There are no user accounts in Kubernetes, these are all managed externally. You would be expected to use something such as Active Directory or AWS IAM to handle individual user access or groups.

#### Service Accounts

These are managed in Kubernetes but are not for individual user use with things such as `kubectl`, these are for system components. As all the underlying actions are done via the API, these are required for day-to-day operations and the credentials are stored in secrets. You can manage these yourself depending on the individual requirements or environment you are in.

### Authorisation

Defines which **Subjects** can take which **Verbs** (HTTP GET, PUT, DELETE etc.) on which **Resources**.

#### Roles

Roles are a Kubernetes object and have defined rules for which `resources` are included and the `verbs` that the Role can perform on those resources, within a Namespace.

#### Role Binding

This specifies the users or `subjects` and the Role reference that they have.

#### Cluster Roles and Cluster Role Bindings

These are the same as Roles and Role Bindings except that they are not restricted to a specific Namespace.

To avoid duplication of Roles, you can define a Cluster Roles but then attach them to users via a (Namespace scoped) Role Binding.

### Admission Control

This applies after a request to the API server has been both Authenticated and Authorised. It's job is to make sure policy and standards are enforced, this could be labels are added etc.

There are two types:

- **Mutating**, these let you modify requests.
- **Validating**, these no not let you modify requests.

They are applied at the end of the admission process and if there are multiple, you have to get past all of them for the request to be permitted.
