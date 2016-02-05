# == Class: cje::cli::safe-restart
#
# Full description of class cje::cli::safe-restart here.
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
class cje::cli::safe-restart inherits cje::cli {
  # for debug output on the puppet master
  notice("Running inside cje::cli::safe-restart ")

  # for debug output on the puppet client
  notify {"Running inside cje::cli::safe-restart ": }

  include ::cje
  include cje::cli

  exec { 'safe-restart-jenkins' :
    command => "java -jar ${jar} -s http://localhost:${port} safe-restart",
    path    => ['/bin', '/usr/bin'],
    cwd     => '/tmp',
    logoutput => true,
  }

}
