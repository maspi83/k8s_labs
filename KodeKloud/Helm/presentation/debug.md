# How to debug
```
helm install hello-world ./nginx-example --dry-run
helm lint ./nginx-example 
helm template ./nginx-example or helm template ./nginx-example --debug 
```