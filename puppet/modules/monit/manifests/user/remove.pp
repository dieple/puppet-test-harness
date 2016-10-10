
class monit::user::remove {

  ###
  ### User/Groups
  ###
  User['monit'] -> Group['monit']

  group { 'monit': ensure => absent, }
  user  { 'monit': ensure => absent, }

}

# vim:ft=puppet

