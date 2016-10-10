class jenkins::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'jenkins'
      $config_dir  = '/etc/sysconfig'
      $config_file = "${config_dir}/${pkg_name}"

      $init_file   = "/etc/init.d/${pkg_name}"
      $rotate_cfg  = "/etc/logrotate.d/${pkg_name}"

      $service_name = $pkg_name
      $service_port = 8080
      $protocol     = 'tcp'

      $process_name = $pkg_name
      $pid_file     = "/var/run/${pkg_name}.pid"
      $has_status   = true

      $jenkins_user    = 'jenkins'
      $jenkins_home    = '/var/lib/jenkins'
      $jenkins_plugins = "${jenkins_home}/plugins"

    }

#   /(Debian|Ubuntu)/ : {
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

