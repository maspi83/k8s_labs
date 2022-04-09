```
# check deployments, replicas, change rollout, update, change updates
# for pod use --restart=Never
k scale rs new-replica-set --replicas=5
k get po --no-headers 

# start pod
k run nginx --image=nginx

# get image from pod
k get pod newpods-xzt6f -o jsonpath='{.spec.containers[].image}'
k describe pod newpods-xzt6f  | grep -i "image:"

# when working with multiple objects
k get pod -o jsonpath='{.items[*].spec.containers[].image}'

# you can only use -o json or -o yaml with get not with describe, jq or yq are also nice

# show where pods are deployed on 
kubectl get po -o wide

# fixing running pod, create -o yaml, then delete and -f apply new pod_file, you can use --force
k get pod redis -o yaml > pod_redis.yaml 

# Debuging pods, when checking issues check logs or describe pods (also from rs or deployments )

k get po -n testns

# update deployment
k get deployments.apps frontend -o yaml | grep -i image
k get deployments.apps frontend -o yaml | grep -i image


# CM
k create configmap webapp-color --from-literal=APP_COLOR=darkblue

# add sa
  serviceAccountName: build-robot
# sidecar


# run on a specific node with certain label
  nodeSelector:
    disktype: ssd
```