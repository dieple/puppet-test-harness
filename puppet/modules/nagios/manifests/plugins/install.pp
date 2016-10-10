
class nagios::plugins::install {

  require repo_eden_rpm

  require nagios::params
  require nagios::user

  # for service notify:
# require nrpe

  package { 'nagios-plugins':
    ensure  => installed,
    name    => $nagios::params::pkg_plugins,
  }

  ###
  ### Directories,files
  ###

  ### nagios-plugins-1.4.15-2.el6.rf.x86_64.rpm
  ### rpm -qlv nagios-plugins | column -t  # {
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /etc/nagios
  # -rw-r--r--  1  root  root  15860   Nov  26  2010  /etc/nagios/command-plugins.cfg
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /usr/lib64/nagios
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /usr/lib64/nagios/plugins
  # -rwxr-xr-x  1  root  root  120912  Nov  26  2010  /usr/lib64/nagios/plugins/check_*
  # ...
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /usr/lib64/nagios/plugins/contrib
  # -rwxr-xr-x  1  root  root  1493    Nov  26  2010  /usr/lib64/nagios/plugins/contrib/check_*
  # ...
  # }

  ### nagios-plugins-setuid-1.4.15-2.el6.rf.x86_64.rpm
  ### rpm -qlv nagios-plugins | column -t  # {
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /usr/lib64/nagios
  # drwxr-xr-x  2  root  root  0       Nov  26  2010  /usr/lib64/nagios/plugins
  # -rwsr-xr-x  1  root  root  147488  Nov  26  2010  /usr/lib64/nagios/plugins/check_dhcp
  # -rwsr-xr-x  1  root  root  157016  Nov  26  2010  /usr/lib64/nagios/plugins/check_icmp
  # }

  File { owner => 'root', group => 'root', require => Package['nagios-plugins'] }

  ### Directories
  file {'/usr/lib64/nagios':                 ensure => directory , mode => '0755' }
  file {'/usr/lib64/nagios/plugins':         ensure => directory , mode => '0755' }
  file {'/usr/lib64/nagios/plugins/contrib': ensure => directory , mode => '0755' }

  ### Files
  file { '/usr/lib64/nagios/plugins/check_dhcp': ensure => file, mode => '4755' }
  file { '/usr/lib64/nagios/plugins/check_icmp': ensure => file, mode => '4755' }

  ###
  ### Conf
  ###
  file { 'nagios-plugins-command-cfg':
    ensure => present,
    path   => "${nagios::params::config_dir}/command-plugins.cfg",
    mode   => '0644',
    source => 'puppet:///modules/nagios/command-plugins.cfg',
#   notify => Service['nrpe']
  }

  file { '/etc/profile.d/nagios-plugins.sh':
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/nagios/nagios-plugins.profile.sh',
  }

# file { $nrpe::params::init_file :
#   ensure => present,
#   mode   => '0755',
#   source => 'puppet:///modules/nagios/nagios.init.sh',
# }

} # class

# vim:ft=puppet:

