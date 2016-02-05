# == Class: cje::jobs::freestyle
#
# Full description of class cje::jobs::freestyle here.
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
define cje::jobs::freestyle($git_url, $scm_trigger_spec, $maven_targets) {
  # for debug output on the puppet master
  notice("Running inside cje::jobs::freestyle ")

  # for debug output on the puppet client
  notify {"Running inside cje::jobs::freestyle ": }

  file { "/var/lib/jenkins/jobs/${title}":
	ensure => directory,
    	owner  => 'jenkins',
    	group  => 'jenkins',
    	mode   => '0755',
  }

  file { "/var/lib/jenkins/jobs/${title}/config.xml":
	ensure => file,
	content => template('cje/jobs/freestyle_config_xml.erb'),
    	owner  => 'jenkins',
    	group  => 'jenkins',
    	mode   => '0644',
	require => File["/var/lib/jenkins/jobs/${title}"],
  }
}
