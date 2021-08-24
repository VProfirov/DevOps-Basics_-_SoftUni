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
   </br>==> within the Vagrantfile accumulated specifications ==></br>
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

 - Defining Multiple Machines:
Multiple machines are defined within the same project Vagrantfile using the config.vm.define method call. This configuration directive is a little funny, because it creates a Vagrant configuration within a configuration. An example shows this best:

```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "web" do |web|
    web.vm.box = "apache"
  end

  config.vm.define "db" do |db|
    db.vm.box = "mysql"
  end
end
```

As you can see, config.vm.define takes a block with another variable. This variable, such as web above, is the exact same as the config variable, except any configuration of the inner variable applies only to the machine being defined. Therefore, any configuration on web will only affect the web machine.

- Specifying a Primary Machine

You can also specify a primary machine. The primary machine will be the default machine used when a specific machine in a multi-machine environment is not specified.

To specify a default machine, just mark it primary when defining it. Only one primary machine may be specified.

```
config.vm.define "web", primary: true do |web|
  # ...
end
```

- Autostart Machines

By default in a multi-machine environment, vagrant up will start all of the defined machines. The autostart setting allows you to tell Vagrant to not start specific machines. Example:

```
config.vm.define "web"
config.vm.define "db"
config.vm.define "db_follower", autostart: false
```

When running vagrant up with the settings above, Vagrant will automatically start the "web" and "db" machines, but will not start the "db_follower" machine. You can manually force the "db_follower" machine to start by running vagrant up db_follower.

4. Loop Over VM Definitions
If you want to apply a slightly different configuration to many multi-machine machines, you can use a loop to do this. For example, if you wanted to create three machines:

```bash
(1..3).each do |i|
  config.vm.define "node-#{i}" do |node|
    node.vm.provision "shell",
      inline: "echo hello from node #{i}"
  end
end
```

5. Other important information sections (vagrantup.com):
 - Providers > Configuration:
 Config; Portability; Provider Configuration
 - Multi-Machine