## kubectl .bashrc
```
source /usr/share/bash-completion/bash_completion
source<(kubectl completion bash)
alias k=kubectl
alias ktest="kubectl --dry-run=client -o yaml"
complete -F __start_kubectl k ktest
alias kns="kubectl config set-context --current --namespace"
export DR=" --dry-run=client -o yaml"
```

## vimrc
set ts=2 sw=2 sts=2 et ai ruler nu
syntax on
