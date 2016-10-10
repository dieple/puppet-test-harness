class profile::consul::bootstrap {

  $node_name    = hiera('cs-bootstrap-name')
  $datacenter   = hiera('aws-region')

  # install requirements
  ensure_packages('unzip')

  class { '::consul':
    config_hash => {
      'bootstrap'        => true,
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => $datacenter,
      'log_level'        => 'INFO',
      'node_name'        => $node_name,
      'server'           => true,
      'ui_dir'           => '/opt/consul/ui',
    }
  }
}
