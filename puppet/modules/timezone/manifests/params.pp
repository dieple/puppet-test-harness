
class timezone::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      ### timezone
      $pkg_name    = 'tzdata'

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

