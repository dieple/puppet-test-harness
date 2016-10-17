# suppress puppet warning
Package {
  allow_virtual => true,
}

node 'haproxy' {
  include profile::load_balancer
}

node 'cszk01' {
  #include profile::consul::bootstrap
  include base
  include profile::zookeeper::install
}

node 'cszk02', 'cszk03' {
	include profile::consul::server
  include profile::zookeeper::install
}

node 'node01', 'node02' {
  include base
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

node 'content' {
  include base
  include profile::java::openjdk
	include profile::mongodb::install
	include profile::nodejs::install
	include profile::git_clone_repo::content
}

node 'jenkins' {
  include repo_jenkins
  include profile::java::openjdk
  include base
	include profile::jenkins
}
