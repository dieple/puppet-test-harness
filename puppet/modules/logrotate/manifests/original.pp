
class logrotate::original {

  require logrotate::params

  File { owner => 'root', group => 'root', }

  file { $logrotate::params::config_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/logrotate/logrotate.conf.original',
  }

  file { $logrotate::params::cron_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/logrotate/logrotate.crontab.sh.original',
  }

} # class

# vim:ft=puppet:

