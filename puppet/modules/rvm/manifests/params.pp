
class rvm::params {

  ###
  ### RVM ownership
  ###
  $group_name = 'rvm'
  $group_id   = '1000'
  $owner_name = 'root'

  ###
  ### RVM install dir
  ### (from the rpm package)
  ###
  $dir_name = '/usr/local/rvm'

  ###
  ### Custom RPM
  ###
  $url      = 'http://repo.abril.com.br/rpm/abril/el5/RPMS/'
  $pkg_name = 'rvm'

}

# vim:ft=puppet:

