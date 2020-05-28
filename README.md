# networking-basics
Understanding Linux networking helps to understand how containers talk to each other, this repo is a summary of the steps to create 2 namespaces and connect them with a bridge

# Create a Linux VM if you don't have one
sh create-vm.sh

> You will be in the VM to exit type `exit`

# clone this repo to have it on the vm

git clone https://github.com/everythingeverywhere/networking-basics.git && cd networking-basics

# Create the all from blog
sh create-net.sh
---
## Ready for the results
# Try pinging  pb’s ip 192.168.0.56 from the jelly namespace
sudo ip netns exec jelly ping 192.168.0.56
# If you check the routes on your machine the bridge is now visible to the host
ip route