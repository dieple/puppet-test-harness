# Puppet: LogRotate


LogRotate


Logrotate is part of default distribution. This module enforces its
configuration files.

### Usage

##### logrotate

    # install
    include logrotate
    include logrotate::install

    # extras
    include logrotate::original  # original config

##### Depends on

### itens created

    /etc/init.d/logrotate
    /etc/logrotate.d/logrotate
    /etc/sysconfig/logrotate
    User:  logrotate
    Group: logrotate


# vim:ft=markdown

