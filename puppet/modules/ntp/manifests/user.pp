class ntp::user {

  ###
  ### User/Groups
  ###
  Group['ntp'] -> User['ntp']

  group { 'ntp':
    ensure => present,
    gid    => '38',
  }

  user { 'ntp':
    ensure     => present,
    uid        => '38',
    gid        => '38',
    shell      => '/sbin/nologin',
    home       => '/etc/ntp',
    comment    => '',
    managehome => false,
    allowdupe  => false,
  }

} # class

# vim:ft=puppet:

