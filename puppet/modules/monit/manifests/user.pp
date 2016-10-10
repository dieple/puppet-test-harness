
class monit::user {

  ###
  ### User/Groups
  ###
  Group['monit'] -> User['monit']

  group { 'monit':
    ensure     => present,
    gid        => '1012',
  }

  user { 'monit':
    ensure     => present,
    uid        => '1012',
    gid        => '1012',
    shell      => '/bin/sh',
    home       => '/var/lib/monit',
    comment    => 'Monit Daemon', # -M -r
    managehome => false,
    allowdupe  => false,
    system     => true,
  }

}

# vim:ft=puppet

