# To see the interfaces on your device enter
ip link list
# Let’s create a two network namespaces pb and jelly
sudo ip netns add pb
sudo ip netns add jelly
# Once they are added you can view them with 
ip netns list
# To create both veth pair use the command:
sudo ip link add veth-pb type veth peer name bread-pb-veth
sudo ip link add veth-jelly type veth peer name bread-j-veth
# Taking a look at the devices you will see the pair veth-bread1 and veth-bread2 on the host network.
ip link list
#Now, that we have a veth pair in the host namespace, lets move the cable out into the jelly and pb namespace.
sudo ip link set veth-pb netns pb
sudo ip link set veth-jelly netns jelly 
# To see the ends of the cable you created, run the ip link command within the namespaces.
sudo ip netns exec jelly ip link
sudo ip netns exec pb ip link
# To create an ip address for the jelly namespace with the ip address add command for the device jelly:
sudo ip netns exec jelly \
ip address add 192.168.0.55/24 dev veth-jelly

sudo ip netns exec jelly \
ip link set veth-jelly up
# Similarly, assign an address to pb as well
sudo ip netns exec pb \
ip address add 192.168.0.56/24 dev veth-pb

sudo ip netns exec pb \
ip link set veth-pb up

# Check the interfaces in the namespaces to check if they are correct with the next command.
sudo ip netns exec jelly \
ip addr
sudo ip netns exec pb \
ip addr
# Create your bridge, I called mine brd1 for bread that is needed for the sandwich
sudo ip link add name brd1 type bridge
# set the interface
sudo ip link set brd1 up
#To check if the device was created 
ip link
#With your bridge device set it's time to connect the bridge side of the veth cable to the bridge
sudo ip link set bread-pb-veth up
sudo ip link set bread-j-veth up
# You can add the bread veth interfaces to the bridge by setting the bridge device as their master.
sudo ip link set bread-pb-veth master brd1
sudo ip link set bread-j-veth master brd1
# To verify
bridge link show brd1

