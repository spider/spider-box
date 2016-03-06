# spider-box 

A vagrant box (created by [Puphpet.com](https://puphpet.com/)) to get up a running fast for developing [Spider](https://github.com/spider/spider) and working with [Neo4j](http://neo4j.com/) or [OrientDB](http://orientdb.com/) Graph databases

###What Do You Get?


spider-box installs the following software automatically on the guest VM.

- Neo4j 2.3.2
- OrientDB 2.1.12
- Gremlin Server 3.1.1
- PHP5.6 (PHP-FPM and CLI)
- Ubuntu 14.04 64bit
- Oracle Java 1.8
- Xdebug
- Nginx
- Composer (globally)
- PHPUnit (globally)
- Git

and the standard packages for Ubuntu.

###Installation Instructions

**Prerequisites**

You must have a virtualization system like [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) installed.

**Steps**

Clone or download this repo as a ZIP file on your host machine. If you used the zip, unpack the files in a directory of your choice. Remember, the directory you unpack to will also be the shared directory with the vagrant box it creates.

Once downloaded or cloned, go into the console on the host machine (or with Git Bash) and `cd` into the directory, where the `Vagrantfile` is located. Then simply enter 

`vagrant up`

**Note:** It will take approximately 15 minutes for the VM to install and initialize. 

Once you get the Puphpet "finished" screen in your console, you can log into the VM via SSH. Before that though, you'll need to set up your SSH client to read the private key, which was set up for you automatically. You can find the keys under 

`/vagrant/files/dot/ssh`

The user you'll be using is "root". 

The server can be found under the IP address `192.168.33.10`. 

For those developing for Spider, once in `spider-box` (the guest VM), you can now clone the Spider repo of choice and start working on it. The shared folder is under `/var/www/spider`.

**Working with the Graph Databases**

If you want to use the web clients for Neo4j or OrientDB, you can do that too. 

**OrientDB:** http://192.168.33.10:2480

**Neo4j:** http://192.168.33.10:7474

Also under '/home/vagrant/` you'll find the install directories of the two databases. Their respective consoles are available there.

###Other Considerations and Options

**Other providers**(currently untested!)

VirtualBox is currently the standard virtualization system for the Guest VM. If you have a different System `spider-box` supports both Parallels and VMWare Fusion. To use these, enter the `--provider`flag, when you use `vagrant up`, like this.

`vagrant up --provider parallels`

**.sh Script Files and Other File Locations**

All the initialization and startup files are located under `/puphet/files`. The initialization files are under `/exec-once`and the startup files are under `/startup-once`. If you'd like to add to these files, you may, but at your own risk.

**Custom Configuration of the Vagrant Box**

You can also customize the box too, if you'd like. Under `/puphpet` copy the `config.yaml`file and rename it to `config-custom.yaml` and save it in the same place. Make any changes you'd like in that file. There are also more possibilities to customize the `spider-box` through the tools made available by Puphpet. To read more about that visit the [Puphpet website](https://puphpet.com/) (click on "Help!").

**Host File Changes**

If you want, you can also change your host file on the host machine, so you can access the `spider-box`via a normal URL like `http://www.spider-box.dev`. Search for your `hosts`file and save the following.

`192.168.33.10 spider-box.dev www.spider-box.dev`

Happy programming!
