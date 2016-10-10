# Puppet: Jenkins


Jenkins-CI


This module depends on java::jre and repo_eden_rpm.

References:
  * http://jenkins-ci.org/
  * https://wiki.jenkins-ci.org/display/JENKINS/Plugins#Plugins-Byhand
  * https://updates.jenkins-ci.org/download/plugins/


### Usage

##### jenkins

    # install
    include jenkins
    include jenkins::install

    # remove
    include jenkins::remove

    # user
    include jenkins::user
    include jenkins::user::remove

    # plugins
    include jenkins::plugins
    include jenkins::plugins::remove


##### plugins

_*Plugins*_ is my defined set of basic Jenkins plugins I like to
work with. They are:

 * git
 * greenballs
 * radiatorviewplugin
 * chucknorris

If you would like to install any additional plugin you can use the
_*jenkins::plugin*_ function:


    jenkins::plugin { 'rubyMetrics': version => '1.5.0'  }
    jenkins::plugin { 'all-changes': version => '1.3'    }
    jenkins::plugin { 's3':          version => '0.3.0'  }


If no version is specified, 'latest' will be used.

Please note that plugin_*S*_ is a script to a bunch of plugins and
_*plugin*_ is a function to install just on plugin.


##### Depends on

    repo_eden_rpm
    java::jre

### itens created

    User:  jenkins
    Group: jenkins
    /etc/init.d/jenkins
    /etc/logrotate.d/jenkins
    /etc/sysconfig/jenkins
    /var/lib/jenkins/plugins/git.hpi


# vim:ft=markdown

