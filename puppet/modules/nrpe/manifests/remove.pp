
class nrpe::remove {

  require nrpe::params

  # notify 'service'
# include apache::install
# File { notify  => Service['httpd'], }

  # Best order:
  Package['nrpe'] -> User['nrpe'] -> Group['nrpe']

  package { 'nrpe':
    ensure => absent,
    name   => $nrpe::params::pkg_name,
  }

  user  { 'nrpe': ensure => absent, }
  group { 'nrpe': ensure => absent, }

} # class

# vim:ft=puppet:

