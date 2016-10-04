# suppress puppet warning
Package {
  allow_virtual => true,
}

node 'haproxy' {
  include profile::load_balancer
}

node 'consul1' {
  require profile::utils::unzip
	include profile::consul::bootstrap
}

node 'consul2', 'consul3' {
  require profile::utils::unzip
	include profile::consul::server
}

node 'node01', 'node02' {
  require profile::utils::unzip
  require profile::java::openjdk
	include profile::consul::client
}
