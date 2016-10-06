class profile::consul::server {

  $consul_hosts = hiera('cszk-hosts')
  $datacenter   = hiera('aws-region')

  # install requirements
  ensure_packages('unzip')

  class { '::consul':
    config_hash => {
      'bootstrap'        => false,
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => $datacenter,
      'log_level'        => 'INFO',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'retry_join'       => $consul_hosts,
    }
  }
}
