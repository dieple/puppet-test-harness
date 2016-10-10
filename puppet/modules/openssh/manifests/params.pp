
class openssh::params  {

  ###
  ### All operatingsystems
  ###
  $service_name = 'sshd'
  $config_file  = 'sshd_config'
  $pid_file     = '/var/run/sshd.pid'
  $protocol     = 'tcp'
  $port         = 22
# $port         = hiera("ssh_port", "22")


  ###
  ### Specifics
  ###
  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name         = 'openssh'
      $pkg_dependencies = ''
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/ssh'
      $init_config_file = '/etc/sysconfig/openssh'
      $has_status       = true
    }

    /(Debian|Ubuntu)/ : {
      $pkg_name         = 'openssh'
      $pkg_dependencies = ''
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/ssh'
      $init_config_file = '/etc/default/openssh'
      $has_status       = false
    }

    default : {
      $pkg_name         = 'openssh'
      $pkg_dependencies = ''
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/ssh'
      $init_config_file = '/etc/sysconfig/openssh'
      $has_status       = true
    }


  } # case

  # notice("Params: ${::operatingsystem}")
  # notice("Params: ${pkg_name}")

} # class


# vim:ft=puppet:

