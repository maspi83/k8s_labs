# Commands
```
kubectl run nginx --image=nginx
kubectl run nginx --image=nginx --dry-run=client -o yaml
kubectl create deployment --image=nginx nginx
kubectl create deployment nginx --image=nginx --replicas=4
kubectl scale deployment nginx --replicas=4 
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml
kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml
kubectl create svc nodeport webapp-service --node-port=30080 --tcp=8080:8080 --dry-run=client -o yaml
```