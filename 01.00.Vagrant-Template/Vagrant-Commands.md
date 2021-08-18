# Vagrant Commands explained

1. Environment: In the Project Directory with the Vagrantfile (that is the one most often modified) is the environment where commands can be executed. For example:

 ```bash
 vagrant status /if-name/
 ```

- vagrant -> is the name of the tool
- status -> command listing the status of the VMs in the environment
- /**$if$-name**/ -> pseudo example of **regular expression** specifying a name of a particular pre-defined VM $if specified at all. By default it brings the status of all machines
- !NS! vagrant can use reg-exp to select VMs

2. Load Order and Merging:
Vagrant actually loads a series of Vagrantfiles, merging the settings as it goes. This allows Vagrantfiles of varying level of specificity to override prior settings. Vagrantfiles are loaded in the order shown below. Note that if a Vagrantfile is not found at any step, Vagrant continues with the next step.
   1. Vagrantfile packaged with the box that is to be used for a given machine.
   2. Vagrantfile in your Vagrant home directory (defaults to ~/.vagrant.d)This lets you specify some defaults for your system user.
   3. Vagrantfile from the project directory. This is the Vagrantfile that you will be modifying most of the time.
   4. Multi-machine overrides if any.
   5. Provider-specific overrides, if any.

At each level, settings set will be merged with previous values. What this exactly means depends on the setting. For most settings, this means that the newer setting overrides the older one.

*Example:*

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "bionic64"

  config.vm.provider "vmware_fusion" do |v, override|
    override.vm.box = "bionic64_fusion"
  end
end
```

In the above case, Vagrant will use the "bionic64" box by default, but will use "bionic64_fusion" if the VMware Fusion provider is used.

 NB! The Vagrant Way:
 The proper "Vagrant way" is to avoid any provider-specific overrides if possible by making boxes for multiple providers that are as identical as possible, since box names can map to multiple providers. However, this is not always possible, and in those cases, overrides are available.

**However, for things such as defining networks**, the networks are actually appended to each other.

**By default, you should assume that settings will override each other. If the behavior is different, it will be noted in the relevant documentation section.**

Within each Vagrantfile, you may specify multiple Vagrant.configure blocks. All configurations will be merged within a single Vagrantfile in the order they're defined.

3. When it comes to multiple machines:

And importantly, you can continue to use the config object as well. The configuration object is loaded and merged before the machine-specific configuration, just like other Vagrantfiles within the Vagrantfile load order.

4. Other important information sections (vagrantup.com):
 - Providers > Configuration:
 Config; Portability; Provider Configuration
 - Multi-Machine