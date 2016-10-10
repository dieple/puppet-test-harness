
class jenkins::user::remove {

  ###
  ### User/Groups
  ###
  User['jenkins'] -> Group['jenkins']

  group { 'jenkins':    ensure => absent, }
  user  { 'jenkins':    ensure => absent, }

} # class

# vim:ft=puppet:

