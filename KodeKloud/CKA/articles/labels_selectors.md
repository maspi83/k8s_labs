### matchLabels, labels, and selectors explained in detail, for beginners
https://medium.com/@zwhitchcox/matchlabels-labels-and-selectors-explained-in-detail-for-beginners-d421bdd05362

```
kind: Deployment
...
metadata:
  name: nginx
  labels:
    app: nginx
    tier: backend
spec:
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
        tier: backend
...
```
Delete that deployment, you would say kubectl delete -l app=nginx,tier=backend. 

metadata.labels from deployment matches to template (podtemplate), this needs to match, so number of defined replicas affects existing pods

select.matchLabels is like to match svc
```
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  type: LoadBalancer
  ports:
    - port:  80
  selector:
    app: nginx
    tier: frontend
```