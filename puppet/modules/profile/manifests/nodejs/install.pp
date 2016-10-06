class profile::nodejs::install {

  $nodejs_version = hiera('nodejs-version')

  class { 'nodejs':
    repo_url_suffix => $nodejs_version,
  }

  package { 'express':
    ensure   => 'present',
    provider => 'npm',
  }

  package { 'forever':
    ensure   => 'present',
    provider => 'npm',
  }

  package { 'forever-service':
    ensure   => 'present',
    provider => 'npm',
  }

  package { 'nodemon':
    ensure   => 'present',
    provider => 'npm',
  }

  # forever start -c "nodemon --harmony" index.js --exitcrash

}
