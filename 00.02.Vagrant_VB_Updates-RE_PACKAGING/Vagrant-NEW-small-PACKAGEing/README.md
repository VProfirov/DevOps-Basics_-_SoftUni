# Vagrant packaging situation

1.Note: there was problem with the GuestAdditions installation in the first place.

2.First run and run outside of a Vagrant managed directory (one without a Vagrantfile) will generate a vagrant_private_key

The first run is concerning the command: vagrant package --base VM_NAME --output VM_NAME.box
This is because the above mentioned command deals with packaging of a VM managed by VirtualBox (NOT BY Vagrant)
If the VM IS MANAGED by Vagrant then the vagrant_private_key is skipped in the packaging (probably the idea is of versioning - aka creating a newer version and the vagrant_private_key should be added in the Vagrantfile that uses the newer box-version)
