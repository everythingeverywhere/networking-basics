# Networking basics 
Understanding Linux networking helps to understand how containers talk to each other, this repo is a summary of the steps to create 2 namespaces and connect them with a bridge, connecting the namespaces to the host maching and internet.

Create a Linux VM if you don't have Linux
```
sh create-vm.sh
```

> You will be in the VM to exit type `exit` if you need to get out

**Inside the VM**
Clone this repo to have it on the vm and cd into it to access the scripts
```
git clone https://github.com/everythingeverywhere/networking-basics.git && cd networking-basics
```
# Create the namespaces, veth's, and bridge from blog
sh create-net.sh

