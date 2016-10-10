# Unix Users: user account ids

These are the ranges used by Puppet, scripts and RPM's to manage unix accounts.

Document here each new user/application/software to be created.

## Groups

    # gid   # name
    1000    app
    1000    rvm
    1001    ops
    1002    dev
    1003    nagios
    1004    nagioscmd
    1005    icinga
    1006    icingacmd
    1007    nrpe
    1008    redis
    1009    jenkins
    1010    nginx
    1011    newrelic
    1012    monit
    1013    git


## #1001 - 1999: pkg/support users

    # uid   # gid   # comment   # name
    1000    1000    App         app
    -       1000                rvm
    -
    1001    1001    Ops         ops
    -       1002    Dev         dev
    -
    1003    1003    Nagios      nagios
            1004    NagiosCMD   nagioscmd

    1005    1005    Icinga      icinga
            1006    IcingaCMD   icingacmd

    1007    1007    nrpe        nrpe
    1008    1008    redis       redis
    1009    1009    Jenkins     jenkins
    1010    1010    nginx       nginx
    1011    1011    newrelic    newrelic  # newrelic-sysmond
    1012    1012    monit       monit
    1013    1013    git         git
    1014    1014    mongod      mongod


## #2001 - 2999: app users

    # uid   # gid   # name
    2001    1000    dinda
    2002    1000    baby        # groupadd -g 1000 app
    2003    1000    eden        # useradd -g app -u 2002 baby 2>/dev/null || true
    2004    1000    cep
    2005    1000    ship

## #3001 - 3999: login users

    # uid   # gid   # name
    3001    1001    Marcus Vinicius Ferreira

# vim:ft=markdown

