
class rvm::remove {

  # Default action
  require rvm::params

  package { 'rvm':
    ensure => absent,
  }

  file { 'rvm_dir':
    ensure  => absent,
    path    => $rvm::params::dir_name,
    force   => true,
    require => Package['rvm']
  }


}

# vim:ft=puppet:

