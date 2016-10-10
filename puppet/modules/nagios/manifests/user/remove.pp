
class nagios::user::remove {

  ###
  ### User/Groups
  ###
  User['nagios'] -> Group['nagios']

  group { 'nagios': ensure => absent, }
  user  { 'nagios': ensure => absent, }

  group { 'nagioscmd': ensure => absent, }

}

# vim:ft=puppet

