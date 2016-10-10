class jenkins {

  include motd
  motd::register{ $module_name : }

  # Default
  include jenkins::install

} # class

