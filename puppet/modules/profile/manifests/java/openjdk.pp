class profile::java::openjdk {

  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }
}
