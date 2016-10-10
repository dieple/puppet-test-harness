class jenkins::remove {

  require jenkins::params

  # Best order:
  Package['jenkins'] -> User['jenkins'] -> Group['jenkins']

  package { 'jenkins':
    ensure => absent,
    name   => $jenkins::params::pkg_name,
  }

  user  { 'jenkins': ensure => absent, }
  group { 'jenkins': ensure => absent, }

} # class

