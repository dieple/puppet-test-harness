
class logrotate {

  include motd
  motd::register{ $module_name : }

  # Default
  include logrotate::install

} # class

# vim:ft=puppet:

