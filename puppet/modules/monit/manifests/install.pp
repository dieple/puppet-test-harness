
class monit::install {

# require repo_eden_rpm

  require monit::params
  require monit::user

  package { 'monit':
    ensure  => installed,
    name    => $monit::params::pkg_name,
  }

  service { 'monit':
    ensure     => running,
    name       => $monit::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $monit::params::has_status,
    pattern    => $monit::params::process_name,
    require    => Package['monit'],
    subscribe  => File[ $monit::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### monit-5.4
  ### rpm -qlv monit | column -t  # {
  # -rw------- 1 root root 10652  Jun 8 12:19 /etc/monit.conf
  # drwxr-xr-x 2 root root 0      Jun 8 12:20 /etc/monit.d
  # -rwxr-xr-x 1 root root 1275   Jun 8 12:19 /etc/rc.d/init.d/monit
  # -rwxr-xr-x 1 root root 580639 Jun 8 12:20 /usr/bin/monit
  # drwxr-xr-x 2 root root 0      Jun 8 12:20 /usr/share/doc/monit-5.4
  # -rw-r--r-- 1 root root 32995  May 6 06:40 /usr/share/doc/monit-5.4/CHANGES
  # -rw-r--r-- 1 root root 35264  May 6 06:40 /usr/share/doc/monit-5.4/COPYING
  # -rw-r--r-- 1 root root 3776   May 6 06:40 /usr/share/doc/monit-5.4/README
  # -rw-r--r-- 1 root root 47957  Jun 8 12:20 /usr/share/man/man1/monit.1.gz
  # drwxr-xr-x 2 root root 0      Jun 8 12:20 /var/lib/monit
  # drwxr-xr-x 2 root root 0      Jun 8 12:20 /var/monit
  # }

  File { owner => 'root', group => 'root', require => Package['monit'] }

  ### Directories
  file {'/etc/monit.d':   ensure => directory , mode => '0755' }
  file {'/var/lib/monit': ensure => directory , mode => '0755' }
  file {'/var/monit':     ensure => directory , mode => '0755' }

  ### Files
  file { '/usr/bin/monit': ensure => file, mode => '0755' }

  ###
  ### Conf
  ###
  file { $monit::params::config_file :
    ensure => present,
    mode   => '0600',
    source => 'puppet:///modules/monit/monit.conf',
    notify => Service['monit']
  }

  file { $monit::params::init_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/monit/monit.init.sh',
  }

} # class

# vim:ft=puppet:

