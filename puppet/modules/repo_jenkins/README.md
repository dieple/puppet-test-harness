# Puppet: repo_jenkins

Jenkins rpm packages

### Built from

    # reference
    #     http://pkg.jenkins-ci.org/redhat/
    #
    wget http://pkg.jenkins-ci.org/redhat/jenkins.repo
    wget http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

### Usage

    # install
    include repo_jenkins
    include repo_jenkins::install

    # remove
    include repo_jenkins::remove

    # others
    include repo_jenkins::enable
    include repo_jenkins::disable


# vim:ft=markdown:

