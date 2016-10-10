class ntp::install {

# require repo_centos62_eden

  require ntp::params
  require ntp::user

  package { 'ntp':
    ensure  => installed,
    name    => $ntp::params::pkg_name,
  }

  service { 'ntp':
    ensure     => running,
    name       => $ntp::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $ntp::params::has_status,
    pattern    => $ntp::params::process_name,
    require    => Package['ntp'],
    subscribe  => [ File[ $ntp::params::config_file ] ,
                    File[ $ntp::params::conf_file   ]
                  ]
  }

  ###
  ### Directories,files
  ###

  ### ntp-4.2.4p8
  ### rpm -qlv ntp | column -t  # {
  # drwxr-xr-x  2  root  root  0       Nov  29  2011  /etc/dhcp/dhclient.d
  # -rwxr-xr-x  1  root  root  1944    May  20  2009  /etc/dhcp/dhclient.d/ntp.sh
  # -rw-r--r--  1  root  root  1923    Jul  22  2009  /etc/ntp.conf
  # drwxr-x---  2  root  ntp   0       Nov  29  2011  /etc/ntp/crypto
  # -rw-------  1  root  root  173     May  20  2009  /etc/ntp/crypto/pw
  # -rwxr-xr-x  1  root  root  1923    Oct  22  2009  /etc/rc.d/init.d/ntpd
  # -rw-r--r--  1  root  root  85      May  20  2009  /etc/sysconfig/ntpd
  # -rwxr-xr-x  1  root  root  8920    Nov  29  2011  /usr/bin/ntpstat
  # -rwxr-xr-x  1  root  root  107456  Nov  29  2011  /usr/sbin/ntp-keygen
  # -rwxr-xr-x  1  root  root  614144  Nov  29  2011  /usr/sbin/ntpd
  # -rwxr-xr-x  1  root  root  190160  Nov  29  2011  /usr/sbin/ntpdc
  # -rwxr-xr-x  1  root  root  179728  Nov  29  2011  /usr/sbin/ntpq
  # -rwxr-xr-x  1  root  root  19896   Nov  29  2011  /usr/sbin/ntptime
  # -rwxr-xr-x  1  root  root  5816    Nov  29  2011  /usr/sbin/tickadj
  # drwxr-xr-x  2  root  root  0       Nov  29  2011  /usr/share/doc/ntp-4.2.4p8
  # -rw-r--r--  1  root  root  8866    Jan  8   2009  /usr/share/doc/ntp-4.2.4p8/COPYRIGHT
  # -rw-r--r--  1  root  root  16517   Dec  8   2009  /usr/share/doc/ntp-4.2.4p8/ChangeLog
  # -rw-r--r--  1  root  root  5416    Dec  8   2009  /usr/share/doc/ntp-4.2.4p8/NEWS
  # -rw-r--r--  1  root  root  3712    Nov  29  2011  /usr/share/man/man5/ntp.conf.5.gz
  # -rw-r--r--  1  root  root  3258    Nov  29  2011  /usr/share/man/man5/ntp_acc.5.gz
  # -rw-r--r--  1  root  root  7400    Nov  29  2011  /usr/share/man/man5/ntp_auth.5.gz
  # -rw-r--r--  1  root  root  3058    Nov  29  2011  /usr/share/man/man5/ntp_clock.5.gz
  # -rw-r--r--  1  root  root  4410    Nov  29  2011  /usr/share/man/man5/ntp_misc.5.gz
  # -rw-r--r--  1  root  root  4232    Nov  29  2011  /usr/share/man/man5/ntp_mon.5.gz
  # -rw-r--r--  1  root  root  7102    Nov  29  2011  /usr/share/man/man8/ntp-keygen.8.gz
  # -rw-r--r--  1  root  root  7346    Nov  29  2011  /usr/share/man/man8/ntpd.8.gz
  # -rw-r--r--  1  root  root  6929    Nov  29  2011  /usr/share/man/man8/ntpdc.8.gz
  # -rw-r--r--  1  root  root  7748    Nov  29  2011  /usr/share/man/man8/ntpq.8.gz
  # -rw-r--r--  1  root  root  388     Nov  29  2011  /usr/share/man/man8/ntpstat.8.gz
  # -rw-r--r--  1  root  root  662     Nov  29  2011  /usr/share/man/man8/ntptime.8.gz
  # -rw-r--r--  1  root  root  1468    Nov  29  2011  /usr/share/man/man8/tickadj.8.gz
  # drwxr-xr-x  2  ntp   ntp   0       Nov  29  2011  /var/lib/ntp
  # -rw-r--r--  1  ntp   ntp   0       Nov  29  2011  /var/lib/ntp/drift
  # drwxr-xr-x  2  ntp   ntp   0       Nov  29  2011  /var/log/ntpstats
    # }

  File { owner => 'ntp', group => 'ntp', mode => '0755', require => Package['ntp'] }

  ### Directories
  file {'/etc/ntp/crypto':    ensure => directory , mode => '0750' , owner => 'root' }
  file {'/var/log/ntpstats':  ensure => directory , mode => '0755' }
  file {'/var/lib/ntp':       ensure => directory , mode => '0755' }

  ### Files
  file {'/var/lib/ntp/drift': ensure => file , mode => '0644' }
  file {'/etc/ntp/crypto/pw': ensure => file , mode => '0600' , owner => 'root' , group => 'root' }

  ###
  ### Conf
  ###
  file { $ntp::params::config_file :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ntp/ntpd.sysconfig.sh',
    notify => Service['ntp']
  }

  file { $ntp::params::init_file :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/ntp/ntpd.init.sh',
  }

  file { $ntp::params::conf_file :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/ntp/ntp.conf',
  }

  ###
  ### Ntpdate
  ###

  ### ntpdate-4.2.4p8
  ### rpm -qlv ntp | column -t  # {
  # drwxr-xr-x  2  root  root  0      Nov  29  2011  /etc/ntp
  # -rw-------  1  root  root  73     Jul  18  2006  /etc/ntp/keys
  # -rw-r--r--  1  root  root  52     May  20  2009  /etc/ntp/step-tickers
  # -rwxr-xr-x  1  root  root  1866   Oct  22  2009  /etc/rc.d/init.d/ntpdate
  # -rw-r--r--  1  root  root  119    May  20  2009  /etc/sysconfig/ntpdate
  # -rwxr-xr-x  1  root  root  70864  Nov  29  2011  /usr/sbin/ntpdate
  # -rw-r--r--  1  root  root  2787   Nov  29  2011  /usr/share/man/man8/ntpdate.8.gz
  # }

  ### Directories
  file {'/etc/ntp':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  ###
  ### Conf
  ###
  file { $ntp::params::ntpdate_config_file :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ntp/ntpdate.sysconfig.sh',
  }

  file { $ntp::params::ntpdate_init_file :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/ntp/ntpdate.init.sh',
  }

  file { $ntp::params::ntpdate_conf_file :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ntp/ntp.keys',
  }


} # class

# vim:ft=puppet:

