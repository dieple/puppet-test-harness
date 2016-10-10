#!/bin/bash
#

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

# Init file for Nagios NRPE
#
# Written by Dag Wieers <dag@wieers.com>.
#
# chkconfig: - 80 20
# description: Nagios NRPE daemon
#
# processname: nrpe
# config: /etc/nagios/nrpe.cfg
# pidfile: /var/run/nrpe

source /etc/rc.d/init.d/functions

### Default variables
CONFIG="/etc/nagios/nrpe.cfg"

[ -x /usr/sbin/nrpe ] || exit 1
[ -r "$CONFIG" ] || exit 1

RETVAL=0
prog="nrpe"
desc="Nagios NRPE daemon"

start() {
        echo -n $"Starting $desc ($prog): "
        daemon $prog -c "$CONFIG" -d
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && touch /var/lock/subsys/$prog
        return $RETVAL
}

stop() {
        echo -n $"Shutting down $desc ($prog): "
        killproc $prog
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/$prog
        return $RETVAL
}

restart() {
        stop
        start
}

reload() {
        echo -n $"Reloading $desc ($prog): "
        killproc $prog -HUP
        RETVAL=$?
        echo
        return $RETVAL
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        restart
        ;;
  reload)
        reload
        ;;
  condrestart)
        [ -e /var/lock/subsys/$prog ] && restart
        RETVAL=$?
        ;;
  status)
        status $prog
        RETVAL=$?
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
        RETVAL=1
esac

exit $RETVAL

# vim:ft=sh:

