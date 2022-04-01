[freach__kubernetes-security-best-practice](https://github.com/freach/kubernetes-security-best-practice)

```
Port 	Process 	Description
4149/TCP 	kubelet 	Default cAdvisor port used to query container metrics
10250/TCP 	kubelet 	API which allows full node access
10255/TCP 	kubelet 	Unauthenticated read-only port, allowing access to node state
10256/TCP 	kube-proxy 	Health check server for Kube Proxy
9099/TCP 	calico-felix 	Health check server for Calico (if using Calico/Canal)
6443/TCP 	kube-apiserver 	Kubernetes API port
```