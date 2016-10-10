# Puppet: yum

Setting /etc/yum* config files the way I like it.

For reference, original itens are kept in _*files/*_ directory
in case of reverting to the original CentOS install.

### Usage

    # install/remove
    include yum
    include yum::remove

    # restore
    include yum::original

