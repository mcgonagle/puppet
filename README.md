# CloudBees Puppet Install
1. sudo yum install -y puppet git
2. cd /etc/
3. sudo rm -rf puppet
4. sudo git clone https://github.com/mcgonagle/puppet.git
7. edit node defninition in /etc/puppet/manifest.conf to match hostname of host
8. sudo puppet apply --verbose --debug --modulepath=/etc/puppet/modules /etc/puppet/manifest.conf

***

Puppet Lab's Beginner's Guide to Modules


https://docs.puppetlabs.com/guides/module_guides/bgtm.html

