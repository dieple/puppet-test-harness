# suppress puppet warning
Package {
  allow_virtual => true,
}

node 'haproxy' {
  include profile::load_balancer
}

node 'cszk01' {
  #include profile::consul::bootstrap
  include profile::zookeeper::init
}

node 'cszk02', 'cszk03' {
	include profile::consul::server
  include profile::zookeeper::init
}

node 'node01', 'node02' {
  include base
  include motd
  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }
  include repo_jenkins
  include jenkins
	#include profile::jenkins::install
	#include profile::mongodb::install
	#include profile::nodejs::install
  #include profile::java::openjdk
  #include profile::solr::install
	#include profile::consul::client
}

