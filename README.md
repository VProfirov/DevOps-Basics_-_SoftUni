# DevOps-Basics_-_SoftUni

## Well Documented config files. Vagrantfile and other

1. Universally well structured with docs:
 <br>1.1. Avg Vagrantfile --> 03.01.HW-docker-CentOS/Vagrantfile AND --> 00.TEMP.vagrantBox-Ubuntu/Vagranfile **(mind the forwarding of ports)**

 <p> <strong>NOTE:</strong> look at the ports that are forwarded for different uses. You may need multiple, but before assigning some make sure they are not assigned to priority services that are used or will be. (ref. 02.01.HW-docker-CentOS)</p>
 <p><strong>NB:</strong> provisioning can be done from a file, inline or a few other ways. Keep in mind pro's and cons during init & sec:</p>

2. Study template files:
 <br>2.2. **Wiki Types** --> 01.00.study-wiki.Vagrant-Template
 <br>2.3. Primary Vagrantbox initialization types --> 00.01.Vagrant_VirtualBoxes_Updates-CentOS

 <p> <strong>NOTE:</strong> This is a thing as some ssh connection initialization among other configs should be set and it is needed only once. At most if the box is updated in a way that the updated box will be initialized and not updating an already running one.(check "vagrant box updating" on a later stage, again)</p>

<hr></hr>
 <em><strong>FOOTNOTE:</strong> This is a WIP-README.md</em>
