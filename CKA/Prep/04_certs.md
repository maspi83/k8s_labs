```
kubectl get certificatesigningrequests.certificates.k8s.io 
kubectl certificate approve|deny akshay

https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/

: read !base64 certificate | tr -d '\n', format yaml and then use |  
cat dumy.csr | base64 | tr -d '\n'

```