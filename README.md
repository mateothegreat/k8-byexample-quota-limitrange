# Quota & LimitRange

> k8 by example

[![Clickity click](https://img.shields.io/badge/matthewdavis.io-k8%20by%examples-ff69b4.svg?style=flat-square)](https://k8.matthewdavis.io)
[![Twitter Follow](https://img.shields.io/twitter/follow/yomateod.svg?label=Follow&style=flat-square)](https://twitter.com/yomateod) [![Skype Contact](https://img.shields.io/badge/skype%20id-appsoa-blue.svg?style=flat-square)](skype:appsoa?chat)

```bash
yomateod@proliant:/workspace/k8/kubernetes-quota$ make install

kubectl apply --namespace default -f quota.yaml
resourcequota "quota" created

kubectl apply --namespace default -f limits.yaml
limitrange "default-limits" created
```

```bash
yomateod@proliant:/workspace/k8/kubernetes-quota$ make delete

kubectl delete --ignore-not-found --namespace default -f quota.yaml
resourcequota "quota" deleted

kubectl delete --ignore-not-found --namespace default -f limits.yaml
limitrange "default-limits" deleted
```

```bash
yomateod@proliant:/workspace/k8/kubernetes-quota$ make get

> kubectl describe --namespace default quota

    Name:                   quota
    Namespace:              default
    Resource                Used  Hard
    --------                ----  ----
    limits.cpu              1     16
    limits.memory           0     64Gi
    persistentvolumeclaims  0     5
    pods                    8     20
    replicationcontrollers  0     20
    requests.cpu            800m  8
    requests.memory         0     32Gi
    services                5     20
    services.loadbalancers  3     5

> kubectl describe --namespace default limits

    Name:       default-limits
    Namespace:  default
    Type        Resource  Min  Max  Default Request  Default Limit  Max Limit/Request Ratio
    ----        --------  ---  ---  ---------------  -------------  -----------------------
    Container   cpu       -    -    100m             200m           -
    Container   memory    -    -    256Mi            512Mi          -


    Name:       limits
    Namespace:  default
    Type        Resource  Min  Max  Default Request  Default Limit  Max Limit/Request Ratio
    ----        --------  ---  ---  ---------------  -------------  -----------------------
    Container   cpu       -    -    100m             -              -
```

## Resources

* https://kubernetes.io/docs/user-guide/compute-resources/
