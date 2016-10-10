
class vim::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name    = 'vim73'
      $config_file = '/etc/vimrc'
      $replaces    = ['vim-common','vim-enhanced']

      $depends_on  = ['compat-libtermcap']

#     $pkg_name         = 'vim-enhanced'
#     $pkg_dependencies = ['gpm', 'vim-common']
#     $depend_on_pkg    = ''

    }

#   /(Debian|Ubuntu)/ : {
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

# notice("Params: ${::operatingsystem}")
# notice("Params: ${pkg_name}")

} # class

# vim:ft=puppet:

