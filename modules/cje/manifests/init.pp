# == Class: cje
#
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
class cje (
  $install_version = $cje::params::install_version,
  $install_baseurl = $cje::params::install_baseurl,
  $install_gpgkey = $cje::params::install_gpgkey,
  $service_enable = $cje::params::service_enable,
  $service_ensure = $cje::params::service_ensure,
  $service_hasstatus = $cje::params::service_hasstatus,
  $service_hasrestart = $cje::params::service_hasrestart) inherits cje::params {

  # for debug output on the puppet master
  notice("Running inside cje ")

  # for debug output on the puppet client
  notify {"Running inside cje ": }
  class { cje::install: }
  class { cje::config: }
  class { cje::service: }

  Class['cje::install'] -> Class['cje::config'] -> Class['cje::service']

}
