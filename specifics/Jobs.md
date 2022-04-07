## Jobs

Designed to reliably run a workload via a specified number of Pods and ensuring that they complete properly, this means that the Job itself has completed.

This can also be used if you need to ensure a single Pod has to run to completion.

The job will create one or more pods, when the job is finished, the container/s will exit and the pod/s will be in the Completed state.

To see the jobs, you can use `kubectl get job`, you can see the underlying pods as usual with `kubectl get pod`.
