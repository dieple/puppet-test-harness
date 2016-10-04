class profile::consul::client {

  $consul_hosts = hiera('consul-hosts')
  $datacenter   = hiera('aws-region')

  class { '::consul':
    config_hash => {
      'data_dir'   => '/opt/consul',
      'datacenter' => $datacenter,
      'log_level'  => 'INFO',
      'node_name'  => 'agent',
      'retry_join' => $consul_hosts,
    }
  }

}
