define jenkins::plugin( $version = 'latest' ) {

  require jenkins::params

  # to enable 'notify'
  include jenkins::install

  $user = $jenkins::params::jenkins_user
  $home = $jenkins::params::jenkins_home
  $dir  = $jenkins::params::jenkins_plugins
  $url  = 'https://updates.jenkins-ci.org'

  # plugin by version?
  if ( $version == 'latest' ) {
    $url_plugin = "${url}/latest/${name}.hpi"
  }
  else {
    $url_plugin = "${url}/download/plugins/${name}/${version}/${name}.hpi"
  }

  ###
  ### enforce owner:group
  ###
  file { "jenkins_plugin_${name}" :
    ensure  => present,
    path    => "${dir}/${name}.hpi",
    owner   => $user,
    group   => $user,
    mode    => '0644',
    require => Exec [ "jenkins_download_${name}" ],
  }

  ###
  ### download, if necessary
  ###
  exec { "jenkins_download_${name}" :
#   command   => "curl -k -L -s ${url_plugin} -o ${name}.hpi", # --silent
    command   => "curl -k -L    ${url_plugin} -o ${name}.hpi", # --insecure --location
    cwd       => $dir,
    creates   => "${dir}/${name}.hpi",            # if not exists, download
    unless    => "unzip -t ${dir}/${name}.hpi" ,  # if corrupt, download again
    path      => '/usr/local/bin:/usr/bin:/bin',
    logoutput => on_failure,
    user      => $user ,
    group     => $user ,
    tries     => 3,
    timeout   => 60, # seconds
    try_sleep => 15, # seconds
    notify    => Service['jenkins'],
  }

} # class

