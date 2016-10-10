
class timezone::install {

# require repo_centos62_eden

  require timezone::params

  package { 'timezone':
    ensure  => installed,
    name    => $timezone::params::pkg_name,
  }

  ###
  ### Conf
  ###
  File { owner => 'root', group => 'root', mode => '0644', }

  file { '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/America/Sao_Paulo'
  }

  file { '/etc/timezone':
    ensure  => file,
    content => 'America/Sao_Paulo'
  }

  file { '/etc/profile.d/timezone.sh':
    ensure => file,
    mode   => '0755',
    source => 'puppet:///modules/timezone/timezone.sh',
  }


} # class

# vim:ft=puppet:

