
Vagrant.configure("2") do |config|
  config.vm.define "dd" do |dd|
    dd.vm.box = "VProfirov/CentOS-Stream-08-customized"
    dd.vm.hostname = "db.dob.lab"
    dd.vm.network "private_network", ip: "192.168.98.202"
  end
end