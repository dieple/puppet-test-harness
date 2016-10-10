
class nagios::plugins {

  include motd
  motd::register{ 'nagios::plugins' : }

  ### Default
  require nagios::plugins::install

} # class

# vim:ft=puppet:

