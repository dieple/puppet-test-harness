
class base::rules {

# require base

  ###
  ### Base rules
  ###

  #
  # prod: enforce restrictions
  #
  notice("tag_environment = [${::tag_environment}]")

  if $::tag_environment == 'prod' {

    include tools_adm::remove
    include tools_dev::remove
    include tools_net::remove
    include tools_sys::remove

  # include audit::install
  # include selinux::install
  # include security::install
  # include hardening::install

  }
  #
  # other environments: all tools available
  #
  else {

    include tools_adm::install  # htop, dstat, sysstat, screen
    include tools_dev::install  # make, gcc, *-devel
    include tools_net::install  # lsof, tcpdump, telnet, ftp, wget
    include tools_sys::install  # perl, man

  # include audit::remove
  # include selinux::remove
  # include security::remove
  # include hardening::remove

  } # if

  ##
  ## tag_machine
  ##

  notice("tag_machine = [${::tag_machine}]")

  if $::tag_machine != 'vagrant' {

    # NOT vagrant: vmware, amc, aws, etc.....
    notice( 'include users::vagrant::remove' )

  }

  if $::tag_machine == 'xenu' {
    notice('include xen_tools')
  }

  if $::tag_machine == 'aws' {
    notice('include aws_tools')
  }

  if $::tag_machine == 'vmware' {
    notice('include vmware_tools')
  }

  if $::tag_machine == 'vagrant' {
    notice('include vagrant_tools')
  }

} # end class

# vim:ft=puppet

