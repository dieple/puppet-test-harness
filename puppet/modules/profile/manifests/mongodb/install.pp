class profile::mongodb::install {

  $dbname = hiera('mongodb-name')
  $dbuser = hiera('mongodb-user')
  $dbpasswd = hiera('mongodb-hash-passwd')
  $createdb = hiera('mongodb-create-db')

  class {'::mongodb::globals':
    manage_package_repo => true,
  }->
  class {'::mongodb::client': } ->
  class {'::mongodb::server': auth => true, }

  #if $createdb {
  #  mongodb::db { $dbname:
  #    user          => $dbuser,
  #    password_hash => $dbpasswd,
  #  }
  #}

}
