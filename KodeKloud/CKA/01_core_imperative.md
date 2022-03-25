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

kubectl get po --show-labels | grep env=dev | wc -l
kubectl get po --selector bu=finance
kubectl get all --selector env=prod --no-headers
kubectl get po -A --selector tier=frontend,bu=finance

kubectl taint node node01 spray=mortein:NoSchedule
kubectl taint node controlplane node-role.kubernetes.io/master:NoSchedule-
kubectl get nodes -o jsonpath="{range .items[*]}{.metadata.name} {.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}"


kubectl label nodes node01 color=blue
kubectl describe nodes controlplane | grep -i taints
kubectl get po -o wide

kubectl edit pod <pod name>
kubectl delete pod webapp
kubectl create -f /tmp/kubectl-edit-ccvrq.yaml


kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml

kubectl explain pod --resursive | grep -i sched

root@node01:~# grep staticPodPath /var/lib/kubelet/config.yaml
staticPodPath: /etc/just-to-mess-with-you
```