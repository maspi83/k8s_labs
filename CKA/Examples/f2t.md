```
# Q1: Create nginx pod called nginx image nginx port 80
kubectl run nginx --image=nginx --restart=Never --port80

# Q2: get list of all pods from all namespace and write to
kubectl get po -A > /tmp/dummy

# Q3: list all PV based on capacity to
kubectl get pv --sort-by=.spec.capacity.storage > /tmp/dummy

# Q4: Check list of image version without the describe command
kubectl get pod POD_NAME -o yaml 

# Q5: Switch to context kubectl config use-context wk8s
ssh
sudo -i 
systemctl status kubelet
systemctl start kubelet
systemctl enable kubelet

# Q6: Create a initcontainer which creates a dummy file if this is created then start container
volumes:
    -name: workdir
     emptyDir:
containers:
    command: ["/bin/sh","-c","if [ -f /tmp/dummy]; then sleep 100; else exit; fi "]
initContainers:
    command: ["/bin/sh","-c","touch /tmp/dummy"]

# Q7: Setup cluster from scratch

# Q8: create pod in new ns
kubectl create ns web
kubectl run nginx --image=nginx -n web

# Q9: create secret
kubectl create secret generic super --from-literal=password=dummy
volumeMounts:
- name: foo
  mountPath: "/secrets"
volumes:
- name: foo
  secret:
    secretName: super

# Q10: create multicontainer pod
kubectl run kcmulti --image=nginx --dry-run=client -o yaml >kcmulti.yaml
Edit and append

# Q11: create etcd backup
ETCDCTL_API=3 etcdctl --endpoints= --cacert= --key= --cert snapshot save .../bla

# Q12: create two containers with labels
use  --labels=env=omg
kubectl get po --show-lables
kubectl get po -l end=omg

# Q13: Create pod that does echo "Ahoj pako" and exists
kubectl run dummy --image=busybox --command -- bin/sh -c "Ahoj pako" --restart=Never --rm -it

# Q14: Get podPI
kubectl get po -o yaml | grep  

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 

# Q1: 
```