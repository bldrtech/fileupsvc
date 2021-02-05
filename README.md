# fileupsvc
Vagrant/ansible/bash deployment for web filewcount (or other) web service
-----
This project represents basic configuration of a set of hosts to deliver a service with multi node fault tolerence fronted by nginx using the default provider "virualbox" on a host machine exposing those services locally for test.

Requirements:
* Vagrant
* ansible
* internet access (image pulling)

Run this project:

```
cd fileupsvc
./run.sh
```

### What happens? What should you expect (by default)?

1. Vagrant will install 3 virtual machines on your local system (A,B,C)
2. ansible will run the service, load balancer, and check status plays
3. The following interfaces will become available on the host OS:


Load balancer set A [ServiceVersionA] "1.0"  
(http://localhost:4410) and (http://localhost:4420) and (http://localhost:4430)

Load balancer set B [ServiceVersionB] "latest"  
(http://localhost:4411) and (http://localhost:4421) and (http://localhost:4431)

Presently 1.0 == latest  

### What are all those links? What do they mean?
Each load balancer set is like an edge device in a cloud provider. For testing purposes killing a service container would result in no interruption, but killing an entire host (and its load balancer) would lose a corresponding "local" interface. In practical scenario dns and a common service address/port address the concern.

### Usage and Upgrades:
Upgrade a service set (with new docker image tag env var):  
```ansible-playbook playbooks/runserviceB.yml -e svc_tag_B=2.0```  
OR replace the vars in hosts.ini to make it stick/default

List the running containers with version tag:  
```ansible-playbook playbooks/statuscheck.yml```

Cleanup/destroy the enviroment when done:  
```vagrant destroy```

### What next?
Extension assumes cookie cutter more nodes (limit on local host capacity) OR more groups/ports in docker space. See commented "serverN" and files/sites.cfg to scale up past 3 starter nodes.

Next revision could be more templates/groups/vars/options etc.   
Change out the svc_image variable to swap in another web service for test.




