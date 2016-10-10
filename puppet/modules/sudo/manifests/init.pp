
class sudo {

  include motd
  motd::register{ $module_name : }

  # Default action: install
  include sudo::install

}

# vim:ft=puppet:

