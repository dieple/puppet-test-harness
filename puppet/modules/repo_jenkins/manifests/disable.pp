
class repo_jenkins::disable {

  file  { '/etc/yum.repos.d/jenkins.repo': ensure => absent,    }

} # class

# vim:ft=puppet:

