## kubectl .bashrc
```
# mandatory
source /usr/share/bash-completion/bash_completion
source<(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# optional
alias ktest="kubectl --dry-run=client -o yaml"
alias kns="kubectl config set-context --current --namespace"
export DR=" --dry-run=client -o yaml"
```

## vimrc
set ts=2 sw=2 sts=2 et ai ruler nu
syntax on

## imperative commands
```
# use -o yaml --dry-run=client if you want to generate just yaml
# setup .bashrc for auto-completion
# master using kubectl explain, k explain rs.kind --recursive
```

## Switching between NS and contexts
```
kubectl config get-contexts
kubectl config use-context NAME

kubectl get ns
kubectl config set-context --current --namespace   
kubectl config use-context onprem_uat_dc
```