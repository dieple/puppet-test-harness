# Puppet: Nagios


Nagios Alerting.

This module depends on repo_eden_rpm.

Plugins depends on:
 * fping
 * perl
 * perl-Crypt-DES
 * perl-Net-SNMP


### Usage

##### nagios

    # install
    include nagios::plugins

    # remove
    include nagios::plugins::remove

    # user
    include nagios::user
    include nagios::user::remove

##### Depends on

     include repo_eden_rpm
     include repo_centos62_eden

### itens created

    /etc/init.d/nrpe
    /etc/nagios/nrpe.cfg
    /etc/profile.d/nrpe.sh
    /usr/lib64/nagios/plugins/check_*


# vim:ft=markdown

