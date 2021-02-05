Vagrant.configure("2") do |config|
  #Start serverA
  config.vm.define "serverA" do |serverA|
    serverA.vm.box = "centos/7"
    serverA.vm.network "forwarded_port", guest: 8080, host: 4410
    serverA.vm.network "forwarded_port", guest: 8081, host: 4411
    serverA.vm.network "forwarded_port", guest: 9090, host: 9090
    serverA.vm.network "private_network", ip: "172.16.1.11"
    serverA.vm.hostname = "serverA"
    serverA.vm.provision "shell", inline: "sudo /vagrant/files/bootstrap.sh > /dev/null"
  end
  #End serverA
  #Start serverB
  config.vm.define "serverB" do |serverB|
    serverB.vm.box = "centos/7"
    serverB.vm.network "forwarded_port", guest: 8080, host: 4420
    serverB.vm.network "forwarded_port", guest: 8081, host: 4421
    serverB.vm.network "private_network", ip: "172.16.1.12"
    serverB.vm.hostname = "serverB"
    serverB.vm.provision "shell", inline: "sudo /vagrant/files/bootstrap.sh > /dev/null"
  end
  #End serverB
  #Start serverC
  config.vm.define "serverC" do |serverC|
    serverC.vm.box = "centos/7"
    serverC.vm.network "forwarded_port", guest: 8080, host: 4430
    serverC.vm.network "forwarded_port", guest: 8081, host: 4431
    serverC.vm.network "private_network", ip: "172.16.1.13"
    serverC.vm.hostname = "serverC"
    serverC.vm.provision "shell", inline: "sudo /vagrant/files/bootstrap.sh > /dev/null"
  end
  #End serverC
  ##Start serverN
  #config.vm.define "serverN" do |serverN|
    #serverN.vm.box = "centos/7"
    #serverN.vm.network "forwarded_port", guest: 8080, host: 44N0
    #serverN.vm.network "forwarded_port", guest: 8081, host: 44N1
    #serverN.vm.network "forwarded_port", guest: 8500, host: 450N
    #serverN.vm.network "private_network", ip: "172.16.1.1N"
    #serverN.vm.hostname = "serverN"
    #serverN.vm.provision "shell", inline: "sudo /vagrant/files/bootstrap.sh > /dev/null"
  #end
  ##End serverN
end
#End Vagrant.configure
