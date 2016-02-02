# == Class: java::oracle
#
# Full description of class java::oracle here.
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
class java::oracle inherits java {
  # for debug output on the puppet master
  notice("Running inside java::oracle ")
  # for debug output on the puppet client
  notify {"Running inside java::oracle ": }

    # Downloading JDK...
    exec { 'oracle-jdk-download':
	command => "/usr/bin/wget -v --no-check-certificate --no-cookies --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie' ${oracle_java_url}",
	creates => "${oracle_dependencies_dir}/${oracle_java_installer}",
	require => Package["wget"],
	cwd => "${oracle_dependencies_dir}",
    }
	
    # Installing JDK
    exec { "install-oracle-jdk":
	command => "/usr/bin/tar xvfz ${oracle_java_installer}",
	cwd => ${oracle_dependencies_dir}, 
        creates  => "${oracle_dependencies_dir}/${oracle_creates_dir}",
	timeout => 0,
	require => Exec["oracle-jdk-download"],
	logoutput => "on_failure",
    }  	

    # setting up alternatives 
    exec { "linking-alternatives-java":
	command => "/usr/sbin/alternatives --install /usr/bin/java java ${oracle_dependencies_dir}/${oracle_creates_dir}/bin/java 1",
	cwd => "${oracle_dependencies_dir}, 
        unless  => "/usr/bin/test $(/usr/bin/readlink -e /etc/alternatives/java) = ${oracle_dependencies_dir}/${oracle_creates_dir}/bin/java",
	timeout => 0,
	require => Exec["install-oracle-jdk"],
	logoutput => "on_failure",
    }  	

    exec { "linking-alternatives-jar":
	command => "/usr/sbin/alternatives --install /usr/bin/jar jar ${oracle_dependencies_dir}/${oracle_creates_dir}/bin/jar 1",
	cwd => "${oracle_dependencies_dir}, 
        unless  => "/usr/bin/test $(/usr/bin/readlink -e /etc/alternatives/jar) = ${oracle_dependencies_dir}/${oracle_creates_dir}/bin/jar",
	timeout => 0,
	require => Exec["install-oracle-jdk"],
	logoutput => "on_failure",
    }  	

}
