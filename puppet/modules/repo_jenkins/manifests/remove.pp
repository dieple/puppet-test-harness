
class repo_jenkins::remove {

  file  { '/etc/yum.repos.d/jenkins.repo': ensure => absent,    }

} # class

# vim:ft=puppet:

