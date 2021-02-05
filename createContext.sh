# show the configuration
kubectl config view

# show the current context
kubectl config current-context

# create a new context
kubectl config set-context [NAME] --namespace=[NAMESPACE] --cluster=[CLUSTER] --user=admin

# view the contexts
kubectl config view

# swap context
kubectl config use-context [NAME]

# veridy your current context
kubectl config current-context

# at this point, all requests made to the cluster are scoped to the correct namespace
