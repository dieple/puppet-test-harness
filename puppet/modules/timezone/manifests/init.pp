
class timezone {

  include motd
  motd::register{ $module_name : }

  require timezone::install

}

# vim:ft=puppet:


