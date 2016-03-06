# == Class: cje::params
# Full description of class cje here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cje:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Thomas A. McGonagle <tmcgonagle@cloudbees.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class cje::params {
    $install_version = 'installed' 
    $install_baseurl = "http://nectar-downloads.cloudbees.com/jenkins-enterprise/1.642/rpm"
    $install_gpgkey = "http://nectar-downloads.cloudbees.com/jenkins-enterprise/1.642/rpm/cloudbees.com.key"
    $service_enable = 'true'
    $service_ensure = 'running'
    $service_hasstatus = 'true'
    $service_hasrestart = 'true'
    $libdir = '/usr/lib/jenkins'

}
