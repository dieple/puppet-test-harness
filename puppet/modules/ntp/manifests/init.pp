
class ntp {

  include motd
  motd::register{ $module_name : }

  require ntp::install

}

# vim:ft=puppet:


