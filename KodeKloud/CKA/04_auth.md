```
kubectl get csr -A
kubectl certificate approve akshay

kubectl create role developer --namespace=default --verb=list,create,delete --resource=pods
role.rbac.authorization.k8s.io/developer created
kubectl create rolebinding dev-user-binding --namespace=default --role=developer --user=dev-user
rolebinding.rbac.authorization.k8s.io/dev-user-binding created


kubectl create clusterrole pod-reader --verb=get,list,watch,create,delete --resource=nodes
kubectl create clusterrolebinding cr-pod-reader --clusterrole=pod-reader --user=michelle -o yaml

kubectl create  clusterrole storage-admin --verb=get,list,watch,create,delete --resource=persistentvolumes,storageclasses
kubectl create clusterrolebinding michelle-storage-admin --clusterrole=storage-admin --user=michell
kubectl auth can-i list storageclasses --as michelle


kubectl exec ubuntu-sleeper -- whoami

kubectl explain pod.spec --recursive
kubectl explain pod.spec.securityContext 
 Array [""] or newline -
```