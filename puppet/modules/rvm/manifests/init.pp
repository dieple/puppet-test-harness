
class rvm {

  include motd
  motd::register{ $module_name : }

  # Default action
  require rvm::install

}

# vim:ft=puppet:

