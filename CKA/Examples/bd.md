```
# Q1: Create pod nginx in NS dev
kubectl create namespace dev
kubectl run nginx --image=nginx --restart=Kever -n dev

# Q2: Create pod and inject values from keyvals
kubectl run nginx --image=nginx --restart=Alwayus --dry-run=client =o yaml > nginx_pod.yaml
check docu TASKS --> Configure pods and containers --> Configure pod configmap --> configMapRef
kubectl exec -it nginx -- env

# Q3: Create config.txt with two values defined and create configmap from it
vi or EOF
kubectl create cm cfg --from-file=config.txt

# Q4: create CM from vals appname=demo
kubectl create cm dummy --from-literal=appname=demo

# Q5: list all CM,SECRETS from all NS to file
kubectl get cm,secrets A > /tmp/listing.txt

# Q6: list PV by size
kubecctl get pv --sort-by=.spec.capacity.storage > /tmp/pv_sort.txt
check docu REFERENCE --> Command line tool --> kubectl cheat sheet

# Q7: create nginx with port 80 and PVC task-pv-claim
check docu CONCEPTS --> Services, load balancing --> Connecting application with services
check docu TASKS --> Configure pods and containers --> configure a pod to use a PVC for storage

# Q8: create PV task-vol 10Gi RWM, SC: Manual, /mnt/data and PVC with 3GB and RWM
check docu TASKS --> Configure pods and containers --> configure a pod to use a PVC for storage

# Q9: delete redis pod, and check file exists
kubectl delete pod redis
kubectl create -f redis.yaml
kubectl exec -it redis /bin/sh "cat /data/file.txt"

# Q10: Create a pod redis with with volume at /data/redis
containerPort + 
check docu Concepts --> Storage --> volumes check emptyDir

# Q11: del pvc, pv and check
kubectl delete pvc 
kubectl delete pv
kubectl get pv,pvc

# Q12: Create PVC
check docu TASKS --> Configure pods and containers --> configure a pod to use a PVC for storage

# Q13: Mount a CM and use as env
  volumes:
    - name: config-volume
      configMap:
        name: special-config

      env:
        - name: SPECIAL_LEVEL_KEY  

# Q14: create DaemonSet
Use kubectl create deployment --dry-run=client -o yaml > ds.yaml and change Deployment with DaemonSet

# Q15: Create jobs

# Q16: list endpoints from svc dummy

kubectl describe svc dummy | grep Endpoints > /tmp/svc_dummy
or
kubectl get endpoints dummy > /tmp/svc_dummy

# Q17: export deployment port

kubectl expose deployment redis --type use autocomplete from kubectl 
--port, --target-port

# Q18: notReady node
check kubelet / docker and start processin with systemctl

# Q19: Drain, cordon, and diffs

# 20: static pods
check /var/lib/kubelet/config.yaml and check for staticPodPath and put there the yaml

```