
define openssh::config ($value) {

    require openssh::params

    config { "openssh_conf_${name}":
#       file      => "${openssh::params::config_file}",
        file      => '/etc/ssh/sshd_config',
        line      => "${name} = ${value}",
        pattern   => "^${name} ",
        engine    => 'replaceline',
        notify    => Service['openssh'],
        require   => File['sshd_config'],
    }

}

# vim:ft=puppet:

