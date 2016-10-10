
class monit {

  include motd
  motd::register{ $module_name : }

  # Default
  include monit::install

} # class

# vim:ft=puppet:

