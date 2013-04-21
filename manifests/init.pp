# Class: newrelic
#
# This module manages New Relic.
#
# Parameters:
#
#   [*license_key*] - New relic license key to use
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include newrelic
# }
class newrelic (
  $license_key = undef
) {
  class { 'newrelic::package':
    notify => Class['newrelic::service'],
  }

  class { 'newrelic::config':
    license_key => $license_key,
    require     => Class['newrelic::package'],
    notify      => Class['newrelic::service'],
  }

  class { 'newrelic::service': }
}