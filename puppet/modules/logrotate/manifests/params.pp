
class logrotate::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'logrotate'
      $config_dir  = '/etc/logrotate.d'
      $config_file = '/etc/logrotate.conf'
      $cron_file   = '/etc/cron.daily/logrotate'

    }

#   /(Debian|Ubuntu)/ : {
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

