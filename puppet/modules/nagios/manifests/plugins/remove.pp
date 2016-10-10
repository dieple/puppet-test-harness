
class nagios::plugins::remove {

  require nagios::params

  package { 'nagios-plugins':
    ensure  => absent,
    name    => $nagios::params::pkg_plugins,
  }

} # class

# vim:ft=puppet:

