## VIMRC
```
# version 1
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab number ruler autoindent smartindent
syntax enable
filetype plugin indent on


# version 2
set ts=2
set sts=2
set sw=2
set expandtab
syntax on
filetype indent plugin on
set ruler

# version 3
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

# smart paste
set paste

# show hidden tabs
set list

# fix tabs 
retab

# VIM Smart
V or shift+v

# insert content from command
: read !base64 certificate
```
## kubectl
```
source<(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
alias kns="kubectl config set-context --current --namespace"
export DR=" --dry-run=client -o yaml"
```
