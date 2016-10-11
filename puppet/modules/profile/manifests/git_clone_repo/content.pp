class profile::git_clone_repo::content {

  $repo_name      = hiera('ct-repo-name')
  $git_repo_url   = hiera('ct-repo-url')
  $checkout_path  = hiera('ct-checkout-path')
  $username       = hiera('ct-repo-user')
  $revision       = hiera('ct-repo-revision')

  $group = $username

  group { $username:
    ensure  => present,
    gid     => 2000,
  }

  user { $username:
    ensure  => present,
    gid     => $group,
    require => Group[$group],
    uid     => 2000,
    home    => "/home/${username}",
    shell   => "/bin/bash",
    managehome  => true,
  }

  file { $checkout_path :
    ensure  => directory,
    group   => $group,
    owner   => $username,
    mode    => 0755,
    recurse => true,
  }

  file { '/home/${username}':
    ensure  => directory,
    group   => $group,
    owner   => $username,
    mode    => 0700,
  }

  package { 'git':
    ensure => installed,
  }

  vcsrepo { "${checkout_path}/${repo_name}":
    ensure   => latest,
    owner    => $owner,
    group    => $owner,
    provider => git,
    require  => [ Package["git"] ],
    source   => $git_repo_url,
    revision => $revision,
  }


} # class
