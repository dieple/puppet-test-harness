
class ruby {

  include motd
  motd::register{ $module_name : }

# require repo_eden_rpm

  require ruby::params
  $owner = $ruby::params::owner_name
  $group = $ruby::params::group_name
  $pkg   = $ruby::params::pkg_name

  package { 'ruby-1.8.7':
    ensure => 'present',
    name   => $pkg,
  }

  File { owner  => 'root', group  => 'root', mode   => '0644', }

  file { '/root/.gemrc':
    ensure => file,
    source => 'puppet:///modules/ruby/dot.gemrc',
  }

  file { '/etc/skel/.gemrc':
    ensure => file,
    source => 'puppet:///modules/ruby/dot.gemrc',
  }

}

# vim:ft=puppet:

