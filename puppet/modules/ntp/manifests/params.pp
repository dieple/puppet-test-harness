
class ntp::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      ### ntp
      $pkg_name    = 'ntp'
      $config_dir  = '/etc/sysconfig'
      $config_file = "${config_dir}/ntpd"

      $depends_on  = 'ntpdate'

      $init_file = '/etc/init.d/ntpd'

      $conf_dir  = '/etc'
      $conf_file = '/etc/ntp.conf'

      $service_name = 'ntpd'
      $service_port = 123
      $protocol     = 'udp'

      $process_name = 'ntpd'
      $pid_file     = '/var/run/ntpd.pid'
      $has_status   = true

      ### ntpdate
      $ntpdate_config_file = "${config_dir}/${pkg_name}"
      $ntpdate_init_file   = "/etc/init.d/${pkg_name}"
      $ntpdate_conf_file   = '/etc/ntp/keys'

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

