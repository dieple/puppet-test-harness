
class ntp::user::remove {

  ###
  ### User/Groups
  ###
  User['ntp'] -> Group['ntp']

  group { 'ntp': ensure => absent, }
  user  { 'ntp': ensure => absent, }

} # class

# vim:ft=puppet:

