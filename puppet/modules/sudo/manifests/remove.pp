# Class sudo::absent
#
# Removes sudo package and its relevant monitor, backup, firewall entries
#
# Usage:
# include sudo::absent
#

class sudo::remove {

    # Load variables defined in params.pp file.
    require sudo::params

    package { 'sudo':
        ensure => absent,
        name   => $sudo::params::pkg_name,
    }

    # Remove relevant monitor, backup, firewall entries
    if $sudo::params::backup   == 'yes' { include sudo::backup::absent   }
    if $sudo::params::monitor  == 'yes' { include sudo::monitor::absent  }
    if $sudo::params::firewall == 'yes' { include sudo::firewall::absent }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $sudo::params::debug  == 'yes' ) or ( $sudo::params::debug == true ) { include sudo::debug }

}

# vim:ft=puppet:

