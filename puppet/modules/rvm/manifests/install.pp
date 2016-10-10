
class rvm::install {

# require repo_eden_rpm
  require groups::app

  require rvm::params
  $group = $rvm::params::group_name
  $gid   = $rvm::params::group_id
  $owner = $rvm::params::owner_name
  $dir   = $rvm::params::dir_name

  ###
  ### Obs:
  ###     Group 'rvm' uses the same id as 'app'.
  ###     The main idea is to use 'rvm' for the installation
  ###     but to administer only the 'app' group.
  ###
  group { 'rvm':
    ensure    => present,
    gid       => $gid,
    allowdupe => true,
    require   => Group['app'],
  }

  package { 'rvm':
    ensure  => 'present',
    name    => $rvm::params::pkg_name,
    require => Group['rvm'],
  }

  ### create dir
  file { 'rvm_dir':
    ensure  => directory,
    path    => $dir,
    owner   => $owner,
    group   => $group,
    mode    => '2775',
    require => [ Group['rvm'], Package['rvm'] ],
  }

  ### permissions
  exec { 'rvm_perm_dirs':
    command => "find ${dir} -type d | grep -v rubies | xargs chmod g+w+s",
    cwd     => $dir,
    path    => '/usr/bin:/bin',
    require => File['rvm_dir']
  }

  exec { 'rvm_perm_files':
    command => "chown -R ${owner}:${group} ${dir}",
    cwd     => $dir,
    path    => '/usr/bin:/bin',
    require => File['rvm_dir']
  }

}

# vim:ft=puppet:

