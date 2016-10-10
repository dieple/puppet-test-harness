
define jenkins::plugin::remove ( $version = 'latest' ) {

  require jenkins::params

  # to enable 'notify'
  include jenkins::install

  $user = $jenkins::params::jenkins_user
  $home = $jenkins::params::jenkins_home
  $dir  = $jenkins::params::jenkins_plugins

  ###
  ### remove downloaded
  ###
  file { "jenkins_plugin_${name}" :
    ensure  => absent,
    path    => "${dir}/${name}.hpi",
    require => Exec [ "rm_jenkins_plugin_dir_${name}" ],
  }

  ###
  ### remove extracted
  ###

  exec { "rm_jenkins_plugin_dir_${name}" :
    command   => "rm -rf ${dir}/${name}",
    cwd       => $dir,
    onlyif    => "test -d ${dir}/${name}"      ,  # exists? is_dir?
    path      => '/usr/local/bin:/usr/bin:/bin',
    logoutput => on_failure,
    notify    => Service['jenkins'],
  }

} # class

# vim:ft=puppet:

