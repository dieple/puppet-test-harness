
class ntp::remove {

  require ntp::params

  # Best order:
  Package['ntp'] -> User['ntp'] -> Group['ntp']

  package { 'ntp':
    ensure => absent,
    name   => $ntp::params::pkg_name,
  }

  package { 'ntp_depends_on':
    ensure  => absent,
    name    => $ntp::params::depends_on,
    require => Package['ntp']
  }

  user  { 'ntp': ensure => absent, }
  group { 'ntp': ensure => absent, }

} # class

# vim:ft=puppet:

