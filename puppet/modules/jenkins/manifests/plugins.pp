class jenkins::plugins {

  ###
  ### my extra plugins
  ###

  # SCM
  jenkins::plugin { 'git':           version => '1.1.23' }

  #
  jenkins::plugin { 'greenballs':    version => '1.12'  }
  jenkins::plugin { 'chucknorris':   version => '0.4'   }
  jenkins::plugin { 'ansicolor':     version => '0.3.1' }
  jenkins::plugin { 'depgraph-view': version => '0.2'   }

  # code
  jenkins::plugin { 'all-changes':             version => '1.3'   }
# jenkins::plugin { 'rubyMetrics':             version => '1.5.0' }
# jenkins::plugin { 'job-poll-action-plugin':  version => '1.5.0' }

  # views
  jenkins::plugin { 'radiatorviewplugin':      version => '1.13'  }
  jenkins::plugin { 'countjobs-viewstabbar':   version => '1.0.0' }

  # Pipeline
  jenkins::plugin { 'build-pipeline-plugin':   version => '1.3.3' }

  # DSL
  jenkins::plugin { 'build-flow-plugin':       version => '0.5' }

  # UI
# jenkins::plugin { 'embeddable-build-status': version => '1.0' }


  # publishing
# jenkins::plugin { 's3':  version => '0.3.0' }

  # provisioning
# jenkins::plugin { 'ec2': version => '1.17'  }

# jenkins::plugin { 'gravatar':     version => '1.1'    }
# jenkins::plugin { 'github-oauth': version => '0.12'   }


} # class

