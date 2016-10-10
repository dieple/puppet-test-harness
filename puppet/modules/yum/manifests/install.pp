
class yum::install {

  require yum::params

  # Global
  File { owner  => 'root', group  => 'root', mode   => '0644', }

  ###
  ### Concept: a yum.conf by major release
  ###
  file { '/etc/yum.conf':
    ensure => present,
    source => "puppet:///modules/yum/${yum::params::yum_conf}"
  }

  ### disable fastestmirror
  file { '/etc/yum/pluginconf.d/fastestmirror.conf':
    ensure => present,
    source => "puppet:///modules/yum/${yum::params::plugin_fastest}"
  }

}

# vim:ft=puppet:

