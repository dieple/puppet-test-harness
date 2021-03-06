#!/bin/sh

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

/usr/sbin/logrotate /etc/logrotate.conf >/dev/null 2>&1
EXITVALUE=$?

if [ $EXITVALUE != 0 ]
then
  /usr/bin/logger -t logrotate "ALERT exited abnormally with [$EXITVALUE]"
fi
exit 0

# vim:ft=sh:

