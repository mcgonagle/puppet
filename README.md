# CloudBees Puppet Install
1) sudo yum install -y puppet git
2) cd /etc/puppet
3) sudo rm -rf modules
4) sudo git clone https://github.com/mcgonagle/cloudbees_puppet_install.git
5) sudo mv cloudbees_puppet_install/* .
6) sudo rm -rf cloudbees_puppet_install
7) edit node defninition in /etc/puppet/manifest.conf 
8) sudo puppet apply --verbose --debug --modulepath=/etc/puppet/modules /etc/puppet/manifest.conf
