# Puppet: NRPE


Nagios NRPE


This module depends on repo_eden_rpm.


### Usage

##### nrpe

    # install
    include nrpe
    include nrpe::install

    # remove
    include nrpe::remove

    # user
    include nrpe::user
    include nrpe::user::remove

##### Depends on

     include repo_eden_rpm
     include nagios::user

### itens created

    /etc/init.d/nrpe
    /etc/nagios/nrpe.cfg
    /etc/profile.d/nrpe.sh
    /etc/xinetd.d/nrpe


# vim:ft=markdown

