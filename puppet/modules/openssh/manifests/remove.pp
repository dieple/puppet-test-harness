
class openssh::remove {

  # Load variables defined in params.pp file.
  require openssh::params

  package { 'openssh':
    ensure  => absent,
    name    => $openssh::params::pkg_name,
    require => Service['openssh'],
  }

  service { 'openssh':
    ensure => stopped,
    name   => $openssh::params::service_name,
  }

} # class

# vim:ft=puppet:

