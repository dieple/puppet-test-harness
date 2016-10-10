
class yum {

  include motd
  motd::register{ $module_name : }

  # Default action
  include yum::install

} # class

# vim:ft=puppet:

