# Class: newrelic::service
#
# This module manages the New Relic server monitoring service
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
class newrelic::service {
  service { "newrelic-sysmond":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}