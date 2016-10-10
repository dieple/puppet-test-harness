# Puppet: NTPD


NTP service

### References

  * http://www.pool.ntp.org/zone/br

### Usage

##### ntp

    # install
    include ntp
    include ntp::install

    # remove
    include ntp::remove

    # user
    include ntp::user
    include ntp::user::remove

### itens created

    /etc/ntp.conf
    /etc/init.d/ntpd
    /etc/sysconfig/ntpd
    /etc/sysconfig/ntpdate
    User:  ntp
    Group: ntp


# vim:ft=markdown

