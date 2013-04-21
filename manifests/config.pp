# Class: newrelic::config
#
# This module manages New Relic server monitoring module configuration
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
class newrelic::config (
  $license_key = undef
) {
  if ($license_key == undef) {
    fail('You must specify a license key')
  }

  file { '/etc/newrelic/nrsysmond.cfg':
    ensure  => file,
    owner   => 'root',
    group   => 'newrelic',
    mode    => '0640',
    content => template('newrelic/nrsysmond.cfg.erb')
  }
}