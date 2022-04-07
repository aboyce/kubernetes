## Labels

Labels are key/value pairs that attach to objects. They are intended to be used to specify identifying attributes that are meaningful and relevant to users. They can be added at creation time or added and modified at any other time.

Each key must be unique for a given object.

Labels do no provide uniqueness, it is expected that many objects carry the same labels.

## Selectors

There are two types of label selectors:

- equality-based
- set-based

A label selector can be made of multiple requirements which are comma-separated. A comma-separated example could be:

```
environment!=test,tier=database
```

They can be used with `kubectl` via a `-l` flag, e.g. `kubectl get pods -l environment=development`.

### Equality-based

Matching objects must satisfy all of the specified label constraints, though they may have additional labels as well.

- `=` - selects resources that have the key along with the specified value
- `==` - same as `=`
- `!=` - selects the resources that either do not have the key, or have the key with a different value

### Set-based

Allows filtering keys according to a set of values.

- `in` - `tier in (ui, api)`
- `notin` - `tier notin (api, database)` and all resources with no labels with the `tier` key
- `exists` - `production` all resources with the label `production`, no values are checked
- `!exists` - `!production` all resources without a label `production`, no values are checked

## Annotations

Similar to labels although you cannot use selectors, they are used for arbitrary non-identifying metadata. They can be used by tools and libraries.

The metadata in annotations can be of any size, does not have to be structured, and is more lenient on what characters can be used than labels allows.

An example with labels and annotations:

```yaml
metadata:
  name: my-label
  labels:
    label1: value1
    label2: value1
  annotations:
    annotation1: value1
    annotation2: value2
```
