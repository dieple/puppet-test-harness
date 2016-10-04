class profile::consul::bootstrap {

  $consul_hosts = hiera('consul-hosts')
  $datacenter   = hiera('aws-region')

  class { '::consul':
    config_hash => {
      'bootstrap_expect' => count($consul_hosts),
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => $datacenter,
      'log_level'        => 'INFO',
      'node_name'        => 'cs-bootstrap',
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
      'retry_join'       => $consul_hosts,
    }
  }
}
