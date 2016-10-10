
class repo_jenkins::install {

  yumrepo { 'jenkins':
    name     => 'jenkins',
    descr    => 'Jenkins-ci.org repo',
    baseurl  => 'http://pkg.jenkins-ci.org/redhat',
    gpgcheck => 1,
    enabled  => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/jenkins-ci.org.key',
    require  => File['jenkins-ci.org.key'],
  }

  file { 'jenkins-ci.org.key':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/jenkins-ci.org.key',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/repo_jenkins/jenkins-ci.org.key',
  }

} # class

# vim:ft=puppet:

