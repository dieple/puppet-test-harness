
class openssh::install {

  # Load variables defined in params.pp file.
  require openssh::params

  # Package/Service/File tripplet
  package { 'openssh':
    ensure => present,
    name   => $openssh::params::pkg_name,
  }

  service { 'openssh':
    ensure     => running,
    name       => $openssh::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $openssh::params::has_status,
    pattern    => $openssh::params::process_name,
    require    => Package['openssh'],
    subscribe  => File['sshd_config'],
  }

  ###
  ### Config files
  ###

  $config_dir = $openssh::params::config_dir

  File { owner => 'root', group => 'root', }

  file { 'sshd_config':
    ensure  => present,
    path    => "${config_dir}/sshd_config",
    mode    => '0600',
#   audit   => 'all',
    require => Package['openssh'],
    notify  => Service['openssh'],
    source  => 'puppet:///modules/openssh/sshd_config',
#   content => template('openssh/sshd_config.erb'),
  }

  file { 'ssh_config':
    ensure  => present,
    path    => "${config_dir}/ssh_config",
    mode    => '0644',
#   audit   => 'all',
    require => Package['openssh'],
    source  => 'puppet:///modules/openssh/ssh_config',
  }

  file {"${config_dir}/moduli":               ensure => present, mode => '0600'}
  file {"${config_dir}/ssh_host_key":         ensure => present, mode => '0600'}
  file {"${config_dir}/ssh_host_dsa_key":     ensure => present, mode => '0600'}
  file {"${config_dir}/ssh_host_rsa_key":     ensure => present, mode => '0600'}

  file {"${config_dir}/ssh_host_key.pub":     ensure => present, mode => '0644' }
  file {"${config_dir}/ssh_host_dsa_key.pub": ensure => present, mode => '0644' }
  file {"${config_dir}/ssh_host_rsa_key.pub": ensure => present, mode => '0644' }

  file {'/usr/bin/ssh-agent':                 ensure => present, mode => '2755', group => 'nobody', }

  # Reference: rpm install
  #   -rw------- 1 root root 132839 Apr 13  2011 moduli
  #   -rw-r--r-- 1 root root   1827 Apr 13  2011 ssh_config
  #   -rw------- 1 root root   3323 Apr 13  2011 sshd_config
  #   -rw------- 1 root root    668 Dec 11 03:31 ssh_host_dsa_key
  #   -rw-r--r-- 1 root root    590 Dec 11 03:31 ssh_host_dsa_key.pub
  #   -rw------- 1 root root    963 Dec 11 03:31 ssh_host_key
  #   -rw-r--r-- 1 root root    627 Dec 11 03:31 ssh_host_key.pub
  #   -rw------- 1 root root   1675 Dec 11 03:31 ssh_host_rsa_key
  #   -rw-r--r-- 1 root root    382 Dec 11 03:31 ssh_host_rsa_key.pub

  #   -rwxr-xr-x 1 root root   299K 2012-02-22 14:04 /usr/bin/ssh
  #   -rwxr-xr-x 1 root root   106K 2012-02-22 14:04 /usr/bin/ssh-add
  #*  -rwxr-sr-x 1 root nobody  90K 2012-02-22 14:04 /usr/bin/ssh-agent
  #   -rwxr-xr-x 1 root root   1.3K 2012-02-22 14:04 /usr/bin/ssh-copy-id
  #   -rwxr-xr-x 1 root root   131K 2012-02-22 14:04 /usr/bin/ssh-keygen
  #   -rwxr-xr-x 1 root root   167K 2012-02-22 14:04 /usr/bin/ssh-keyscan
  #   -rwxr-xr-x 1 root root   400K 2012-02-22 14:04 /usr/sbin/sshd

} # class

# vim:ft=puppet:

