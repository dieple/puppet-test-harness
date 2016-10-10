
class vim::replaces {

  require vim::params

  package { 'gpm-libs':
    ensure  => absent,
    require => Package['vim-common']
  }

  package { 'vim-common':
    ensure  => absent,
    require => Package['vim-enhanced']
  }

  package { 'vim-enhanced':
    ensure  => absent,
  }

}

# vim:ft=puppet:

