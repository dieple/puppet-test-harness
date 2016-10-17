
class base {

  ###
  ### Simple ordering
  ###
  stage { 'prereq': before  => Stage['first'] }
  stage { 'first':  before  => Stage['main'] }
  stage { 'last':   require => Stage['main'] }

#  class {
#    'repo_centos62_eden':  stage => prereq;
#    'repo_eden_rpm':       stage => prereq;
#    'motd':                stage => first;
#    'rvm':                 stage => last;
#  }

  ###
  ### Base modules
  ###

  include motd
  motd::register{ $module_name : }

# include setup_tags
# include tag::roles
# include tag::classes

  ## default users
  include groups::app
# include users::infra
# include users::devops
# include users::ops

  ## packages
  #include yum
  #include repo_centos62_eden
  #include repo_eden_rpm

  ## packages: cleanup default from distro
  #include repo_centos::remove
  #include repo_centos62_media::remove

# include puppet::user
# include puppet

#  include bash
  include ruby
#  include rvm
# include vim72
#  include vim

  include logrotate
  include ntp
  include timezone
  include openssh
#  include sudo

#  include monit
#  include nrpe
#  include nagios::plugins
# include gmond
# include snmp

# include postfix

# include register

} # end class


