
class nagios::user {

  ###
  ### User/Groups
  ###
  Group['nagios'] -> User['nagios']

  group { 'nagios':
    ensure     => present,
    gid        => '1003',
  }

  user { 'nagios':
    ensure     => present,
    uid        => '1003',
    gid        => '1003',
    shell      => '/sbin/nologin',
    home       => '/var/lib/nagios',
    comment    => 'Nagios',
    managehome => true,
    allowdupe  => false,
  }

  group { 'nagioscmd':
    ensure     => present,
    gid        => '1004',
    allowdupe  => false,
  }

}

# vim:ft=puppet

