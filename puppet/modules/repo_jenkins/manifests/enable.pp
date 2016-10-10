
class repo_jenkins::enable {

  yumrepo { 'jenkins':
    name     => 'jenkins',
    enabled  => 1,
  }

} # class

# vim:ft=puppet:

