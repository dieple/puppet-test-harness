class motd {

  $motd = '/etc/motd'

  file { $motd :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/motd/motd.txt',
  }

}


# vim:ft=puppet:

