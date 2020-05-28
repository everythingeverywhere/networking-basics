# networking-basics
Understanding Linux networking helps to understand how containers talk to each other, this repo is a summary of the steps to create 2 namespaces and connect them with a bridge

# First clone this repo if you want to run the script to create vm's on your machine

git clone https://github.com/everythingeverywhere/networking-basics.git 

# Create a Linux VM if you don't have one
sh create-vm.sh

> You will be in the VM to exit type `exit`

# clone this repo to have it on the vm

git clone https://github.com/everythingeverywhere/networking-basics.git && cd networking-basics

# Create the all from blog
sh create-net.sh