```
kubectl create role developer --verb=get,watch,list,create,delete --resource=pods
kubectl create rolebinding dev-user-binding --role=developer --user=dev-developer
kubectl auth can-i get pod --as dev-user
kubectl edit role -n blue developer 

kubectl create clusterrole node-admin --verb=get,watch,list,create,delete --resource=nodes
kubectl create clusterrolebinding michelle-binding --clusterrole=node-admin --user=michelle

kubectl api-resources 
kubectl api-resources -o wide | grep persistentvolume
kubectl auth can-i list storageclasses --as michelle
```