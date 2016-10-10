
class repo_jenkins {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_jenkins::install

} # class

# vim:ft=puppet:

