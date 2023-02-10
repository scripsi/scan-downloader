#!/bin/sh

# PROVIDE: scandl
# REQUIRE: NETWORKING SYSLOG
# KEYWORD: 
#

#
# Add the following lines to /etc/rc.conf.local or /etc/rc.conf
# to enable this service:
#
# scandl_enable (bool):         Set to NO by default.
#                               Set it to YES to enable scandl.
#
# scandl_user (user):           Set user to run scandl.
#                               Default: scandl
#
# scandl_group (user):          Set group to run scandl.
#                               Default: www
#
# scandl_dir (path):            Directory where the scandl repository
#                               has been cloned.
#                               Default: /home/scandl/scandl
#                               
# scandl_log_file (path):       Scandl log file
#                               Default: /var/log/scandl.log
#

. /etc/rc.subr

name=scandl
rcvar=scandl_enable

load_rc_config $name

: ${scandl_enable:="NO"}
: ${scandl_dir:="/home/webmaster/scandl"}
: ${scandl_user:="webmaster"}
: ${scandl_group:="www"}

pidfile=/var/run/scandl.pid
command="/usr/sbin/daemon"
# command="/bin/echo"
command_args="-f -l daemon -s notice -T scandl /usr/bin/env -v -i OCR_INPUT_DIRECTORY=${scandl_dir}/in OCR_OUTPUT_DIRECTORY=${scandl_dir}/out OCR_ON_SUCCESS_DELETE=1 HOME=/home/${scandl_user} PATH=${PATH}:/usr/local/bin USER=${scandl_user} /usr/local/bin/python ${scandl_dir}/bin/watcher.py"

start_precmd=scandl_startprecmd

scandl_startprecmd()
{
        if [ ! -e ${pidfile} ]; then
                install -o ${scandl_user} -g ${scandl_group} /dev/null ${pidfile};
        fi
}

run_rc_command "$1"


