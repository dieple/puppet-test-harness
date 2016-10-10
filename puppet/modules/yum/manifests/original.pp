
class yum::original {

  require yum::params

  File { owner  => 'root', group  => 'root', mode   => '0644', }

  file { '/etc/yum.conf':
    ensure => present,
    source => "puppet:///modules/yum/${yum::params::yum_conf}.original"
  }

  file { '/etc/yum/pluginconf.d/fastestmirror.conf':
    ensure => present,
    source => "puppet:///modules/yum/${yum::params::pluginconf_fastest}.original"
  }

}

# vim:ft=puppet:

