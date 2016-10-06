class profile::zookeeper::init {

  $zk_election_port = hiera('zk-election-port')
  $zk_leader_port = hiera('zk-leader-port')
  $zk1_ip = hiera('zk1-ip-address')
  $zk2_ip = hiera('zk2-ip-address')
  $zk3_ip = hiera('zk3-ip-address')

  class { '::zookeeper':
    install_java  => true,
    java_package  => 'java-1.8.0-openjdk',
    election_port => $zk_election_port,
    leader_port   => $zk_leader_port,
    servers       => {
      1   =>  $zk1_ip,
      2   =>  $zk2_ip,
      3   =>  $zk3_ip,
    }
  }
}
