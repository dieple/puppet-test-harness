
class openssh {

  include motd
  motd::register{ $module_name : }

  # Load variables defined in params.pp file.
  require openssh::params

  # Default action: execute install
  include openssh::install

}

# vim:ft=puppet:

