# Class: newrelic::package
#
# This module manages New Relic package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class newrelic::package {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  exec { 'newrelic.gpg':
    command => 'wget -O- http://download.newrelic.com/548C16BF.gpg | apt-key add -',
    unless  => 'apt-key list | grep -c 548C16BF',
  }

  exec { 'newrelic.list':
    command => "echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' >> /etc/apt/sources.list.d/newrelic.list && apt-get update",
    creates => '/etc/apt/sources.list.d/newrelic.list',
    require => Exec['newrelic.gpg']
  }

  package { 'newrelic-sysmond':
    ensure  => latest,
    require => Exec['newrelic.list'],
  }
}