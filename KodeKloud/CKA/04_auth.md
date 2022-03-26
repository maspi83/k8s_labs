```
kubectl get csr -A
kubectl certificate approve akshay

kubectl create role developer --namespace=default --verb=list,create,delete --resource=pods
role.rbac.authorization.k8s.io/developer created
kubectl create rolebinding dev-user-binding --namespace=default --role=developer --user=dev-user
rolebinding.rbac.authorization.k8s.io/dev-user-binding created

```