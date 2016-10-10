class jenkins::install {

# require repo_eden_rpm
# require repo_jenkins

  #require java::jre::install
  require jenkins::params
  require jenkins::user

  package { 'jenkins':
    ensure  => latest,
    name    => $jenkins::params::pkg_name,
  }

  service { 'jenkins':
    ensure     => running,
    name       => $jenkins::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $jenkins::params::has_status,
    pattern    => $jenkins::params::process_name,
    require    => Package['jenkins'],
    subscribe  => File[ $jenkins::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### jenkins-1.480-1.1
  ### rpm -qlv jenkins | column -t  # {
  # -rwxr-xr-x  1 root    root    5568     Sep 3 15:41 /etc/init.d/jenkins
  # -rw-r--r--  1 root    root    403      Sep 3 15:41 /etc/logrotate.d/jenkins
  # -rw-------  1 root    root    2110     Sep 3 15:41 /etc/sysconfig/jenkins
  # -rw-r--r--  1 root    root    76       Sep 3 15:41 /etc/yum.repos.d/jenkins.repo
  # drwxr-xr-x  2 root    root    0        Sep 3 15:41 /usr/lib/jenkins
  # -rw-r--r--  1 root    root    49059990 Sep 3 15:41 /usr/lib/jenkins/jenkins.war
  # lrwxrwxrwx  1 root    root    24       Sep 3 15:41 /usr/sbin/rcjenkins -> ../../etc/init.d/jenkins
  # drwxr-x---  2 jenkins jenkins 0        Sep 3 15:41 /var/cache/jenkins
  # drwxr-xr-x  2 jenkins jenkins 0        Sep 3 15:41 /var/lib/jenkins
  # drwxr-x---  2 jenkins jenkins 0        Sep 3 15:41 /var/log/jenkins
  # }

  File { owner => 'jenkins', group => 'jenkins', require => Package['jenkins'] }

  ### Directories
  file {'/var/cache/jenkins': ensure => directory , mode => '0640' } # , recurse => true }
  file {'/var/lib/jenkins':   ensure => directory , mode => '0644' } # , recurse => true }
  file {'/var/log/jenkins':   ensure => directory , mode => '0640' } # , recurse => true }

  ###
  ### Conf
  ###
  file { $jenkins::params::config_file :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/jenkins/jenkins.sysconfig.sh',
    notify => Service['jenkins']
  }

  file { $jenkins::params::init_file :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/jenkins/jenkins.init.sh',
  }

  file { $jenkins::params::rotate_cfg :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/jenkins/jenkins.logrotate',
  }


} # class
