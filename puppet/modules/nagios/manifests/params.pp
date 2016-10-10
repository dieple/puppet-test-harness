
class nagios::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = ''
      $config_dir  = '/etc/nagios'
      $config_file = "${config_dir}/${pkg_name}.cfg"

      # from RPMForge
      $pkg_plugins = [ 'nagios-plugins', 'nagios-plugins-setuid' ]
      $pkg_plug_depends = [
        'fping',
        'perl',
        'perl-Crypt-DES',
        'perl-Net-SNMP'
      ]

#     $init_file   = "/etc/init.d/${pkg_name}"

#     $service_name = $pkg_name
#     $service_port = 5666

#     $process_name = $pkg_name
#     $pid_file     = "/var/run/${pkg_name}.pid"
#     $has_status   = true

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

