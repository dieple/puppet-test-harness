
class timezone::remove {

  require timezone::params

# package { 'timezone':
#   ensure => absent,
#   name   => $timezone::params::pkg_name,
# }

  file { '/etc/localtime':             ensure => absent, }
  file { '/etc/timezone':              ensure => absent, }
  file { '/etc/profile.d/timezone.sh': ensure => absent, }

} # class

# vim:ft=puppet:

