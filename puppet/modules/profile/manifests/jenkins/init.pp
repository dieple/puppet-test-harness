class profile::jenkins {

  $consul_hosts = hiera('cszk-hosts')
  $datacenter   = hiera('aws-region')

  class { '::jenkins':
    exec { 'install_jenkins_yum_repo:class jenkins {

    exec 
  }




}
