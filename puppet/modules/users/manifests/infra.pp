
class users::infra {

  group { 'infra':
    ensure     => present,
    gid        => '20000',
    allowdupe  => true,
  }

  user { 'infra':
    ensure     => present,
    uid        => '20000',
    gid        => '20000',
    shell      => '/bin/bash',
    home       => '/home/infra',
    comment    => 'Infra',
    managehome => true,
    allowdupe  => false,
    require    => Group['infra'],
  }

  ###
  ### ~/.ssh
  ###

  File { owner => 'infra', group => 'infra', mode => '0644' }

  file { 'infra_ssh':
    ensure  => directory,
    path    => '/home/infra/.ssh/',
    mode    => '0700',
  }

  file { 'infra_read_only':
    ensure  => present,
    path    => '/home/infra/.ssh/infra_read_id_rsa',
    mode    => '0600',
    source  => 'puppet:///modules/users/infra_read_id_rsa',
    require => File['infra_ssh'],
  }

  file { 'infra_read_only_pub':
    ensure  => present,
    path    => '/home/infra/.ssh/infra_read_id_rsa.pub',
    source  => 'puppet:///modules/users/infra_read_id_rsa.pub',
    require => File['infra_ssh'],
  }

  file { 'infra_ssh_config':
    ensure  => present,
    path    => '/home/infra/.ssh/config',
    source  => 'puppet:///modules/users/home_ssh_config',
    require => File['infra_ssh'],
  }

} # class


