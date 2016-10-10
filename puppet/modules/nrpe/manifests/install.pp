
class nrpe::install {

  require repo_eden_rpm

  require nrpe::params
  require nagios::user

  package { 'nrpe':
    ensure  => installed,
    name    => $nrpe::params::pkg_name,
  }

  service { 'nrpe':
    ensure     => running,
    name       => $nrpe::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $nrpe::params::has_status,
    pattern    => $nrpe::params::process_name,
    require    => Package['nrpe'],
    subscribe  => File[ $nrpe::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### nrpe-2.13
  ### rpm -qlv nrpe | column -t  # {
  # drwxr-xr-x 2 root root 0     Aug 26 17:54 /etc/nagios
  # -rw-r--r-- 1 root root 7336  Aug 26 17:54 /etc/nagios/nrpe.cfg
  # -rwxr-xr-x 1 root root 1423  Aug 26 17:54 /etc/rc.d/init.d/nrpe
  # -rw-r--r-- 1 root root 508   Aug 26 17:54 /etc/xinetd.d/nrpe
  # drwxr-xr-x 2 root root 0     Aug 26 17:54 /usr/lib64/nagios
  # drwxr-xr-x 2 root root 0     Aug 26 17:54 /usr/lib64/nagios/plugins
  # -rwx--x--x 1 root root 27164 Aug 26 17:54 /usr/lib64/nagios/plugins/check_nrpe
  # -rwx--x--x 1 root root 52844 Aug 26 17:54 /usr/sbin/nrpe
  # drwxr-xr-x 2 root root 0     Aug 26 17:54 /usr/share/doc/nrpe-2.13
  # -rwxr-xr-x 1 root root 9455  Nov 11 2011  /usr/share/doc/nrpe-2.13/Changelog
  # -rwxr-xr-x 1 root root 441   Nov 23 2007  /usr/share/doc/nrpe-2.13/LEGAL
  # -rwxr-xr-x 1 root root 7056  Mar 14 2007  /usr/share/doc/nrpe-2.13/README
  # }

  File { owner => 'root', group => 'root', require => Package['nrpe'] }

  ### Directories
  file {'/etc/nagios/nrpe.d': ensure => directory , mode => '0755' }

  ### Files
  file { '/usr/sbin/nrpe':                       ensure => file, mode   => '0711' }
  file { '/usr/lib64/nagios/plugins/check_nrpe': ensure => file, mode => '0711' }

  ###
  ### Conf
  ###
  file { $nrpe::params::config_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/nrpe/nrpe.cfg',
    notify => Service['nrpe']
  }

  file { 'nrpe_commands_01':
    ensure => present,
    path   => "${nrpe::params::config_dir}/nrpe.commands.cfg",
    mode   => '0644',
    source => 'puppet:///modules/nrpe/nrpe.commands.cfg',
    notify => Service['nrpe']
  }

  file { $nrpe::params::init_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/nrpe/nrpe.init.sh',
  }

  file { $nrpe::params::xinetd_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/nrpe/nrpe.xinetd',
  }

  file { '/etc/profile.d/nrpe.sh':
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/nrpe/nrpe.profile.sh',
  }


} # class

# vim:ft=puppet:

