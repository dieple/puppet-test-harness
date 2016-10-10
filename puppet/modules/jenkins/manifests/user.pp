class jenkins::user {

  ###
  ### User/Groups
  ###
  Group['jenkins'] -> User['jenkins']

  group { 'jenkins':
    ensure => present,
    gid    => '1009',
  }

  user { 'jenkins':
    ensure     => present,
    uid        => '1009',
    gid        => '1009',
    shell      => '/bin/bash',
    home       => '/home/jenkins',
    comment    => 'Jenkins Continuous Build server',
    managehome => true,
    allowdupe  => false,
  }

} # class

