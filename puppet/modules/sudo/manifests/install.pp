
class sudo::install {

  # Load variables defined in params.pp file.
  require sudo::params

  ###
  ### Package only
  ###
  package { 'sudo':
      ensure => present,
      name   => $sudo::params::pkg_name ,
  }

  ###
  ### A lot of files
  ###

  # /bin/ls -lh {/etc,/usr/bin}/*sudo*
  # rpm -ql sudo | grep -v share | xargs ls -lh
  # -r--r----- 1 root root 3.4K Dec 14 15:53 /etc/sudoers
  # ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/sudo
  # ---s--x--x 2 root root 180K Mar  5  2011 /usr/bin/sudoedit
  # -rwxr-xr-x 1 root root 102K Mar  5  2011 /usr/sbin/visudo
  # -rwxr-xr-x 1 root root 5.4K Mar  5  2011 /usr/libexec/sesh
  # -rwxr-xr-x 1 root root 6.3K Mar  5  2011 /usr/libexec/sudo_noexec.so
  # -rw-r--r-- 1 root root  179 Mar  5  2011 /etc/pam.d/sudo
  # -rw-r--r-- 1 root root  164 Mar  5  2011 /etc/pam.d/sudo-i

  File { owner => 'root', group => 'root', require => Package['sudo'], }

  ###
  ### Conf
  ###
  file { $sudo::params::config_file :
      ensure  => present,
      mode    => '0440',
    # audit   => 'all',
      backup  => '.bkp',
    # content => template('sudo/sudoers.erb'),
    # source  => ["puppet:///sudo/sudoers.%{tag_machine}",
    #             "puppet:///sudo/sudoers.%{tag_environment}",
    #             "puppet:///sudo/sudoers"],
      source  => 'puppet:///modules/sudo/sudoers.vagrant',
  }

  ###
  ### Files
  ###
  file { $sudo::params::sudo :     ensure => present, mode => '4111', }
  file { $sudo::params::sudoedit : ensure => present, mode => '4111', }
  file { $sudo::params::visudo :   ensure => present, mode => '0755', }

}

# vim:ft=puppet:

