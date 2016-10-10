
class sudo::params  {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name    = 'sudo'
      $config_dir  = '/etc'
      $config_file = "${config_dir}/sudoers"

      $sudo     = '/usr/bin/sudo'
      $sudoedit = '/usr/bin/sudoedit'
      $visudo   = '/usr/sbin/visudo'
    }

#   /(Debian|Ubuntu)/ : {
#
#   }

    default : {
      notice("Not configured for: ${::operatingsystem}")
    }

  } # case

}

# vim:ft=puppet:

