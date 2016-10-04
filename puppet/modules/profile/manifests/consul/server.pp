class profile::consul::server {

  $consul_hosts = hiera('consul-hosts')
  $datacenter   = hiera('aws-region')

  class { '::consul':
    config_hash => {
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => $datacenter,
      'log_level'        => 'INFO',
      'node_name'        => 'server',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'retry_join'       => $consul_hosts,
    }
  }
}
