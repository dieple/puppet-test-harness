class bash {

  include motd
  motd::register{ $module_name : }

  ## Default environment files

  File { owner => 'root', group => 'root', mode => '0644', }

  file { 'bashrc':
    ensure  => present,
    path    => '/etc/bashrc',
    source  => 'puppet:///modules/bash/bashrc',
  }

  file { 'profile':
    ensure  => present,
    path    => '/etc/profile',
    source  => 'puppet:///modules/bash/profile',
  }

  file { 'bash_aliases':
    ensure => present,
    path   => '/etc/profile.d/aliases.sh',
    source => 'puppet:///modules/bash/aliases.sh',
    mode   => '0755',
  }

} # class


