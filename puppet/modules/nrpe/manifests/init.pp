
class nrpe {

  include motd
  motd::register{ $module_name : }

  # Default
  include nrpe::install

} # class

# vim:ft=puppet:

