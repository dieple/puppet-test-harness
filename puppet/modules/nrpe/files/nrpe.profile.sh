#!/bin/bash

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

dir=/usr/lib64/nagios/plugins

# Add only once to PATH
[ -d $dir ] && echo $PATH | grep ${dir} > /dev/null || export PATH=$PATH:${dir}


# vim:ft=sh:

