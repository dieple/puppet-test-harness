
class logrotate::install {

# require repo_centos

  require logrotate::params

  package { 'logrotate':
    ensure  => installed,
    name    => $logrotate::params::pkg_name,
  }

  ###
  ### Directories,files
  ###

  ### logrotate-3.78-12
  ### rpm -qlv logrotate | column -t  # {
  # -rwxr-xr-x 1 root root 196   Jun 25 2011 /etc/cron.daily/logrotate
  # -rw-r--r-- 1 root root 662   Aug 29 2007 /etc/logrotate.conf
  # drwxr-xr-x 2 root root 0     Jun 25 2011 /etc/logrotate.d
  # -rwxr-xr-x 1 root root 52704 Jun 25 2011 /usr/sbin/logrotate
  # drwxr-xr-x 2 root root 0     Jun 25 2011 /usr/share/doc/logrotate-3.7.8
  # -rw-r--r-- 1 root root 5555  Jan 26 2009 /usr/share/doc/logrotate-3.7.8/CHANGES
  # -rw-r--r-- 1 root root 17976 Jul 9  1997 /usr/share/doc/logrotate-3.7.8/COPYING
  # -rw-r--r-- 1 root root 41    Jun 25 2011 /usr/share/man/man5/logrotate.conf.5.gz
  # -rw-r--r-- 1 root root 6151  Jun 25 2011 /usr/share/man/man8/logrotate.8.gz
  # -rw-r--r-- 1 root root 0     Jun 25 2011 /var/lib/logrotate.status
  # }

  File { owner => 'root', group => 'root', require => Package['logrotate'] }

  ### Directories
  file { $logrotate::params::config_dir :
    ensure => directory ,
    mode   => '0755'
  }

  ###
  ### Conf
  ###
  file { $logrotate::params::config_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/logrotate/logrotate.conf',
  }

  file { $logrotate::params::cron_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/logrotate/logrotate.crontab.sh',
  }

  ###
  ### Files
  ###
  file { '/usr/sbin/logrotate':
    ensure => file ,
    mode   => '0755'
  }


} # class

# vim:ft=puppet:

