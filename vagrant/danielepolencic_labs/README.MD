# Info  
This works out of the box, kudos to this guy: https://gist.github.com/danielepolencic/ef4ddb763fd9a18bf2f1eaaa2e337544  

# Prereq  
Install Virtualbox (free)  
Install Vagrant (free)  

# How to use  
## go to folder ( PS1 )  

```
vagrant up # create all stuff takes some minutes grab a beer
vagrant destroy -f # wipe all
vagrant halt # halt all
vagrant status # check status of all provisioned nodes
vagrant ssh $NODE # ssh login to.
```