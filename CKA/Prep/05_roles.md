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

kubectl auth can-i get po --as john -n development
yes

kubectl get po --as john
Error from server (Forbidden): pods is forbidden: User "john" cannot list resource "pods" in API group "" in the namespace "default"

kubectl get po --as john -n development
No resources found in development namespace.
```