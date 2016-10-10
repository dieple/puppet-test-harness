
class monit::remove {

  require monit::params

  # Best order:
  Package['monit'] -> User['monit'] -> Group['monit']

  package { 'monit':
    ensure => absent,
    name   => $monit::params::pkg_name,
  }

  user  { 'monit': ensure => absent, }
  group { 'monit': ensure => absent, }

} # class

# vim:ft=puppet:

