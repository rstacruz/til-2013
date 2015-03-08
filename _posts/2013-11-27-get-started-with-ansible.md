---
title: Get started with Ansible in 2 minutes
tags: [Development]
description: Provisioning servers is easy using Ansible. Here's a guide to set it up from scratch.
---

[Ansible](http://ansible.com) is a fantastic tool for provisioning servers. I personally prefer it over Chef, Puppet and Salt. Here's how to get an Ansible project started.
{:.brief-intro.center}

----

### Install Ansible
Officially available via `pip`.

~~~ sh
brew install ansible            # OSX
[sudo] pip install ansible      # elsewhere
~~~
{:.terminal}

### Start your project
Make the directory. Put this under version control, preferrably.

~~~ sh
~$ mkdir setup
~$ cd setup
~~~

### Create an inventory file
This is a list of hosts you want to manage, grouped into groups. (Hint: try
using 127.0.0.1 to deploy to your local machine)

~~~ dosini
# ~/setup/hosts

[sites]
127.0.0.1
192.168.0.1
192.168.0.2
192.168.0.3
~~~

### Create your first Playbook
A playbook is just a YAML file.

~~~ yaml
# ~/setup/playbook.yml

- hosts: 127.0.0.1
  user: root
  tasks:
    - name: install nginx
      apt: pkg=nginx state=present

    - name: start nginx every bootup
      service: name=nginx state=started enabled=yes

    - name: do something in the shell
      shell: echo hello > /tmp/abc.txt

    - name: install bundler
      gem: name=bundler state=latest
~~~

### Run it
Use the `ansible-playbook` command.

~~~ sh
~/setup$ ls
hosts
playbook.yml
~~~

~~~ sh
~/setup$ ansible-playbook -i hosts playbook.yml
PLAY [all] ********************************************************************

GATHERING FACTS ***************************************************************
ok: [127.0.0.1]

TASK: [install nginx] *********************************************************
ok: [127.0.0.1]

TASK: [start nginx every bootup] **********************************************
ok: [127.0.0.1]
...
~~~

----

### Further reading

Ansible's source is available via GitHub: [ansible/ansible](https://github.com/ansible/ansible).

* [Getting Started With Ansible](http://lowendbox.com/blog/getting-started-with-ansible/) (lowendbox.com)
* [Ansible Documentation](http://docs.ansible.com/modules.html) (ansible.com)
