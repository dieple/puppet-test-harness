
class vim {

  # Parameters by operating system
  require vim::params

  # Default: only install client
  include vim::install

}

# vim:ft=puppet:

