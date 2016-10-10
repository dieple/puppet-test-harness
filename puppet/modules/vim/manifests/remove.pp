
class vim::remove {

  require vim::params

  package { 'vim':
    ensure => absent,
    name   => $vim::params::pkg_name,
  }

  package { 'vim_dependencies':
    ensure  => absent,
    name    => $vim::params::pkg_dependencies,
    require => Package['vim'],
  }

  file { 'vimrc':
    ensure  => absent,
    path    => $vim::params::config_file,
  }
  file { '/etc/virc':   ensure  => absent, }
  file { '/usr/bin/vi': ensure  => absent, }

}

# vim:ft=puppet:

