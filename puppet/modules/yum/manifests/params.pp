
class yum::params {

    case $::operatingsystemrelease {

      ### el6
      /^6\.*/ : {
        $yum_conf       = 'yum.conf.el6'
        $plugin_fastest = 'fastestmirror.conf.el6'
      }

      ### el5
      /^5\.*/ : {
        $yum_conf       = 'yum.conf.el5'
        $plugin_fastest = 'fastestmirror.conf.el5'
      }

      default : {
        notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
      }

  } # case

# notice("Operating System Release: [${::operatingsystemrelease}]")

} # class

# vim:ft=puppet

