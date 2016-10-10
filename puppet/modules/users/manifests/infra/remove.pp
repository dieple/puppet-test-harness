
class users::infra::remove {

  user  {'infra': ensure => absent, }

  group {'infra':
    ensure  => absent,
    require => User['infra'],
  }

}

# vim:ft=puppet

