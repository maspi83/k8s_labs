# Initial setup
```
curl -sL https://raw.githubusercontent.com/maspi83/k8s_labs/main/kodekloud/labs/dns_tester.sh | bash
```

# NodeLocal DNS
```
kubedns=kubectl get svc kube-dns -n kube-system -o jsonpath={.spec.clusterIP}
domain=cluster.local
localdns=10.96.0.10

sed -i -e 's/__PILLAR__DNS__DOMAIN__/cluster.local/g' -e 's/__PILLAR__DNS__SERVER__/10.96.0.10/g' nodelocaldns.yaml 
sed -i -e 's/__PILLAR__LOCAL__DNS__/169.254.20.10/g'  -e 's/__PILLAR__UPSTREAM__SERVERS__/10.96.0.10/g' nodelocaldns.yaml 
sed -i -e 's/__PILLAR__CLUSTER__DNS__/10.96.0.10/g' nodelocaldns.yaml
```
