# == Class: cje::nodes::slave
#
# Full description of class cje::nodes::slave here.
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
define cje::nodes::slave ($remotefs, $host, $port, $credentials) {
  # for debug output on the puppet master
  notice("Running inside cje::nodes::slave ")

  # for debug output on the puppet client
  notify {"Running inside cje::nodes::slave ": }

  file { "/var/lib/jenkins/nodes/${title}":
	ensure => directory,
    	owner  => 'jenkins',
    	group  => 'jenkins',
    	mode   => '0755',
  }

  file { "/var/lib/jenkins/nodes/$title/config.xml":
	ensure => file,
	content => template('cje/nodes/config_xml.erb'),
    	owner  => 'jenkins',
    	group  => 'jenkins',
    	mode   => '0644',
	require => File["/var/lib/jenkins/nodes/${title}"],
  }
}
