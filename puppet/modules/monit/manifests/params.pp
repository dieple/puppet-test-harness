
class monit::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'monit'
      $config_dir  = '/etc/monit.d'
      $config_file = '/etc/monit.conf'

      $init_file   = "/etc/init.d/${pkg_name}"

      $service_name = $pkg_name
      $service_port = 2812

      $process_name = $pkg_name
      $pid_file     = "/var/run/${pkg_name}.pid"
      $has_status   = true

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

