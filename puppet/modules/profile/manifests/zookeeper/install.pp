class profile::zookeeper::install {

  $zk1_ip           = hiera('zk1-ip-address')
  $zk2_ip           = hiera('zk2-ip-address')
  $zk3_ip           = hiera('zk3-ip-address')
  $zk_leader_port   = hiera('zk-leader-port')
  $zk_election_port = hiera('zk-election-port')

#  class { '::zookeeper':
#    servers       => {
#      1   =>  $zk1_ip,
#      2   =>  $zk2_ip,
#      3   =>  $zk3_ip,
#    },
#  }

  class { 'zookeeper':
    server_name => $::ipaddress,
    }

}
