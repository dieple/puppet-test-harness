class profile::consul::client {

  $consul_hosts = hiera('cszk-hosts-with-bootstrap')
  $datacenter   = hiera('aws-region')

  # install requirements
  ensure_packages('unzip')

  class { '::consul':
    config_hash => {
      'data_dir'   => '/opt/consul',
      'datacenter' => $datacenter,
      'log_level'  => 'INFO',
      'retry_join' => $consul_hosts,
    }
  }

}
