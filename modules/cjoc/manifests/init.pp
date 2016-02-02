# == Class: cjoc
#
# Full description of class cjoc here.
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
class cjoc (
  $install_version = $cjoc::params::install_version,
  $install_baseurl = $cjoc::params::install_baseurl,
  $install_gpgkey = $cjoc::params::install_gpgkey,
  $service_enable = $cjoc::params::service_enable,
  $service_ensure = $cjoc::params::service_ensure,
  $service_hasstatus = $cjoc::params::service_hasstatus,
  $service_hasrestart = $cjoc::params::service_hasrestart) inherits cjoc::params {

  # for debug output on the puppet master
  notice("Running inside cjoc ")
  # for debug output on the puppet client
  notify {"Running inside cjoc ": }

  class { cjoc::install: }
  class { cjoc::config: }
  class { cjoc::service: }

  Class['cjoc::install'] -> Class['cjoc::config'] -> Class['cjoc::service']

}
