```
# record changes for a specific change
kubectl edit --record


#SC 
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: local-storage
provisioner: kubernetes.io/no-provisioner
allowVolumeExpansion: true


# PV
apiVersion: v1
kind: PersistentVolume
metadata:
  name: host-storage-pv
spec:
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: local-storage
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/etc/data"

# PVC
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: host-storage-pvc
  namespace: auth
spec:
  storageClassName: local-storage
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi

# POD using PVC
apiVersion: v1
kind: Pod
metadata:
  name: task-pv-pod
  namespace: auth
spec:
  volumes:
    - name: storage
      persistentVolumeClaim:
        claimName: host-storage-pvc
  containers:
    - name: busybox
      image: busybox
      command: ['sh', '-c', 'while true; do echo success > /output/output.log; sleep 5; done']
      volumeMounts:
        - mountPath: "/output"
          name: storage

```