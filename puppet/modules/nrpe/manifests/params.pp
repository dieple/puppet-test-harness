
class nrpe::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'nrpe'
      $config_dir  = '/etc/nagios'
      $config_file = "${config_dir}/${pkg_name}.cfg"

      $init_file   = "/etc/init.d/${pkg_name}"
      $xinetd_file = "/etc/xinetd.d/${pkg_name}"

      $service_name = $pkg_name
      $service_port = 5666

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

