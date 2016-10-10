# Puppet: Monit

This module depends on repo_eden_rpm.

Reference:

 * http://mmonit.com/monit/
 * http://mmonit.com/wiki/Monit/Installation
 * http://pkgs.repoforge.org/monit/


### Usage

##### monit

    # install
    include monit
    include monit::install

    # remove
    include monit::remove

    # user
    include monit::user
    include monit::user::remove

##### Depends on

     include repo_eden_rpm
     include nagios::user

### itens created

    /etc/init.d/monit
    /etc/monit
    /etc/monit.d


# vim:ft=markdown

